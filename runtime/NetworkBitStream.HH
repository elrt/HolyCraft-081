#ifndef MCPE_NETWORK_BITSTREAM
#define MCPE_NETWORK_BITSTREAM
class MCBitStream { U8 *data;I64 bits,capacity,readBit;Bool failed; };
U0 MCBitStream_Init(MCBitStream *self) { self->data=NULL;self->bits=0;self->capacity=0;self->readBit=0;self->failed=FALSE; }
U0 MCBitStream_Destroy(MCBitStream *self) { free(self->data);MCBitStream_Init(self); }
U0 MCBitStream_Reserve(MCBitStream *self,I64 bits) { I64 bytes=(bits+7)/8;if(bytes<=self->capacity)return;I64 size=self->capacity*2;if(size<bytes)size=bytes;if(size<64)size=64;U8 *ptr=MC_Alloc(size);memset(ptr,0,size);if(self->bits)memcpy(ptr,self->data,(self->bits+7)/8);free(self->data);self->data=ptr;self->capacity=size; }
U0 MCBitStream_WriteBool(MCBitStream *self,Bool value) { MCBitStream_Reserve(self,self->bits+1);I64 byte=self->bits/8;I32 shift=7-self->bits%8;if(value)self->data[byte]|=1<<shift;else self->data[byte]&=~(1<<shift);self->bits++; }
Bool MCBitStream_ReadBool(MCBitStream *self,Bool *out) { if(self->readBit>=self->bits){self->failed=TRUE;return FALSE;}*out=(self->data[self->readBit/8]>>(7-self->readBit%8))&1;self->readBit++;return TRUE; }
U0 MCBitStream_WriteRaw(MCBitStream *self,U8 *bytes,I64 count) { I64 i;I32 j;for(i=0;i<count;i++)for(j=7;j>=0;j--)MCBitStream_WriteBool(self,(bytes[i]>>j)&1); }
Bool MCBitStream_ReadRaw(MCBitStream *self,U8 *out,I64 count) { if(count<0 || count>(self->bits-self->readBit)/8){self->failed=TRUE;return FALSE;}I64 i;I32 j;Bool bit;for(i=0;i<count;i++){U8 byte=0;for(j=7;j>=0;j--){MCBitStream_ReadBool(self,&bit);byte|=bit<<j;}out[i]=byte;}return TRUE; }
U0 MCBitStream_WriteNumber(MCBitStream *self,U0 *number,I32 width) { U8 *bytes=number;I32 i;for(i=width-1;i>=0;i--)MCBitStream_WriteRaw(self,bytes+i,1); }
Bool MCBitStream_ReadNumber(MCBitStream *self,U0 *number,I32 width) { if(self->bits-self->readBit<width*8){self->failed=TRUE;return FALSE;}U8 *bytes=number;I32 i;for(i=width-1;i>=0;i--)MCBitStream_ReadRaw(self,bytes+i,1);return TRUE; }
U0 MCBitStream_WriteI8(MCBitStream *self,I8 value) { MCBitStream_WriteNumber(self,&value,sizeof(I8)); }
Bool MCBitStream_ReadI8(MCBitStream *self,I8 *value) { return MCBitStream_ReadNumber(self,value,sizeof(I8)); }
U0 MCBitStream_WriteU8(MCBitStream *self,U8 value) { MCBitStream_WriteNumber(self,&value,sizeof(U8)); }
Bool MCBitStream_ReadU8(MCBitStream *self,U8 *value) { return MCBitStream_ReadNumber(self,value,sizeof(U8)); }
U0 MCBitStream_WriteI16(MCBitStream *self,I16 value) { MCBitStream_WriteNumber(self,&value,sizeof(I16)); }
Bool MCBitStream_ReadI16(MCBitStream *self,I16 *value) { return MCBitStream_ReadNumber(self,value,sizeof(I16)); }
U0 MCBitStream_WriteU16(MCBitStream *self,U16 value) { MCBitStream_WriteNumber(self,&value,sizeof(U16)); }
Bool MCBitStream_ReadU16(MCBitStream *self,U16 *value) { return MCBitStream_ReadNumber(self,value,sizeof(U16)); }
U0 MCBitStream_WriteI32(MCBitStream *self,I32 value) { MCBitStream_WriteNumber(self,&value,sizeof(I32)); }
Bool MCBitStream_ReadI32(MCBitStream *self,I32 *value) { return MCBitStream_ReadNumber(self,value,sizeof(I32)); }
U0 MCBitStream_WriteU32(MCBitStream *self,U32 value) { MCBitStream_WriteNumber(self,&value,sizeof(U32)); }
Bool MCBitStream_ReadU32(MCBitStream *self,U32 *value) { return MCBitStream_ReadNumber(self,value,sizeof(U32)); }
U0 MCBitStream_WriteI64(MCBitStream *self,I64 value) { MCBitStream_WriteNumber(self,&value,sizeof(I64)); }
Bool MCBitStream_ReadI64(MCBitStream *self,I64 *value) { return MCBitStream_ReadNumber(self,value,sizeof(I64)); }
U0 MCBitStream_WriteU64(MCBitStream *self,U64 value) { MCBitStream_WriteNumber(self,&value,sizeof(U64)); }
Bool MCBitStream_ReadU64(MCBitStream *self,U64 *value) { return MCBitStream_ReadNumber(self,value,sizeof(U64)); }
U0 MCBitStream_WriteF32(MCBitStream *self,F32 value) { MCBitStream_WriteNumber(self,&value,sizeof(F32)); }
Bool MCBitStream_ReadF32(MCBitStream *self,F32 *value) { return MCBitStream_ReadNumber(self,value,sizeof(F32)); }
U0 MCBitStream_WriteF64(MCBitStream *self,F64 value) { MCBitStream_WriteNumber(self,&value,sizeof(F64)); }
Bool MCBitStream_ReadF64(MCBitStream *self,F64 *value) { return MCBitStream_ReadNumber(self,value,sizeof(F64)); }
U0 MCBitStream_WriteString(MCBitStream *self,MCString *value) { U16 len=MC_StrNLen(MCString_CStr(value),value->size);MCBitStream_WriteU16(self,len);while(self->bits%8)MCBitStream_WriteBool(self,FALSE);MCBitStream_WriteRaw(self,value->data,len); }
Bool MCBitStream_ReadString(MCBitStream *self,MCString *value) { MCString_Destroy(value);U16 len=0;if(!MCBitStream_ReadU16(self,&len))return FALSE;self->readBit=(self->readBit+7)&~7;if((self->bits-self->readBit)/8<len){self->failed=TRUE;MCString_Destroy(value);return FALSE;}U8 *data=MC_Alloc(len+1);MCBitStream_ReadRaw(self,data,len);data[len]=0;MCString_Destroy(value);MCString_FromBytes(value,data,MC_StrNLen(data,len));free(data);return TRUE; }
U0 MCBitStream_FromBytes(MCBitStream *self,U8 *data,I64 count,I64 bits=-1) { MCBitStream_Init(self);if(count<0 || (bits>=0 && bits>count*8))exit(86);MCBitStream_Reserve(self,count*8);if(count)memcpy(self->data,data,count);if(bits<0)self->bits=count*8;else self->bits=bits; }
#endif
