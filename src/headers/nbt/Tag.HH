// Batch 002. Source: minecraftpe/headers/nbt/Tag.hpp
#ifndef MCPE_HEADERS_NBT_TAG_HPP
#define MCPE_HEADERS_NBT_TAG_HPP
class Tag {
 I32 field_0; MCString tagName; I8 id;
 U0 (*writeFn)(Tag *self,IDataOutput *out); U0 (*loadFn)(Tag *self,IDataInput *input);
 U0 (*toStringFn)(Tag *self,MCString *out); Tag *(*copyFn)(Tag *self);
 Bool (*equalsFn)(Tag *self,Tag *other); U0 (*deleteChildrenFn)(Tag *self); U0 (*destroyFn)(Tag *self);
};
U0 Tag_Init(Tag *self,MCString *name,I8 id);
Bool Tag_BaseEquals(Tag *self,Tag *other);
Bool Tag_equals(Tag *self,Tag *other) { return self->equalsFn(self,other); }
I8 Tag_getId(Tag *self) { return self->id; }
U0 Tag_write(Tag *self,IDataOutput *out) { self->writeFn(self,out); }
U0 Tag_load(Tag *self,IDataInput *input) { self->loadFn(self,input); }
U0 Tag_toString(Tag *self,MCString *out) { self->toStringFn(self,out); }
Tag *Tag_copy(Tag *self) { return self->copyFn(self); }
U0 Tag_deleteChildren(Tag *self) { self->deleteChildrenFn(self); }
U0 Tag_Destroy(Tag *self);
U0 Tag_Delete(Tag *self);
U0 Tag_DeleteDeep(Tag *self);
Tag *Tag_setName(Tag *self,MCString *name);
U0 Tag_getName(Tag *self,MCString *out);
U0 Tag_print(Tag *self,MCString *prefix,PrintStream *stream);
U0 Tag_printDefault(Tag *self,PrintStream *stream);
U0 Tag_writeNamedTag(Tag *self,IDataOutput *out);
Tag *Tag_readNamedTag(IDataInput *input);
Tag *Tag_newTag(I8 type,MCString *name);
U0 Tag_getTagName(I8 type,MCString *out);

#endif

