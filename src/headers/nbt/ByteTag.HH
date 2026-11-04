// Batch 002. Source: minecraftpe/headers/nbt/ByteTag.hpp
#ifndef MCPE_HEADERS_NBT_BYTETAG_HPP
#define MCPE_HEADERS_NBT_BYTETAG_HPP
class ByteTag : Tag { I8 value; };
U0 ByteTag_write(Tag *base,IDataOutput *out) { ByteTag *self=base; IDataOutput_writeByte(out,self->value); }
U0 ByteTag_load(Tag *base,IDataInput *input) { ByteTag *self=base; self->value=IDataInput_readByte(input); }
U0 ByteTag_toString(Tag *base,MCString *out);
Tag *ByteTag_copy(Tag *base);
Bool ByteTag_equals(Tag *base,Tag *other) { ByteTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 ByteTag_InitName(ByteTag *self,MCString *name) {
 Tag_Init(self,name,1); self->writeFn=&ByteTag_write; self->loadFn=&ByteTag_load;
 self->toStringFn=&ByteTag_toString; self->copyFn=&ByteTag_copy; self->equalsFn=&ByteTag_equals;
}
U0 ByteTag_Init(ByteTag *self,MCString *name,I8 value) { ByteTag_InitName(self,name); self->value=value; }
Tag *ByteTag_copy(Tag *base) {
 ByteTag *self=base,*copy=MC_Alloc(sizeof(ByteTag)); ByteTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 ByteTag_toString(Tag *base,MCString *out) {
 ByteTag *self=base; I32 n=self->value(U8); out->data=MC_Alloc(n+1); out->size=n; MemSet(out->data,1,n); out->data[n]=0;
}

#endif

