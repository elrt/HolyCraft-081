// Batch 002. Source: minecraftpe/impl/nbt/Tag.cpp
MCString Tag_NullString={NULL,0};
I32 Tag_readDepth=0;
U0 Tag_NoChildren(Tag *self) {}
U0 Tag_NoDestroy(Tag *self) {}
U0 Tag_Init(Tag *self,MCString *name,I8 id) {
 self->field_0=0; MCString_CopyInit(&self->tagName,name); self->id=id;
 self->equalsFn=&Tag_BaseEquals; self->deleteChildrenFn=&Tag_NoChildren; self->destroyFn=&Tag_NoDestroy;
}
Bool Tag_BaseEquals(Tag *self,Tag *other) { return self->id==other->id && MCString_Equal(&self->tagName,&other->tagName); }
U0 Tag_Destroy(Tag *self) { self->destroyFn(self); MCString_Destroy(&self->tagName); }
U0 Tag_Delete(Tag *self) { if(self) { Tag_Destroy(self); free(self); } }
U0 Tag_DeleteDeep(Tag *self) { if(self) { Tag_deleteChildren(self); Tag_Delete(self); } }
Tag *Tag_setName(Tag *self,MCString *name) { MCString_Assign(&self->tagName,name); return self; }
U0 Tag_getName(Tag *self,MCString *out) { MCString_CopyInit(out,&self->tagName); }
U0 Tag_print(Tag *self,MCString *prefix,PrintStream *stream) {
 MCString value; Tag_toString(self,&value); PrintStream_println(stream,&value); MCString_Destroy(&value);
 // List/Compound braces and descendants are walked even though original PrintStream emits no output.
 if(self->id==9) { ListTag *list=self; I64 i; for(i=0;i<list->value.size;i++) Tag_print(list->value.data[i],prefix,stream); }
 if(self->id==10) { CompoundTag *compound=self; I64 i; for(i=0;i<compound->size;i++) Tag_print(compound->entries[i].value,prefix,stream); }
}
U0 Tag_printDefault(Tag *self,PrintStream *stream) { MCString empty; MCString_Init(&empty); Tag_print(self,&empty,stream); }
U0 Tag_writeNamedTag(Tag *self,IDataOutput *out) {
 IDataOutput_writeByte(out,self->id); if(self->id) { IDataOutput_writeString(out,&self->tagName); Tag_write(self,out); }
}
Tag *Tag_readNamedTag(IDataInput *input) {
 if(input->failed || !IDataInput_hasBytesLeft(input,1) || Tag_readDepth>=512) { input->failed=TRUE; return NULL; }
 I8 type=IDataInput_readByte(input); MCString name; Tag *tag;
 if(type==0) { EndTag *end=MC_Alloc(sizeof(EndTag)); EndTag_Init(end); return end; }
 IDataInput_readString(input,&name); tag=Tag_newTag(type,&name); MCString_Destroy(&name);
 if(!tag) { input->failed=TRUE; return NULL; }
 Tag_readDepth++; Tag_load(tag,input); Tag_readDepth--;
 if(input->failed) { Tag_DeleteDeep(tag); return NULL; } return tag;
}
U0 Tag_getTagName(I8 type,MCString *out) {
 U8 *text="UNKNOWN";
 switch(type) {
 case 0: text="TAG_End"; break; case 1: text="TAG_Byte"; break; case 2: text="TAG_Short"; break;
 case 3: text="TAG_Int"; break; case 4: text="TAG_Long"; break; case 5: text="TAG_Float"; break;
 case 6: text="TAG_Double"; break; case 7: text="TAG_Byte_Array"; break; case 8: text="TAG_String"; break;
 case 9: text="TAG_List"; break; case 10: text="TAG_Compound"; break;
 }
 MCString_FromBytes(out,text,MC_StrLen(text));
}
Tag *Tag_newTag(I8 type,MCString *name) {
 switch(type) {
 case 0: { EndTag *p=MC_Alloc(sizeof(EndTag)); EndTag_Init(p); return p; }
 case 1: { ByteTag *p=MC_Alloc(sizeof(ByteTag)); ByteTag_InitName(p,name); return p; }
 case 2: { ShortTag *p=MC_Alloc(sizeof(ShortTag)); ShortTag_InitName(p,name); return p; }
 case 3: { IntTag *p=MC_Alloc(sizeof(IntTag)); IntTag_InitName(p,name); return p; }
 case 4: { LongTag *p=MC_Alloc(sizeof(LongTag)); LongTag_InitName(p,name); return p; }
 case 5: { FloatTag *p=MC_Alloc(sizeof(FloatTag)); FloatTag_InitName(p,name); return p; }
 case 6: { DoubleTag *p=MC_Alloc(sizeof(DoubleTag)); DoubleTag_InitName(p,name); return p; }
 case 7: { ByteArrayTag *p=MC_Alloc(sizeof(ByteArrayTag)); ByteArrayTag_InitName(p,name); return p; }
 case 8: { StringTag *p=MC_Alloc(sizeof(StringTag)); StringTag_InitName(p,name); return p; }
 case 9: { ListTag *p=MC_Alloc(sizeof(ListTag)); ListTag_Init(p,name); return p; }
 case 10: { CompoundTag *p=MC_Alloc(sizeof(CompoundTag)); CompoundTag_Init(p,name); return p; }
 default: return NULL;
 }
}
