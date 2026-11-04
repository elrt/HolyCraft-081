// Batch 002. Source: minecraftpe/headers/nbt/FloatTag.hpp
#ifndef MCPE_HEADERS_NBT_FLOATTAG_HPP
#define MCPE_HEADERS_NBT_FLOATTAG_HPP
class FloatTag : Tag { F32 value; };
U0 FloatTag_write(Tag *base,IDataOutput *out) { FloatTag *self=base; IDataOutput_writeFloat(out,self->value); }
U0 FloatTag_load(Tag *base,IDataInput *input) { FloatTag *self=base; self->value=IDataInput_readFloat(input); }
U0 FloatTag_toString(Tag *base,MCString *out);
Tag *FloatTag_copy(Tag *base);
Bool FloatTag_equals(Tag *base,Tag *other) { FloatTag *self=base,*that=other; return Tag_BaseEquals(base,other) && self->value==that->value; }
U0 FloatTag_InitName(FloatTag *self,MCString *name) {
 Tag_Init(self,name,5); self->writeFn=&FloatTag_write; self->loadFn=&FloatTag_load;
 self->toStringFn=&FloatTag_toString; self->copyFn=&FloatTag_copy; self->equalsFn=&FloatTag_equals;
}
U0 FloatTag_Init(FloatTag *self,MCString *name,F32 value) { FloatTag_InitName(self,name); self->value=value; }
Tag *FloatTag_copy(Tag *base) {
 FloatTag *self=base,*copy=MC_Alloc(sizeof(FloatTag)); FloatTag_Init(copy,&self->tagName,self->value); return copy;
}
U0 FloatTag_toString(Tag *base,MCString *out) {
 FloatTag *self=base; U8 buf[128]; I64 n=snprintf(buf,128,"%.6g",self->value(F64)); MCString_FromBytes(out,buf,n);
}

#endif

