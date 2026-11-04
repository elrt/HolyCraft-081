// Batch 002. Source: minecraftpe/headers/util/output/BytesDataOutput.hpp
#ifndef MCPE_HEADERS_UTIL_OUTPUT_BYTESDATAOUTPUT_HPP
#define MCPE_HEADERS_UTIL_OUTPUT_BYTESDATAOUTPUT_HPP
class BytesDataOutput : IDataOutput {};
U0 BytesDataOutput_writeString(IDataOutput *self,MCString *value);
U0 BytesDataOutput_writeFloat(IDataOutput *self,F32 value) { IDataOutput_writeBytes(self,&value,4); }
U0 BytesDataOutput_writeDouble(IDataOutput *self,F64 value) { IDataOutput_writeBytes(self,&value,8); }
U0 BytesDataOutput_writeByte(IDataOutput *self,I8 value) { IDataOutput_writeBytes(self,&value,1); }
U0 BytesDataOutput_writeShort(IDataOutput *self,I16 value) { IDataOutput_writeBytes(self,&value,2); }
U0 BytesDataOutput_writeInt(IDataOutput *self,I32 value) { IDataOutput_writeBytes(self,&value,4); }
U0 BytesDataOutput_writeLongLong(IDataOutput *self,I64 value) { IDataOutput_writeBytes(self,&value,8); }
U0 BytesDataOutput_Init(BytesDataOutput *object,U0 (*writeBytes)(IDataOutput *self,U0 *bytes,I32 count)) {
 IDataOutput *self=object; self->writeBytesFn=writeBytes; self->writeStringFn=&BytesDataOutput_writeString;
 self->writeFloatFn=&BytesDataOutput_writeFloat;
 self->writeDoubleFn=&BytesDataOutput_writeDouble;
 self->writeByteFn=&BytesDataOutput_writeByte;
 self->writeShortFn=&BytesDataOutput_writeShort;
 self->writeIntFn=&BytesDataOutput_writeInt;
 self->writeLongLongFn=&BytesDataOutput_writeLongLong;
}

#endif

