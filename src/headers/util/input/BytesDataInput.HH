// Batch 002. Source: minecraftpe/headers/util/input/BytesDataInput.hpp
#ifndef MCPE_HEADERS_UTIL_INPUT_BYTESDATAINPUT_HPP
#define MCPE_HEADERS_UTIL_INPUT_BYTESDATAINPUT_HPP
class BytesDataInput : IDataInput {};
U0 BytesDataInput_readString(IDataInput *self,MCString *out);
F32 BytesDataInput_readFloat(IDataInput *self) { F32 value=0; IDataInput_readBytes(self,&value,4); return value; }
F64 BytesDataInput_readDouble(IDataInput *self) { F64 value=0; IDataInput_readBytes(self,&value,8); return value; }
I8 BytesDataInput_readByte(IDataInput *self) { I8 value=0; IDataInput_readBytes(self,&value,1); return value; }
I16 BytesDataInput_readShort(IDataInput *self) { I16 value=0; IDataInput_readBytes(self,&value,2); return value; }
I32 BytesDataInput_readInt(IDataInput *self) { I32 value=0; IDataInput_readBytes(self,&value,4); return value; }
I64 BytesDataInput_readLongLong(IDataInput *self) { I64 value=0; IDataInput_readBytes(self,&value,8); return value; }
U0 BytesDataInput_Init(BytesDataInput *object,Bool (*readBytes)(IDataInput *self,U0 *dst,I32 count),I32 (*bytesLeft)(IDataInput *self)) {
 IDataInput *self=object; self->failed=FALSE; self->readBytesFn=readBytes; self->numBytesLeftFn=bytesLeft;
 self->readStringFn=&BytesDataInput_readString;
 self->readFloatFn=&BytesDataInput_readFloat;
 self->readDoubleFn=&BytesDataInput_readDouble;
 self->readByteFn=&BytesDataInput_readByte;
 self->readShortFn=&BytesDataInput_readShort;
 self->readIntFn=&BytesDataInput_readInt;
 self->readLongLongFn=&BytesDataInput_readLongLong;
}

#endif

