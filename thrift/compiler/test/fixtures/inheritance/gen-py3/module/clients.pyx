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

cimport module.types as _module_types
import module.types as _module_types

from module.clients_wrapper cimport cMyRootAsyncClient, cMyRootClientWrapper
from module.clients_wrapper cimport cMyNodeAsyncClient, cMyNodeClientWrapper
from module.clients_wrapper cimport cMyLeafAsyncClient, cMyLeafClientWrapper


cdef void MyRoot_do_root_callback(
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

cdef void MyNode_do_mid_callback(
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

cdef void MyLeaf_do_leaf_callback(
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


cdef object _MyRoot_annotations = _py_types.MappingProxyType({
})


cdef class MyRoot(thrift.py3.client.Client):
    annotations = _MyRoot_annotations

    def __cinit__(MyRoot self):
        loop = asyncio.get_event_loop()
        self._deferred_headers = {}
        self._connect_future = loop.create_future()
        self._executor = get_executor()

    cdef const type_info* _typeid(MyRoot self):
        return &typeid(cMyRootAsyncClient)

    @staticmethod
    cdef _module_MyRoot_set_client(MyRoot inst, shared_ptr[cMyRootClientWrapper] c_obj):
        """So the class hierarchy talks to the correct pointer type"""
        inst._module_MyRoot_client = c_obj

    cdef _module_MyRoot_reset_client(MyRoot self):
        """So the class hierarchy resets the shared pointer up the chain"""
        self._module_MyRoot_client.reset()

    def __dealloc__(MyRoot self):
        if self._cRequestChannel or self._module_MyRoot_client:
            print('client was not cleaned up, use the async context manager', file=sys.stderr)
            if self._module_MyRoot_client:
                deref(self._module_MyRoot_client).disconnect().get()
            else:
                destroyInEventBaseThread(thrift.py3.client.move(self._cRequestChannel))

    async def __aenter__(MyRoot self):
        await self._connect_future
        if self._cRequestChannel:
            MyRoot._module_MyRoot_set_client(
                self,
                makeClientWrapper[cMyRootAsyncClient, cMyRootClientWrapper](
                    thrift.py3.client.move(self._cRequestChannel)
                ),
            )
        else:
            raise asyncio.InvalidStateError('Client context has been used already')
        for key, value in self._deferred_headers.items():
            self.set_persistent_header(key, value)
        self._deferred_headers = None
        return self

    async def __aexit__(MyRoot self, *exc):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyRoot_client).disconnect(),
            closed_MyRoot_py3_client_callback,
            <PyObject *>future
        )
        # To break any future usage of this client
        badfuture = loop.create_future()
        badfuture.set_exception(asyncio.InvalidStateError('Client Out of Context'))
        badfuture.exception()
        self._connect_future = badfuture
        await future
        self._module_MyRoot_reset_client()

    def set_persistent_header(MyRoot self, str key, str value):
        if not self._module_MyRoot_client:
            self._deferred_headers[key] = value
            return

        cdef string ckey = <bytes> key.encode('utf-8')
        cdef string cvalue = <bytes> value.encode('utf-8')
        deref(self._module_MyRoot_client).setPersistentHeader(ckey, cvalue)

    @cython.always_allow_keywords(True)
    async def do_root(
            MyRoot self
    ):
        self._check_connect_future()
        __loop = asyncio.get_event_loop()
        __future = __loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyRoot_client).do_root(
            ),
            MyRoot_do_root_callback,
            <PyObject *> __future
        )
        return await __future



cdef void closed_MyRoot_py3_client_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* fut,
):
    cdef object pyfuture = <object> fut
    pyfuture.set_result(None)
cdef object _MyNode_annotations = _py_types.MappingProxyType({
})


