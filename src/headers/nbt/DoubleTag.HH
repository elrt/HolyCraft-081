// Batch 002. Source: minecraftpe/headers/nbt/DoubleTag.hpp
#ifndef MCPE_HEADERS_NBT_DOUBLETAG_HPP
#define MCPE_HEADERS_NBT_DOUBLETAG_HPP
class DoubleTag : Tag { I32 field_C; F64 value; };
U0 DoubleTag_write(Tag *base,IDataOutput *out) { DoubleTag *self=base; IDataOutput_writeDouble(out,self->value); }
U0 DoubleTag_load(Tag *base,IDataInput *input) { DoubleTag *self=base; self->value=IDataInput_readDouble(input); }
U0 DoubleTag_toString(Tag *base,MCString *out);
Tag *DoubleTag_copy(Tag *base);
Bool DoubleTag_equals(Tag *base,Tag *other) { DoubleTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 DoubleTag_InitName(DoubleTag *self,MCString *name) {
 Tag_Init(self,name,6); self->writeFn=&DoubleTag_write; self->loadFn=&DoubleTag_load;
 self->toStringFn=&DoubleTag_toString; self->copyFn=&DoubleTag_copy; self->equalsFn=&DoubleTag_equals;
}
U0 DoubleTag_Init(DoubleTag *self,MCString *name,F64 value) { DoubleTag_InitName(self,name); self->value=value; }
Tag *DoubleTag_copy(Tag *base) {
 DoubleTag *self=base,*copy=MC_Alloc(sizeof(DoubleTag)); DoubleTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 DoubleTag_toString(Tag *base,MCString *out) {
 DoubleTag *self=base; U8 buf[128]; I64 n=snprintf(buf,128,"%.6g",self->value); MCString_FromBytes(out,buf,n);
}

#endif

