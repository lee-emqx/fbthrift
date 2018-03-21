#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.vector cimport vector as vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref, typeid
from cpython.ref cimport PyObject
from thrift.py3.client cimport cRequestChannel_ptr, makeClientWrapper, destroyInEventBaseThread
from thrift.py3.exceptions cimport try_make_shared_exception, create_py_exception
from folly cimport cFollyTry, cFollyUnit, c_unit
from libcpp.typeinfo cimport type_info
import thrift.py3.types
cimport thrift.py3.types
import thrift.py3.client
cimport thrift.py3.client
from folly.futures cimport bridgeFutureWith
from folly.executor cimport get_executor
cimport cython

import asyncio
import sys
import types as _py_types

cimport service.types as _service_types
import service.types as _service_types
cimport module.types as _module_types
import module.types as _module_types
cimport includes.types as _includes_types
import includes.types as _includes_types

from service.clients_wrapper cimport cMyServiceAsyncClient, cMyServiceClientWrapper


cdef void MyService_query_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception()))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))

cdef void MyService_has_arg_docs_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    if result.hasException():
        pyfuture.set_exception(create_py_exception(result.exception()))
    else:
        try:
            pyfuture.set_result(None)
        except Exception as ex:
            pyfuture.set_exception(ex.with_traceback(None))


cdef object _MyService_annotations = _py_types.MappingProxyType({
})


cdef class MyService(thrift.py3.client.Client):
    annotations = _MyService_annotations

    def __cinit__(MyService self):
        loop = asyncio.get_event_loop()
        self._deferred_headers = {}
        self._connect_future = loop.create_future()
        self._executor = get_executor()

    cdef const type_info* _typeid(MyService self):
        return &typeid(cMyServiceAsyncClient)

    @staticmethod
    cdef _service_MyService_set_client(MyService inst, shared_ptr[cMyServiceClientWrapper] c_obj):
        """So the class hierarchy talks to the correct pointer type"""
        inst._service_MyService_client = c_obj

    cdef _service_MyService_reset_client(MyService self):
        """So the class hierarchy resets the shared pointer up the chain"""
        self._service_MyService_client.reset()

    def __dealloc__(MyService self):
        if self._cRequestChannel or self._service_MyService_client:
            print('client was not cleaned up, use the async context manager', file=sys.stderr)
            if self._service_MyService_client:
                deref(self._service_MyService_client).disconnect().get()
            else:
                destroyInEventBaseThread(thrift.py3.client.move(self._cRequestChannel))

    async def __aenter__(MyService self):
        await self._connect_future
        if self._cRequestChannel:
            MyService._service_MyService_set_client(
                self,
                makeClientWrapper[cMyServiceAsyncClient, cMyServiceClientWrapper](
                    thrift.py3.client.move(self._cRequestChannel)
                ),
            )
        else:
            raise asyncio.InvalidStateError('Client context has been used already')
        for key, value in self._deferred_headers.items():
            self.set_persistent_header(key, value)
        self._deferred_headers = None
        return self

    async def __aexit__(MyService self, *exc):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._service_MyService_client).disconnect(),
            closed_MyService_py3_client_callback,
            <PyObject *>future
        )
        # To break any future usage of this client
        badfuture = loop.create_future()
        badfuture.set_exception(asyncio.InvalidStateError('Client Out of Context'))
        badfuture.exception()
        self._connect_future = badfuture
        await future
        self._service_MyService_reset_client()

    def set_persistent_header(MyService self, str key, str value):
        if not self._service_MyService_client:
            self._deferred_headers[key] = value
            return

        cdef string ckey = <bytes> key.encode('utf-8')
        cdef string cvalue = <bytes> value.encode('utf-8')
        deref(self._service_MyService_client).setPersistentHeader(ckey, cvalue)

    @cython.always_allow_keywords(True)
    async def query(
            MyService self,
            _module_types.MyStruct s not None,
            _includes_types.Included i not None
    ):
        self._check_connect_future()
        __loop = asyncio.get_event_loop()
        __future = __loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._service_MyService_client).query(
                deref((<_module_types.MyStruct>s)._cpp_obj),
                deref((<_includes_types.Included>i)._cpp_obj),
            ),
            MyService_query_callback,
            <PyObject *> __future
        )
        return await __future

    @cython.always_allow_keywords(True)
    async def has_arg_docs(
            MyService self,
            _module_types.MyStruct s not None,
            _includes_types.Included i not None
    ):
        self._check_connect_future()
        __loop = asyncio.get_event_loop()
        __future = __loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._service_MyService_client).has_arg_docs(
                deref((<_module_types.MyStruct>s)._cpp_obj),
                deref((<_includes_types.Included>i)._cpp_obj),
            ),
            MyService_has_arg_docs_callback,
            <PyObject *> __future
        )
        return await __future



cdef void closed_MyService_py3_client_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* fut,
):
    cdef object pyfuture = <object> fut
    pyfuture.set_result(None)
