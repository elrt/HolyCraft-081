// Batch 002. Source: minecraftpe/headers/nbt/ListTagFloatAdder.hpp
#ifndef MCPE_HEADERS_NBT_LISTTAGFLOATADDER_HPP
#define MCPE_HEADERS_NBT_LISTTAGFLOATADDER_HPP
class ListTagFloatAdder { ListTag *tag; };
ListTagFloatAdder *ListTagFloatAdder_Apply(ListTagFloatAdder *self,F32 value) {
 if(!self->tag) { self->tag=MC_Alloc(sizeof(ListTag)); ListTag_InitEmpty(self->tag); }
 MCString name; MCString_Init(&name); FloatTag *tag=MC_Alloc(sizeof(FloatTag)); FloatTag_Init(tag,&name,value); ListTag_add(self->tag,tag); return self;
}

#endif

