// Batch 002. Source: minecraftpe/headers/nbt/LongTag.hpp
#ifndef MCPE_HEADERS_NBT_LONGTAG_HPP
#define MCPE_HEADERS_NBT_LONGTAG_HPP
class LongTag : Tag { I32 field_C; I64 value; };
U0 LongTag_write(Tag *base,IDataOutput *out) { LongTag *self=base; IDataOutput_writeLongLong(out,self->value); }
U0 LongTag_load(Tag *base,IDataInput *input) { LongTag *self=base; self->value=IDataInput_readLongLong(input); }
U0 LongTag_toString(Tag *base,MCString *out);
Tag *LongTag_copy(Tag *base);
Bool LongTag_equals(Tag *base,Tag *other) { LongTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 LongTag_InitName(LongTag *self,MCString *name) {
 Tag_Init(self,name,4); self->writeFn=&LongTag_write; self->loadFn=&LongTag_load;
 self->toStringFn=&LongTag_toString; self->copyFn=&LongTag_copy; self->equalsFn=&LongTag_equals;
}
U0 LongTag_Init(LongTag *self,MCString *name,I64 value) { LongTag_InitName(self,name); self->value=value; }
Tag *LongTag_copy(Tag *base) {
 LongTag *self=base,*copy=MC_Alloc(sizeof(LongTag)); LongTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 LongTag_toString(Tag *base,MCString *out) {
 LongTag *self=base; U8 buf[128]; I64 n=snprintf(buf,128,"%lld",self->value); MCString_FromBytes(out,buf,n);
}

#endif

