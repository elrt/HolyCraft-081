// Batch 002. Source: minecraftpe/impl/util/input/BytesDataInput.cpp
U0 BytesDataInput_readString(IDataInput *self,MCString *out) {
 I32 len=IDataInput_readShort(self),n; U8 *buf;
 if(len<=0) { MCString_Init(out); return; }
 n=len; if(len==32767) n=32766;
 if(n>IDataInput_numBytesLeft(self)) { self->failed=TRUE; MCString_Init(out); return; }
 buf=MC_Alloc(n+1); IDataInput_readBytes(self,buf,n); buf[n]=0;
 MCString_FromBytes(out,buf,MC_StrNLen(buf,n)); free(buf);
}
