// Batch 002. Source: minecraftpe/headers/nbt/IntTag.hpp
#ifndef MCPE_HEADERS_NBT_INTTAG_HPP
#define MCPE_HEADERS_NBT_INTTAG_HPP
class IntTag : Tag { I32 value; };
U0 IntTag_write(Tag *base,IDataOutput *out) { IntTag *self=base; IDataOutput_writeInt(out,self->value); }
U0 IntTag_load(Tag *base,IDataInput *input) { IntTag *self=base; self->value=IDataInput_readInt(input); }
U0 IntTag_toString(Tag *base,MCString *out);
Tag *IntTag_copy(Tag *base);
Bool IntTag_equals(Tag *base,Tag *other) { IntTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 IntTag_InitName(IntTag *self,MCString *name) {
 Tag_Init(self,name,3); self->writeFn=&IntTag_write; self->loadFn=&IntTag_load;
 self->toStringFn=&IntTag_toString; self->copyFn=&IntTag_copy; self->equalsFn=&IntTag_equals;
}
U0 IntTag_Init(IntTag *self,MCString *name,I32 value) { IntTag_InitName(self,name); self->value=value; }
Tag *IntTag_copy(Tag *base) {
 IntTag *self=base,*copy=MC_Alloc(sizeof(IntTag)); IntTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 IntTag_toString(Tag *base,MCString *out) {
 IntTag *self=base; U8 buf[128]; I64 n=snprintf(buf,128,"%d",self->value); MCString_FromBytes(out,buf,n);
}

#endif

