#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
cimport cython as __cython
from cpython.bytes cimport PyBytes_AsStringAndSize
from cpython.object cimport PyTypeObject, Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, Py_GE
from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc, address as ptr_address
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET as __NOTSET
from thrift.py3.types cimport (
    translate_cpp_enum_to_python,
    SetMetaClass as __SetMetaClass,
    constant_shared_ptr,
)
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer import Protocol as __Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
import folly.iobuf as __iobuf
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
import warnings
import builtins as _builtins


cdef cFoo _Foo_defaults = cFoo()

cdef class Foo(thrift.py3.types.Struct):

    def __init__(
        Foo self, *,
        a=None
    ):
        if a is not None:
            if not isinstance(a, int):
                raise TypeError(f'a is not a { int !r}.')
            a = <int64_t> a

        self._cpp_obj = move(Foo._make_instance(
          NULL,
          NULL,
          a,
        ))

    def __call__(
        Foo self,
        a=__NOTSET
    ):
        ___NOTSET = __NOTSET  # Cheaper for larger structs
        cdef bint[1] __isNOTSET  # so make_instance is typed

        changes = False
        if a is ___NOTSET:
            __isNOTSET[0] = True
            a = None
        else:
            __isNOTSET[0] = False
            changes = True


        if not changes:
            return self

        if a is not None:
            if not isinstance(a, int):
                raise TypeError(f'a is not a { int !r}.')
            a = <int64_t> a

        inst = <Foo>Foo.__new__(Foo)
        inst._cpp_obj = move(Foo._make_instance(
          self._cpp_obj.get(),
          __isNOTSET,
          a,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cFoo] _make_instance(
        cFoo* base_instance,
        bint* __isNOTSET,
        object a 
    ) except *:
        cdef unique_ptr[cFoo] c_inst
        if base_instance:
            c_inst = make_unique[cFoo](deref(base_instance))
        else:
            c_inst = make_unique[cFoo]()

        if base_instance:
            # Convert None's to default value. (or unset)
            if not __isNOTSET[0] and a is None:
                deref(c_inst).a = _Foo_defaults.a
                deref(c_inst).__isset.a = False
                pass

        if a is not None:
            deref(c_inst).a = a
            deref(c_inst).__isset.a = True
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'a', self.a

    def __bool__(self):
        return True

    @staticmethod
    cdef create(shared_ptr[cFoo] cpp_obj):
        inst = <Foo>Foo.__new__(Foo)
        inst._cpp_obj = move_shared(cpp_obj)
        return inst

    @property
    def a(self):

        return deref(self._cpp_obj).a


    def __hash__(Foo self):
        if not self.__hash:
            self.__hash = hash((
            self.a,
            ))
        return self.__hash

    def __repr__(Foo self):
        return f'Foo(a={repr(self.a)})'
    def __copy__(Foo self):
        cdef shared_ptr[cFoo] cpp_obj = make_shared[cFoo](
            deref(self._cpp_obj)
        )
        return Foo.create(move_shared(cpp_obj))

    def __richcmp__(self, other, op):
        cdef int cop = op
        if not (
                isinstance(self, Foo) and
                isinstance(other, Foo)):
            if cop == Py_EQ:  # different types are never equal
                return False
            elif cop == Py_NE:  # different types are always notequal
                return True
            else:
                return NotImplemented

        cdef cFoo cself = deref((<Foo>self)._cpp_obj)
        cdef cFoo cother = deref((<Foo>other)._cpp_obj)
        if cop == Py_EQ:
            return cself == cother
        elif cop == Py_NE:
            return not (cself == cother)
        elif cop == Py_LT:
            return cself < cother
        elif cop == Py_LE:
            return cself <= cother
        elif cop == Py_GT:
            return cself > cother
        elif cop == Py_GE:
            return cself >= cother
        else:
            return NotImplemented

    cdef __iobuf.IOBuf _serialize(Foo self, proto):
        cdef __iobuf.cIOBufQueue queue = __iobuf.cIOBufQueue(__iobuf.cacheChainLength())
        cdef cFoo* cpp_obj = self._cpp_obj.get()
        if proto is __Protocol.COMPACT:
            with nogil:
                serializer.CompactSerialize[cFoo](deref(cpp_obj), &queue, serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.BINARY:
            with nogil:
                serializer.BinarySerialize[cFoo](deref(cpp_obj), &queue, serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.JSON:
            with nogil:
                serializer.JSONSerialize[cFoo](deref(cpp_obj), &queue, serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.COMPACT_JSON:
            with nogil:
                serializer.CompactJSONSerialize[cFoo](deref(cpp_obj), &queue, serializer.SHARE_EXTERNAL_BUFFER)
        return __iobuf.from_unique_ptr(queue.move())

    cdef uint32_t _deserialize(Foo self, const __iobuf.cIOBuf* buf, proto) except? 0:
        cdef uint32_t needed
        self._cpp_obj = make_shared[cFoo]()
        cdef cFoo* cpp_obj = self._cpp_obj.get()
        if proto is __Protocol.COMPACT:
            with nogil:
                needed = serializer.CompactDeserialize[cFoo](buf, deref(cpp_obj), serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.BINARY:
            with nogil:
                needed = serializer.BinaryDeserialize[cFoo](buf, deref(cpp_obj), serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.JSON:
            with nogil:
                needed = serializer.JSONDeserialize[cFoo](buf, deref(cpp_obj), serializer.SHARE_EXTERNAL_BUFFER)
        elif proto is __Protocol.COMPACT_JSON:
            with nogil:
                needed = serializer.CompactJSONDeserialize[cFoo](buf, deref(cpp_obj), serializer.SHARE_EXTERNAL_BUFFER)
        return needed

    def __reduce__(self):
        return (deserialize, (Foo, serialize(self)))


ExampleFoo = Foo.create(constant_shared_ptr(cExampleFoo()))
