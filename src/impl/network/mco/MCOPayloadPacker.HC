// Batch 018: source minecraftpe/impl/network/mco/MCOPayloadPacker.cpp.
// Invalid/truncated packets are rejected instead of using uninitialized stack bytes.
U0 MCOPayloadPacker_Init(MCOPayloadPacker *self,Random *rng){self->random=rng;}
Bool MCOPayloadPacker_readControlPackage(ControllerData *out,U8 *src,U32 count){
 MCBitStream s;I32 n=0,limit=0;ControllerData_Init(out);MCBitStream_FromBytes(&s,src,count);
 if(!MCBitStream_ReadI32(&s,&n) || !MCBitStream_ReadI32(&s,&out->field_0) || !MCBitStream_ReadU32(&s,&out->field_4)){MCBitStream_Destroy(&s);return FALSE;}
 if(n<=11)limit=0;else if(n>4107)limit=4096;else limit=n-12;
 if((s.bits-s.readBit)/8<limit){MCBitStream_Destroy(&s);return FALSE;}
 U8 *buf=MC_Alloc(limit+1);if(limit)MCBitStream_ReadRaw(&s,buf,limit);MCString_Destroy(&out->field_8);MCString_FromBytes(&out->field_8,buf,limit);free(buf);MCBitStream_Destroy(&s);return TRUE;
}
U0 MCOPayloadPacker_writeBitStream(MCOPayloadPacker *self,MCString *out,I64 value,MCString *payload){
 U32 a=Random_genrand_int32(self->random),b=Random_genrand_int32(self->random),c=Random_genrand_int32(self->random),d=Random_genrand_int32(self->random);MCBitStream s;MCBitStream_Init(&s);MCBitStream_WriteI64(&s,value);MCBitStream_WriteI16(&s,payload->size(I16));MCBitStream_WriteRaw(&s,payload->data,payload->size);MCBitStream_WriteU32(&s,a);MCBitStream_WriteU32(&s,b);MCBitStream_WriteU32(&s,c);MCBitStream_WriteU32(&s,d);MCString_FromBytes(out,s.data,(s.bits+7)/8);MCBitStream_Destroy(&s);
}
U0 MCOPayloadPacker_writeControllPackage(MCString *out,ControllerData *data){
 MCBitStream s;I64 n=data->field_8.size;if(n>4096)n=4096;MCBitStream_Init(&s);MCBitStream_WriteI32(&s,data->field_8.size(I32));MCBitStream_WriteI32(&s,data->field_0);MCBitStream_WriteU32(&s,data->field_4);MCBitStream_WriteRaw(&s,data->field_8.data,n);MCBitStream_WriteU32(&s,0);MCString_FromBytes(out,s.data,(s.bits+7)/8);MCBitStream_Destroy(&s);
}
