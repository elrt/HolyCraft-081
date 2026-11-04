// Batch 002. Source: minecraftpe/headers/util/output/IDataOutput.hpp
#ifndef MCPE_HEADERS_UTIL_OUTPUT_IDATAOUTPUT_HPP
#define MCPE_HEADERS_UTIL_OUTPUT_IDATAOUTPUT_HPP
class IDataOutput {
 U0 (*writeStringFn)(IDataOutput *self,MCString *value);
 U0 (*writeFloatFn)(IDataOutput *self,F32 value); U0 (*writeDoubleFn)(IDataOutput *self,F64 value);
 U0 (*writeByteFn)(IDataOutput *self,I8 value); U0 (*writeShortFn)(IDataOutput *self,I16 value);
 U0 (*writeIntFn)(IDataOutput *self,I32 value); U0 (*writeLongLongFn)(IDataOutput *self,I64 value);
 U0 (*writeBytesFn)(IDataOutput *self,U0 *bytes,I32 count);
};
U0 IDataOutput_writeString(IDataOutput *self,MCString *value) { self->writeStringFn(self,value); }
U0 IDataOutput_writeFloat(IDataOutput *self,F32 value) { self->writeFloatFn(self,value); }
U0 IDataOutput_writeDouble(IDataOutput *self,F64 value) { self->writeDoubleFn(self,value); }
U0 IDataOutput_writeByte(IDataOutput *self,I8 value) { self->writeByteFn(self,value); }
U0 IDataOutput_writeShort(IDataOutput *self,I16 value) { self->writeShortFn(self,value); }
U0 IDataOutput_writeInt(IDataOutput *self,I32 value) { self->writeIntFn(self,value); }
U0 IDataOutput_writeLongLong(IDataOutput *self,I64 value) { self->writeLongLongFn(self,value); }
U0 IDataOutput_writeBytes(IDataOutput *self,U0 *bytes,I32 count) { self->writeBytesFn(self,bytes,count); }

#endif

