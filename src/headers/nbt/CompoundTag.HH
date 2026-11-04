// Batch 002. Source: minecraftpe/headers/nbt/CompoundTag.hpp
#ifndef MCPE_HEADERS_NBT_COMPOUNDTAG_HPP
#define MCPE_HEADERS_NBT_COMPOUNDTAG_HPP
class CompoundEntry { MCString key; Tag *value; };
class CompoundTag : Tag { CompoundEntry *entries; I64 size,capacity; };
U0 CompoundTag_write(Tag *base,IDataOutput *out);
U0 CompoundTag_load(Tag *base,IDataInput *input);
U0 CompoundTag_toString(Tag *base,MCString *out);
Tag *CompoundTag_copy(Tag *base);
Bool CompoundTag_equals(Tag *base,Tag *other);
U0 CompoundTag_deleteChildren(Tag *base);
U0 CompoundTag_DestroyValue(Tag *base);
U0 CompoundTag_Init(CompoundTag *self,MCString *name) {
 Tag_Init(self,name,10); self->entries=NULL; self->size=0; self->capacity=0;
 self->writeFn=&CompoundTag_write; self->loadFn=&CompoundTag_load; self->toStringFn=&CompoundTag_toString;
 self->copyFn=&CompoundTag_copy; self->equalsFn=&CompoundTag_equals; self->deleteChildrenFn=&CompoundTag_deleteChildren; self->destroyFn=&CompoundTag_DestroyValue;
}
U0 CompoundTag_InitEmpty(CompoundTag *self) { MCString name; MCString_Init(&name); CompoundTag_Init(self,&name); }
I64 CompoundTag_Find(CompoundTag *self,MCString *name) { I64 i; for(i=0;i<self->size;i++) if(MCString_Equal(&self->entries[i].key,name)) return i; return -1; }
Tag *CompoundTag_get(CompoundTag *self,MCString *name) { I64 i=CompoundTag_Find(self,name); if(i<0) return NULL; return self->entries[i].value; }
Bool CompoundTag_contains(CompoundTag *self,MCString *name) { return CompoundTag_Find(self,name)>=0; }
Bool CompoundTag_containsType(CompoundTag *self,MCString *name,I32 id) { Tag *t=CompoundTag_get(self,name); return t && Tag_getId(t)==id; }
Bool CompoundTag_Insert(CompoundTag *self,MCString *name,Tag *value);
Bool CompoundTag_put(CompoundTag *self,MCString *name,Tag *value) { Tag_setName(value,name); return CompoundTag_Insert(self,name,value); }
U0 CompoundTag_CopyInitShallow(CompoundTag *self,CompoundTag *other);

I8 CompoundTag_getByte(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=1) return 0;
 ByteTag *value=tag; return value->value;
}
U0 CompoundTag_putByte(CompoundTag *self,MCString *name,I8 value) {
 ByteTag *tag=MC_Alloc(sizeof(ByteTag)); ByteTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
I16 CompoundTag_getShort(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=2) return 0;
 ShortTag *value=tag; return value->value;
}
U0 CompoundTag_putShort(CompoundTag *self,MCString *name,I16 value) {
 ShortTag *tag=MC_Alloc(sizeof(ShortTag)); ShortTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
I32 CompoundTag_getInt(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=3) return 0;
 IntTag *value=tag; return value->value;
}
U0 CompoundTag_putInt(CompoundTag *self,MCString *name,I32 value) {
 IntTag *tag=MC_Alloc(sizeof(IntTag)); IntTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
I64 CompoundTag_getLong(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=4) return 0;
 LongTag *value=tag; return value->value;
}
U0 CompoundTag_putLong(CompoundTag *self,MCString *name,I64 value) {
 LongTag *tag=MC_Alloc(sizeof(LongTag)); LongTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
F32 CompoundTag_getFloat(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=5) return 0;
 FloatTag *value=tag; return value->value;
}
U0 CompoundTag_putFloat(CompoundTag *self,MCString *name,F32 value) {
 FloatTag *tag=MC_Alloc(sizeof(FloatTag)); FloatTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
U0 CompoundTag_putBoolean(CompoundTag *self,MCString *name,Bool value) { CompoundTag_putByte(self,name,value); }
U0 CompoundTag_getString(CompoundTag *self,MCString *name,MCString *out) {
 Tag *tag=CompoundTag_get(self,name); if(!tag || Tag_getId(tag)!=8) { MCString_Init(out); return; }
 StringTag *value=tag; MCString_CopyInit(out,&value->value);
}
U0 CompoundTag_putString(CompoundTag *self,MCString *name,MCString *value) {
 StringTag *tag=MC_Alloc(sizeof(StringTag)); StringTag_Init(tag,name,value); if(!CompoundTag_Insert(self,name,tag)) Tag_DeleteDeep(tag);
}
CompoundTag *CompoundTag_getCompound(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(tag && Tag_getId(tag)==10) return tag;
 CompoundTag *out=MC_Alloc(sizeof(CompoundTag)); CompoundTag_Init(out,name); return out;
}
ListTag *CompoundTag_getList(CompoundTag *self,MCString *name) {
 Tag *tag=CompoundTag_get(self,name); if(tag && Tag_getId(tag)==9) return tag;
 ListTag *out=MC_Alloc(sizeof(ListTag)); ListTag_Init(out,name); return out;
}

#endif

