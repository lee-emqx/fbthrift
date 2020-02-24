/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#include <thrift/lib/cpp2/gen/module_metadata_cpp.h>
#include "thrift/compiler/test/fixtures/constants/gen-cpp2/module_metadata.h"

namespace apache {
namespace thrift {
namespace detail {
namespace md {
using ThriftMetadata = ::apache::thrift::metadata::ThriftMetadata;
using ThriftPrimitiveType = ::apache::thrift::metadata::ThriftPrimitiveType;
using ThriftType = ::apache::thrift::metadata::ThriftType;
using ThriftService = ::apache::thrift::metadata::ThriftService;
using ThriftServiceContext = ::apache::thrift::metadata::ThriftServiceContext;
using ThriftFunctionGenerator = void (*)(ThriftMetadata&, ThriftService&);

void EnumMetadata<::cpp2::EmptyEnum>::gen(ThriftMetadata& metadata) {
  auto res = metadata.enums.emplace("module.EmptyEnum", ::apache::thrift::metadata::ThriftEnum{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftEnum& enum_metadata = res.first->second;
  enum_metadata.name = "module.EmptyEnum";
  for (const auto& p : ::cpp2::_EmptyEnum_VALUES_TO_NAMES) {
    enum_metadata.elements.emplace(static_cast<int32_t>(p.first), p.second) ;
  }
}
void EnumMetadata<::cpp2::City>::gen(ThriftMetadata& metadata) {
  auto res = metadata.enums.emplace("module.City", ::apache::thrift::metadata::ThriftEnum{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftEnum& enum_metadata = res.first->second;
  enum_metadata.name = "module.City";
  for (const auto& p : ::cpp2::_City_VALUES_TO_NAMES) {
    enum_metadata.elements.emplace(static_cast<int32_t>(p.first), p.second) ;
  }
}
void EnumMetadata<::cpp2::Company>::gen(ThriftMetadata& metadata) {
  auto res = metadata.enums.emplace("module.Company", ::apache::thrift::metadata::ThriftEnum{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftEnum& enum_metadata = res.first->second;
  enum_metadata.name = "module.Company";
  for (const auto& p : ::cpp2::_Company_VALUES_TO_NAMES) {
    enum_metadata.elements.emplace(static_cast<int32_t>(p.first), p.second) ;
  }
}

void StructMetadata<::cpp2::Internship>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.Internship", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_Internship = res.first->second;
  module_Internship.name = "module.Internship";
  module_Internship.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_Internship_fields[] = {
    std::make_tuple(1, "weeks", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "title", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_STRING_TYPE)),
    std::make_tuple(3, "employer", true, std::make_unique<Enum< ::cpp2::Company>>("module.Company", metadata)),
  };
  for (const auto& f : module_Internship_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_Internship.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::UnEnumStruct>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.UnEnumStruct", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_UnEnumStruct = res.first->second;
  module_UnEnumStruct.name = "module.UnEnumStruct";
  module_UnEnumStruct.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_UnEnumStruct_fields[] = {
    std::make_tuple(1, "city", false, std::make_unique<Enum< ::cpp2::City>>("module.City", metadata)),
  };
  for (const auto& f : module_UnEnumStruct_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_UnEnumStruct.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::Range>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.Range", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_Range = res.first->second;
  module_Range.name = "module.Range";
  module_Range.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_Range_fields[] = {
    std::make_tuple(1, "min", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "max", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
  };
  for (const auto& f : module_Range_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_Range.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::struct1>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.struct1", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_struct1 = res.first->second;
  module_struct1.name = "module.struct1";
  module_struct1.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_struct1_fields[] = {
    std::make_tuple(1, "a", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "b", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_STRING_TYPE)),
  };
  for (const auto& f : module_struct1_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_struct1.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::struct2>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.struct2", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_struct2 = res.first->second;
  module_struct2.name = "module.struct2";
  module_struct2.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_struct2_fields[] = {
    std::make_tuple(1, "a", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "b", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_STRING_TYPE)),
    std::make_tuple(3, "c", false, std::make_unique<Struct< ::cpp2::struct1>>("module.struct1", metadata)),
    std::make_tuple(4, "d", false, std::make_unique<List>(std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE))),
  };
  for (const auto& f : module_struct2_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_struct2.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::struct3>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.struct3", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_struct3 = res.first->second;
  module_struct3.name = "module.struct3";
  module_struct3.is_union = false;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_struct3_fields[] = {
    std::make_tuple(1, "a", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_STRING_TYPE)),
    std::make_tuple(2, "b", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(3, "c", false, std::make_unique<Struct< ::cpp2::struct2>>("module.struct2", metadata)),
  };
  for (const auto& f : module_struct3_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_struct3.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::union1>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.union1", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_union1 = res.first->second;
  module_union1.name = "module.union1";
  module_union1.is_union = true;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_union1_fields[] = {
    std::make_tuple(1, "i", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "d", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_DOUBLE_TYPE)),
  };
  for (const auto& f : module_union1_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_union1.fields.push_back(std::move(field));
  }
}
void StructMetadata<::cpp2::union2>::gen(ThriftMetadata& metadata) {
  auto res = metadata.structs.emplace("module.union2", ::apache::thrift::metadata::ThriftStruct{});
  if (!res.second) {
    return;
  }
  ::apache::thrift::metadata::ThriftStruct& module_union2 = res.first->second;
  module_union2.name = "module.union2";
  module_union2.is_union = true;
  static const std::tuple<int32_t, const char*, bool, std::unique_ptr<MetadataTypeInterface>>
  module_union2_fields[] = {
    std::make_tuple(1, "i", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_I32_TYPE)),
    std::make_tuple(2, "d", false, std::make_unique<Primitive>(ThriftPrimitiveType::THRIFT_DOUBLE_TYPE)),
    std::make_tuple(3, "s", false, std::make_unique<Struct< ::cpp2::struct1>>("module.struct1", metadata)),
    std::make_tuple(4, "u", false, std::make_unique<Union< ::cpp2::union1>>("module.union1", metadata)),
  };
  for (const auto& f : module_union2_fields) {
    ::apache::thrift::metadata::ThriftField field;
    field.id = std::get<0>(f);
    field.name = std::get<1>(f);
    field.is_optional = std::get<2>(f);
    std::get<3>(f)->initialize(field.type);
    module_union2.fields.push_back(std::move(field));
  }
}

} // namespace md
} // namespace detail
} // namespace thrift
} // namespace apache
