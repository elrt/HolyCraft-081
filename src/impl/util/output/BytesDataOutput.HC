// Batch 002. Source: minecraftpe/impl/util/output/BytesDataOutput.cpp
U0 BytesDataOutput_writeString(IDataOutput *self,MCString *value) {
 I16 n=value->size&32767; IDataOutput_writeShort(self,n); IDataOutput_writeBytes(self,value->data,n);
}
