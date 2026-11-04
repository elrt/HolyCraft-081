// Batch 002. Source: minecraftpe/headers/nbt/ListTag.hpp
#ifndef MCPE_HEADERS_NBT_LISTTAG_HPP
#define MCPE_HEADERS_NBT_LISTTAG_HPP
class ListTag : Tag { MCPtrVector value; I8 tagType; };
U0 ListTag_write(Tag *base,IDataOutput *out);
U0 ListTag_load(Tag *base,IDataInput *input);
U0 ListTag_toString(Tag *base,MCString *out);
Tag *ListTag_copy(Tag *base);
Bool ListTag_equals(Tag *base,Tag *other);
U0 ListTag_deleteChildren(Tag *base);
U0 ListTag_DestroyValue(Tag *base) { ListTag *self=base; MCPtrVector_Destroy(&self->value); }
U0 ListTag_Init(ListTag *self,MCString *name) {
 Tag_Init(self,name,9); MCPtrVector_Init(&self->value); self->tagType=0;
 self->writeFn=&ListTag_write; self->loadFn=&ListTag_load; self->toStringFn=&ListTag_toString;
 self->copyFn=&ListTag_copy; self->equalsFn=&ListTag_equals; self->deleteChildrenFn=&ListTag_deleteChildren; self->destroyFn=&ListTag_DestroyValue;
}
U0 ListTag_InitEmpty(ListTag *self) { MCString name; MCString_Init(&name); ListTag_Init(self,&name); }
U0 ListTag_add(ListTag *self,Tag *tag) { self->tagType=Tag_getId(tag); MCPtrVector_Push(&self->value,tag); }
F32 ListTag_getFloat(ListTag *self,I32 index) {
 if(index<0 || index>=self->value.size) { self->field_0|=1; return 0; }
 Tag *tag=self->value.data[index]; if(!tag) return 0;
 if(Tag_getId(tag)!=5) { self->field_0|=2; return 0; } FloatTag *value=tag; return value->value;
}

#endif