cdef class MyNode(MyRoot):
    annotations = _MyNode_annotations

    def __cinit__(MyNode self):
        loop = asyncio.get_event_loop()
        self._deferred_headers = {}
        self._connect_future = loop.create_future()
        self._executor = get_executor()

    cdef const type_info* _typeid(MyNode self):
        return &typeid(cMyNodeAsyncClient)

    @staticmethod
    cdef _module_MyNode_set_client(MyNode inst, shared_ptr[cMyNodeClientWrapper] c_obj):
        """So the class hierarchy talks to the correct pointer type"""
        inst._module_MyNode_client = c_obj
        MyRoot._module_MyRoot_set_client(inst, <shared_ptr[cMyRootClientWrapper]>c_obj)

    cdef _module_MyNode_reset_client(MyNode self):
        """So the class hierarchy resets the shared pointer up the chain"""
        self._module_MyNode_client.reset()
        MyRoot._module_MyRoot_reset_client(self)

    def __dealloc__(MyNode self):
        if self._cRequestChannel or self._module_MyNode_client:
            print('client was not cleaned up, use the async context manager', file=sys.stderr)
            if self._module_MyNode_client:
                deref(self._module_MyNode_client).disconnect().get()
            else:
                destroyInEventBaseThread(thrift.py3.client.move(self._cRequestChannel))

    async def __aenter__(MyNode self):
        await self._connect_future
        if self._cRequestChannel:
            MyNode._module_MyNode_set_client(
                self,
                makeClientWrapper[cMyNodeAsyncClient, cMyNodeClientWrapper](
                    thrift.py3.client.move(self._cRequestChannel)
                ),
            )
        else:
            raise asyncio.InvalidStateError('Client context has been used already')
        for key, value in self._deferred_headers.items():
            self.set_persistent_header(key, value)
        self._deferred_headers = None
        return self

    async def __aexit__(MyNode self, *exc):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyNode_client).disconnect(),
            closed_MyNode_py3_client_callback,
            <PyObject *>future
        )
        # To break any future usage of this client
        badfuture = loop.create_future()
        badfuture.set_exception(asyncio.InvalidStateError('Client Out of Context'))
        badfuture.exception()
        self._connect_future = badfuture
        await future
        self._module_MyNode_reset_client()

    def set_persistent_header(MyNode self, str key, str value):
        if not self._module_MyNode_client:
            self._deferred_headers[key] = value
            return

        cdef string ckey = <bytes> key.encode('utf-8')
        cdef string cvalue = <bytes> value.encode('utf-8')
        deref(self._module_MyNode_client).setPersistentHeader(ckey, cvalue)

    @cython.always_allow_keywords(True)
    async def do_mid(
            MyNode self
    ):
        self._check_connect_future()
        __loop = asyncio.get_event_loop()
        __future = __loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyNode_client).do_mid(
            ),
            MyNode_do_mid_callback,
            <PyObject *> __future
        )
        return await __future



cdef void closed_MyNode_py3_client_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* fut,
):
    cdef object pyfuture = <object> fut
    pyfuture.set_result(None)
cdef object _MyLeaf_annotations = _py_types.MappingProxyType({
})


cdef class MyLeaf(MyNode):
    annotations = _MyLeaf_annotations

    def __cinit__(MyLeaf self):
        loop = asyncio.get_event_loop()
        self._deferred_headers = {}
        self._connect_future = loop.create_future()
        self._executor = get_executor()

    cdef const type_info* _typeid(MyLeaf self):
        return &typeid(cMyLeafAsyncClient)

    @staticmethod
    cdef _module_MyLeaf_set_client(MyLeaf inst, shared_ptr[cMyLeafClientWrapper] c_obj):
        """So the class hierarchy talks to the correct pointer type"""
        inst._module_MyLeaf_client = c_obj
        MyNode._module_MyNode_set_client(inst, <shared_ptr[cMyNodeClientWrapper]>c_obj)

    cdef _module_MyLeaf_reset_client(MyLeaf self):
        """So the class hierarchy resets the shared pointer up the chain"""
        self._module_MyLeaf_client.reset()
        MyNode._module_MyNode_reset_client(self)

    def __dealloc__(MyLeaf self):
        if self._cRequestChannel or self._module_MyLeaf_client:
            print('client was not cleaned up, use the async context manager', file=sys.stderr)
            if self._module_MyLeaf_client:
                deref(self._module_MyLeaf_client).disconnect().get()
            else:
                destroyInEventBaseThread(thrift.py3.client.move(self._cRequestChannel))

    async def __aenter__(MyLeaf self):
        await self._connect_future
        if self._cRequestChannel:
            MyLeaf._module_MyLeaf_set_client(
                self,
                makeClientWrapper[cMyLeafAsyncClient, cMyLeafClientWrapper](
                    thrift.py3.client.move(self._cRequestChannel)
                ),
            )
        else:
            raise asyncio.InvalidStateError('Client context has been used already')
        for key, value in self._deferred_headers.items():
            self.set_persistent_header(key, value)
        self._deferred_headers = None
        return self

    async def __aexit__(MyLeaf self, *exc):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyLeaf_client).disconnect(),
            closed_MyLeaf_py3_client_callback,
            <PyObject *>future
        )
        # To break any future usage of this client
        badfuture = loop.create_future()
        badfuture.set_exception(asyncio.InvalidStateError('Client Out of Context'))
        badfuture.exception()
        self._connect_future = badfuture
        await future
        self._module_MyLeaf_reset_client()

    def set_persistent_header(MyLeaf self, str key, str value):
        if not self._module_MyLeaf_client:
            self._deferred_headers[key] = value
            return

        cdef string ckey = <bytes> key.encode('utf-8')
        cdef string cvalue = <bytes> value.encode('utf-8')
        deref(self._module_MyLeaf_client).setPersistentHeader(ckey, cvalue)

    @cython.always_allow_keywords(True)
    async def do_leaf(
            MyLeaf self
    ):
        self._check_connect_future()
        __loop = asyncio.get_event_loop()
        __future = __loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_MyLeaf_client).do_leaf(
            ),
            MyLeaf_do_leaf_callback,
            <PyObject *> __future
        )
        return await __future



cdef void closed_MyLeaf_py3_client_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* fut,
):
    cdef object pyfuture = <object> fut
    pyfuture.set_result(None)
