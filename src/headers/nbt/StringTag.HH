// Batch 002. Source: minecraftpe/headers/nbt/StringTag.hpp
#ifndef MCPE_HEADERS_NBT_STRINGTAG_HPP
#define MCPE_HEADERS_NBT_STRINGTAG_HPP
class StringTag : Tag { MCString value; I32 nameLength; };
U0 StringTag_write(Tag *base,IDataOutput *out) { StringTag *self=base; IDataOutput_writeString(out,&self->value); }
U0 StringTag_load(Tag *base,IDataInput *input) {
 StringTag *self=base; MCString value; IDataInput_readString(input,&value); MCString_Destroy(&self->value); MCString_MoveInit(&self->value,&value);
}
U0 StringTag_toString(Tag *base,MCString *out) { StringTag *self=base; MCString_CopyInit(out,&self->value); }
Bool StringTag_equals(Tag *base,Tag *other) { StringTag *self=base,*that=other; return Tag_BaseEquals(base,other) && MCString_Equal(&self->value,&that->value); }
Tag *StringTag_copy(Tag *base);
U0 StringTag_DestroyValue(Tag *base) { StringTag *self=base; MCString_Destroy(&self->value); }
U0 StringTag_InitName(StringTag *self,MCString *name) {
 Tag_Init(self,name,8); MCString_Init(&self->value); self->nameLength=name->size;
 self->writeFn=&StringTag_write; self->loadFn=&StringTag_load; self->toStringFn=&StringTag_toString;
 self->copyFn=&StringTag_copy; self->equalsFn=&StringTag_equals; self->destroyFn=&StringTag_DestroyValue;
}
U0 StringTag_Init(StringTag *self,MCString *name,MCString *value) { StringTag_InitName(self,name); MCString_Assign(&self->value,value); }
Tag *StringTag_copy(Tag *base) {
 StringTag *self=base,*out=MC_Alloc(sizeof(StringTag)); StringTag_Init(out,&self->tagName,&self->value); return out;
}

#endif

