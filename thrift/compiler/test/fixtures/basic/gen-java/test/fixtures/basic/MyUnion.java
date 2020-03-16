/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package test.fixtures.basic;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.HashSet;
import java.util.Collections;
import java.util.BitSet;
import java.util.Arrays;
import com.facebook.thrift.*;
import com.facebook.thrift.annotations.*;
import com.facebook.thrift.async.*;
import com.facebook.thrift.meta_data.*;
import com.facebook.thrift.server.*;
import com.facebook.thrift.transport.*;
import com.facebook.thrift.protocol.*;

@SuppressWarnings({ "unused", "serial", "unchecked" })
public class MyUnion extends TUnion<MyUnion> implements Comparable<MyUnion> {
  private static final TStruct STRUCT_DESC = new TStruct("MyUnion");
  private static final TField MY_ENUM_FIELD_DESC = new TField("myEnum", TType.I32, (short)1);
  private static final TField MY_STRUCT_FIELD_DESC = new TField("myStruct", TType.STRUCT, (short)2);
  private static final TField MY_DATA_ITEM_FIELD_DESC = new TField("myDataItem", TType.STRUCT, (short)3);

  public static final int MYENUM = 1;
  public static final int MYSTRUCT = 2;
  public static final int MYDATAITEM = 3;

  public static final Map<Integer, FieldMetaData> metaDataMap;

  static {
    Map<Integer, FieldMetaData> tmpMetaDataMap = new HashMap<Integer, FieldMetaData>();
    tmpMetaDataMap.put(MYENUM, new FieldMetaData("myEnum", TFieldRequirementType.DEFAULT, 
        new FieldValueMetaData(TType.I32)));
    tmpMetaDataMap.put(MYSTRUCT, new FieldMetaData("myStruct", TFieldRequirementType.DEFAULT, 
        new StructMetaData(TType.STRUCT, MyStruct.class)));
    tmpMetaDataMap.put(MYDATAITEM, new FieldMetaData("myDataItem", TFieldRequirementType.DEFAULT, 
        new StructMetaData(TType.STRUCT, MyDataItem.class)));
    metaDataMap = Collections.unmodifiableMap(tmpMetaDataMap);
  }

  public MyUnion() {
    super();
  }

  public MyUnion(int setField, Object __value) {
    super(setField, __value);
  }

  public MyUnion(MyUnion other) {
    super(other);
  }

  public MyUnion deepCopy() {
    return new MyUnion(this);
  }

  public static MyUnion myEnum(MyEnum __value) {
    MyUnion x = new MyUnion();
    x.setMyEnum(__value);
    return x;
  }

  public static MyUnion myStruct(MyStruct __value) {
    MyUnion x = new MyUnion();
    x.setMyStruct(__value);
    return x;
  }

  public static MyUnion myDataItem(MyDataItem __value) {
    MyUnion x = new MyUnion();
    x.setMyDataItem(__value);
    return x;
  }


  @Override
  protected void checkType(short setField, Object __value) throws ClassCastException {
    switch (setField) {
      case MYENUM:
        if (__value instanceof MyEnum) {
          break;
        }
        throw new ClassCastException("Was expecting value of type MyEnum for field 'myEnum', but got " + __value.getClass().getSimpleName());
      case MYSTRUCT:
        if (__value instanceof MyStruct) {
          break;
        }
        throw new ClassCastException("Was expecting value of type MyStruct for field 'myStruct', but got " + __value.getClass().getSimpleName());
      case MYDATAITEM:
        if (__value instanceof MyDataItem) {
          break;
        }
        throw new ClassCastException("Was expecting value of type MyDataItem for field 'myDataItem', but got " + __value.getClass().getSimpleName());
      default:
        throw new IllegalArgumentException("Unknown field id " + setField);
    }
  }

