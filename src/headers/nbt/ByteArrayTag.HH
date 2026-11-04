// Batch 002. Source: minecraftpe/headers/nbt/ByteArrayTag.hpp
#ifndef MCPE_HEADERS_NBT_BYTEARRAYTAG_HPP
#define MCPE_HEADERS_NBT_BYTEARRAYTAG_HPP
class ByteArrayTag : Tag { I8 *value; I32 count; I32 allocatedLength; };
U0 ByteArrayTag_write(Tag *base,IDataOutput *out) {
 ByteArrayTag *self=base; IDataOutput_writeInt(out,self->count); IDataOutput_writeBytes(out,self->value,self->count);
}
U0 ByteArrayTag_load(Tag *base,IDataInput *input) {
 ByteArrayTag *self=base; I32 n=IDataInput_readInt(input);
 if(n<0 || n>IDataInput_numBytesLeft(input)) { input->failed=TRUE; return; }
 I8 *arr=MC_Alloc(n); if(!IDataInput_readBytes(input,arr,n)) { free(arr); return; }
 free(self->value); self->value=arr; self->allocatedLength=n;
 // Original deliberately does NOT set count. See compatibility notes.
}
U0 ByteArrayTag_toString(Tag *base,MCString *out) {
 ByteArrayTag *self=base; U8 buf[96]; I64 n=snprintf(buf,96,"[%d bytes]",self->count); MCString_FromBytes(out,buf,n);
}
Bool ByteArrayTag_equals(Tag *base,Tag *other) {
 ByteArrayTag *self=base,*that=other;
 if(!Tag_BaseEquals(base,other) || self->count!=that->count) return FALSE;
 return self->count==0 || memcmp(self->value,that->value,self->count)==0;
}
Tag *ByteArrayTag_copy(Tag *base);
U0 ByteArrayTag_DestroyValue(Tag *base) { ByteArrayTag *self=base; free(self->value); self->value=NULL; }
U0 ByteArrayTag_InitName(ByteArrayTag *self,MCString *name) {
 Tag_Init(self,name,7); self->value=NULL; self->count=0; self->allocatedLength=0;
 self->writeFn=&ByteArrayTag_write; self->loadFn=&ByteArrayTag_load; self->toStringFn=&ByteArrayTag_toString;
 self->copyFn=&ByteArrayTag_copy; self->equalsFn=&ByteArrayTag_equals; self->destroyFn=&ByteArrayTag_DestroyValue;
}
U0 ByteArrayTag_Init(ByteArrayTag *self,MCString *name,I8 *ownedArray,I32 count) {
 ByteArrayTag_InitName(self,name); self->value=ownedArray; self->count=count; self->allocatedLength=count;
}
Tag *ByteArrayTag_copy(Tag *base) {
 ByteArrayTag *self=base,*out=MC_Alloc(sizeof(ByteArrayTag)); I8 *arr=MC_Alloc(self->count);
 if(self->count) memcpy(arr,self->value,self->count);
 ByteArrayTag_Init(out,&self->tagName,arr,0); out->allocatedLength=self->count; return out;
}

#endif

