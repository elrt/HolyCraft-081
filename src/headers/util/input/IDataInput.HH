// Batch 002. Source: minecraftpe/headers/util/input/IDataInput.hpp
#ifndef MCPE_HEADERS_UTIL_INPUT_IDATAINPUT_HPP
#define MCPE_HEADERS_UTIL_INPUT_IDATAINPUT_HPP
class IDataInput {
 Bool failed;
 U0 (*readStringFn)(IDataInput *self,MCString *out);
 F32 (*readFloatFn)(IDataInput *self); F64 (*readDoubleFn)(IDataInput *self);
 I8 (*readByteFn)(IDataInput *self); I16 (*readShortFn)(IDataInput *self);
 I32 (*readIntFn)(IDataInput *self); I64 (*readLongLongFn)(IDataInput *self);
 Bool (*readBytesFn)(IDataInput *self,U0 *dst,I32 count);
 I32 (*numBytesLeftFn)(IDataInput *self);
};
U0 IDataInput_readString(IDataInput *self,MCString *out) { self->readStringFn(self,out); }
F32 IDataInput_readFloat(IDataInput *self) { return self->readFloatFn(self); }
F64 IDataInput_readDouble(IDataInput *self) { return self->readDoubleFn(self); }
I8 IDataInput_readByte(IDataInput *self) { return self->readByteFn(self); }
I16 IDataInput_readShort(IDataInput *self) { return self->readShortFn(self); }
I32 IDataInput_readInt(IDataInput *self) { return self->readIntFn(self); }
I64 IDataInput_readLongLong(IDataInput *self) { return self->readLongLongFn(self); }
Bool IDataInput_readBytes(IDataInput *self,U0 *dst,I32 count) { return self->readBytesFn(self,dst,count); }
I32 IDataInput_numBytesLeft(IDataInput *self) { return self->numBytesLeftFn(self); }
Bool IDataInput_hasBytesLeft(IDataInput *self,I32 count);

#endif