  @Override
  public void read(TProtocol iprot) throws TException {
    setField_ = 0;
    value_ = null;
    iprot.readStructBegin(metaDataMap);
    TField __field = iprot.readFieldBegin();
    if (__field.type != TType.STOP)
    {
      value_ = readValue(iprot, __field);
      if (value_ != null)
      {
        switch (__field.id) {
          case MYENUM:
            if (__field.type == MY_ENUM_FIELD_DESC.type) {
              setField_ = __field.id;
            }
            break;
          case MYSTRUCT:
            if (__field.type == MY_STRUCT_FIELD_DESC.type) {
              setField_ = __field.id;
            }
            break;
          case MYDATAITEM:
            if (__field.type == MY_DATA_ITEM_FIELD_DESC.type) {
              setField_ = __field.id;
            }
            break;
        }
      }
      iprot.readFieldEnd();
      iprot.readFieldBegin();
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();
  }

  @Override
  protected Object readValue(TProtocol iprot, TField __field) throws TException {
    switch (__field.id) {
      case MYENUM:
        if (__field.type == MY_ENUM_FIELD_DESC.type) {
          MyEnum myEnum;
          myEnum = MyEnum.findByValue(iprot.readI32());
          return myEnum;
        }
        break;
      case MYSTRUCT:
        if (__field.type == MY_STRUCT_FIELD_DESC.type) {
          MyStruct myStruct;
          myStruct = new MyStruct();
          myStruct.read(iprot);
          return myStruct;
        }
        break;
      case MYDATAITEM:
        if (__field.type == MY_DATA_ITEM_FIELD_DESC.type) {
          MyDataItem myDataItem;
          myDataItem = new MyDataItem();
          myDataItem.read(iprot);
          return myDataItem;
        }
        break;
    }
    TProtocolUtil.skip(iprot, __field.type);
    return null;
  }

  @Override
  protected void writeValue(TProtocol oprot, short setField, Object __value) throws TException {
    switch (setField) {
      case MYENUM:
        MyEnum myEnum = (MyEnum)getFieldValue();
        oprot.writeI32(myEnum == null ? 0 : myEnum.getValue());
        return;
      case MYSTRUCT:
        MyStruct myStruct = (MyStruct)getFieldValue();
        myStruct.write(oprot);
        return;
      case MYDATAITEM:
        MyDataItem myDataItem = (MyDataItem)getFieldValue();
        myDataItem.write(oprot);
        return;
      default:
        throw new IllegalStateException("Cannot write union with unknown field " + setField);
    }
  }

  @Override
  protected TField getFieldDesc(int setField) {
    switch (setField) {
      case MYENUM:
        return MY_ENUM_FIELD_DESC;
      case MYSTRUCT:
        return MY_STRUCT_FIELD_DESC;
      case MYDATAITEM:
        return MY_DATA_ITEM_FIELD_DESC;
      default:
        throw new IllegalArgumentException("Unknown field id " + setField);
    }
  }

  @Override
  protected TStruct getStructDesc() {
    return STRUCT_DESC;
  }

  @Override
  protected Map<Integer, FieldMetaData> getMetaDataMap() { return metaDataMap; }

  private Object __getValue(int expectedFieldId) {
    if (getSetField() == expectedFieldId) {
      return getFieldValue();
    } else {
      throw new RuntimeException("Cannot get field '" + getFieldDesc(expectedFieldId).name + "' because union is currently set to " + getFieldDesc(getSetField()).name);
    }
  }

  private void __setValue(int fieldId, Object __value) {
    if (__value == null) throw new NullPointerException();
    setField_ = fieldId;
    value_ = __value;
  }

  /**
   * 
   * @see MyEnum
   */
  public MyEnum getMyEnum() {
    return (MyEnum) __getValue(MYENUM);
  }

  /**
   * 
   * @see MyEnum
   */
  public void setMyEnum(MyEnum __value) {
    __setValue(MYENUM, __value);
  }

  public MyStruct getMyStruct() {
    return (MyStruct) __getValue(MYSTRUCT);
  }

  public void setMyStruct(MyStruct __value) {
    __setValue(MYSTRUCT, __value);
  }

  public MyDataItem getMyDataItem() {
    return (MyDataItem) __getValue(MYDATAITEM);
  }

  public void setMyDataItem(MyDataItem __value) {
    __setValue(MYDATAITEM, __value);
  }

  public boolean equals(Object other) {
    if (other instanceof MyUnion) {
      return equals((MyUnion)other);
    } else {
      return false;
    }
  }

  public boolean equals(MyUnion other) {
    return equalsNobinaryImpl(other);
  }

  @Override
  public int compareTo(MyUnion other) {
    return compareToImpl(other);
  }


  @Override
  public int hashCode() {
    return Arrays.deepHashCode(new Object[] {getSetField(), getFieldValue()});
  }

}
