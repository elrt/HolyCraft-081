// Batch 002. Source: minecraftpe/headers/nbt/ShortTag.hpp
#ifndef MCPE_HEADERS_NBT_SHORTTAG_HPP
#define MCPE_HEADERS_NBT_SHORTTAG_HPP
class ShortTag : Tag { I16 value; };
U0 ShortTag_write(Tag *base,IDataOutput *out) { ShortTag *self=base; IDataOutput_writeShort(out,self->value); }
U0 ShortTag_load(Tag *base,IDataInput *input) { ShortTag *self=base; self->value=IDataInput_readShort(input); }
U0 ShortTag_toString(Tag *base,MCString *out);
Tag *ShortTag_copy(Tag *base);
Bool ShortTag_equals(Tag *base,Tag *other) { ShortTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 ShortTag_InitName(ShortTag *self,MCString *name) {
 Tag_Init(self,name,2); self->writeFn=&ShortTag_write; self->loadFn=&ShortTag_load;
 self->toStringFn=&ShortTag_toString; self->copyFn=&ShortTag_copy; self->equalsFn=&ShortTag_equals;
}
U0 ShortTag_Init(ShortTag *self,MCString *name,I16 value) { ShortTag_InitName(self,name); self->value=value; }
Tag *ShortTag_copy(Tag *base) {
 ShortTag *self=base,*copy=MC_Alloc(sizeof(ShortTag)); ShortTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 ShortTag_toString(Tag *base,MCString *out) {
 ShortTag *self=base; U8 buf[128]; I64 n=snprintf(buf,128,"%d",self->value); MCString_FromBytes(out,buf,n);
}

#endif

