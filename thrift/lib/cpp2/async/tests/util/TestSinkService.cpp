/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "thrift/lib/cpp2/async/tests/util/TestSinkService.h"

#include <folly/ScopeGuard.h>

#include <gtest/gtest.h>

namespace testutil {
namespace testservice {

apache::thrift::SinkConsumer<int32_t, bool> TestSinkService::range(
    int32_t from,
    int32_t to) {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [from, to](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<bool> {
        int32_t i = from;
        while (auto item = co_await gen.next()) {
          EXPECT_EQ(i++, *item);
        }
        EXPECT_EQ(i, to + 1);
        co_return true;
      },
      10 /* buffer size */
  };
}

apache::thrift::SinkConsumer<int32_t, bool> TestSinkService::rangeThrow(
    int32_t from,
    int32_t) {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [from](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<bool> {
        bool throwed = false;
        try {
          int32_t i = from;
          while (auto item = co_await gen.next()) {
            EXPECT_EQ(i++, *item);
          }
        } catch (const std::exception& ex) {
          throwed = true;
          EXPECT_EQ("std::runtime_error: test", std::string(ex.what()));
        }
        EXPECT_TRUE(throwed);
        co_return true;
      },
      10 /* buffer size */
  };
}

apache::thrift::SinkConsumer<int32_t, bool>
TestSinkService::rangeFinalResponseThrow(int32_t from, int32_t) {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [from](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<bool> {
        int32_t i = from;
        int counter = 5;
        while (auto item = co_await gen.next()) {
          if (counter-- > 0) {
            break;
          }
          EXPECT_EQ(i++, *item);
        }
        throw std::runtime_error("test");
      },
      10 /* buffer size */
  };
}

apache::thrift::SinkConsumer<int32_t, int32_t>
TestSinkService::rangeEarlyResponse(int32_t from, int32_t, int32_t early) {
  return apache::thrift::SinkConsumer<int32_t, int32_t>{
      [from, early](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<int32_t> {
        int32_t i = from;
        while (auto item = co_await gen.next()) {
          EXPECT_EQ(i++, *item);
          if (i == early) {
            co_return early;
          }
        }
        // shouldn't reach here
        co_return - 1;
      },
      10 /* buffer size */
  };
}

apache::thrift::SinkConsumer<int32_t, bool>
TestSinkService::unSubscribedSink() {
  activeSinks_++;
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [g = folly::makeGuard([this]() { activeSinks_--; })](
          folly::coro::AsyncGenerator<int32_t&&> gen) mutable
      -> folly::coro::Task<bool> {
        EXPECT_THROW(
            co_await gen.next(), apache::thrift::TApplicationException);
        co_return true;
      },
      10 /* buffer size */
  };
}

folly::SemiFuture<apache::thrift::SinkConsumer<int32_t, bool>>
TestSinkService::semifuture_unSubscribedSinkSlowReturn() {
  return folly::futures::sleep(std::chrono::seconds(1)).deferValue([=](auto&&) {
    activeSinks_++;
    return apache::thrift::SinkConsumer<int32_t, bool>{
        [g = folly::makeGuard([this]() { activeSinks_--; })](
            folly::coro::AsyncGenerator<int32_t&&> gen) mutable
        -> folly::coro::Task<bool> {
          co_await gen.next();
          co_return true;
        },
        10 /* buffer size */
    };
  });
}

bool TestSinkService::isSinkUnSubscribed() {
  return activeSinks_ == 0;
}

apache::thrift::ResponseAndSinkConsumer<bool, int32_t, bool>
TestSinkService::initialThrow() {
  MyException ex;
  ex.reason = "reason";
  throw ex;
}

apache::thrift::SinkConsumer<int32_t, bool>
TestSinkService::rangeChunkTimeout() {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<bool> {
        EXPECT_THROW(
            co_await[&]()->folly::coro::Task<void> {
              int32_t i = 0;
              while (auto item = co_await gen.next()) {
                EXPECT_EQ(i++, *item);
              }
            }(),
            apache::thrift::TApplicationException);
        co_return true;
      },
      10 /* buffer size */
  }
      .setChunkTimeout(std::chrono::milliseconds(200));
}

apache::thrift::SinkConsumer<int32_t, bool> TestSinkService::sinkThrow() {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [](folly::coro::AsyncGenerator<int32_t&&> gen)
          -> folly::coro::Task<bool> {
        bool throwed = false;
        try {
          while (auto item = co_await gen.next()) {
          }
        } catch (const SinkException& ex) {
          throwed = true;
          EXPECT_EQ("test", ex.reason);
        } catch (const std::exception& ex) {
          LOG(ERROR) << "catched unexpected exception " << ex.what();
        }
        EXPECT_TRUE(throwed);
        co_return true;
      },
      10 /* buffer size */
  };
}

apache::thrift::SinkConsumer<int32_t, bool> TestSinkService::sinkFinalThrow() {
  return apache::thrift::SinkConsumer<int32_t, bool>{
      [](folly::coro::AsyncGenerator<int32_t&&>) -> folly::coro::Task<bool> {
        FinalException ex;
        ex.reason = "test";
        throw ex;
      },
      10 /* buffer size */
  };
}

void TestSinkService::purge() {}

apache::thrift::SinkConsumer<std::string, int32_t> TestSinkService::sinkBlobs(
    int32_t count) {
  return apache::thrift::SinkConsumer<std::string, int32_t>{
      [count](folly::coro::AsyncGenerator<std::string&&> gen)
          -> folly::coro::Task<int32_t> {
        int32_t i = 0;
        int32_t size = 0;
        while (auto item = co_await gen.next()) {
          i++;
          size += item->size();
        }
        EXPECT_EQ(i, count);
        co_return size;
      },
      10 /* buffer size */
  };
}

} // namespace testservice
} // namespace testutil
