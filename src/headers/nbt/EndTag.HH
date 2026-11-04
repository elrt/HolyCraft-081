// Batch 002. Source: minecraftpe/headers/nbt/EndTag.hpp
#ifndef MCPE_HEADERS_NBT_ENDTAG_HPP
#define MCPE_HEADERS_NBT_ENDTAG_HPP
class EndTag : Tag {};
U0 EndTag_write(Tag *self,IDataOutput *out) {}
U0 EndTag_load(Tag *self,IDataInput *input) {}
U0 EndTag_toString(Tag *self,MCString *out) { MCString_FromBytes(out,"END",3); }
Tag *EndTag_copy(Tag *self);
U0 EndTag_Init(EndTag *self) {
 MCString empty; MCString_Init(&empty); Tag_Init(self,&empty,0);
 self->writeFn=&EndTag_write; self->loadFn=&EndTag_load; self->toStringFn=&EndTag_toString; self->copyFn=&EndTag_copy;
}
Tag *EndTag_copy(Tag *self) { EndTag *out=MC_Alloc(sizeof(EndTag)); EndTag_Init(out); return out; }

#endif

