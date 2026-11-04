// Extracted inline definitions from CompoundTag.hpp, included after all types.
Bool CompoundTag_Insert(CompoundTag *self,MCString *name,Tag *value) {
 I64 i,pos=0,cap; if(CompoundTag_Find(self,name)>=0) return FALSE;
 if(self->size==self->capacity) {
  cap=self->capacity*2; if(cap<4) cap=4; CompoundEntry *data=MC_Alloc(cap*sizeof(CompoundEntry));
  if(self->size) memcpy(data,self->entries,self->size*sizeof(CompoundEntry)); free(self->entries); self->entries=data; self->capacity=cap;
 }
 while(pos<self->size && MCString_Compare(&self->entries[pos].key,name)<0) pos++;
 for(i=self->size;i>pos;i--) memcpy(&self->entries[i],&self->entries[i-1],sizeof(CompoundEntry));
 MCString_CopyInit(&self->entries[pos].key,name); self->entries[pos].value=value; self->size++; return TRUE;
}
U0 CompoundTag_CopyInitShallow(CompoundTag *self,CompoundTag *other) {
 I64 i; CompoundTag_Init(self,&other->tagName);
 for(i=0;i<other->size;i++) CompoundTag_Insert(self,&other->entries[i].key,other->entries[i].value);
}
U0 CompoundTag_write(Tag *base,IDataOutput *out) {
 CompoundTag *self=base; I64 i; for(i=0;i<self->size;i++) Tag_writeNamedTag(self->entries[i].value,out); IDataOutput_writeByte(out,0);
}
U0 CompoundTag_DestroyValue(Tag *base) {
 CompoundTag *self=base; I64 i; for(i=0;i<self->size;i++) MCString_Destroy(&self->entries[i].key);
 free(self->entries); self->entries=NULL; self->size=0; self->capacity=0;
}
U0 CompoundTag_load(Tag *base,IDataInput *input) {
 CompoundTag *self=base; CompoundTag_deleteChildren(self); // Clean owned old values before replacement.
 while(!input->failed) {
  Tag *tag=Tag_readNamedTag(input); if(!tag) return;
  if(Tag_getId(tag)==0) { Tag_Delete(tag); return; }
  if(!CompoundTag_Insert(self,&tag->tagName,tag)) Tag_DeleteDeep(tag);
 }
}
U0 CompoundTag_toString(Tag *base,MCString *out) {
 CompoundTag *self=base; U8 buf[96]; I64 n=snprintf(buf,96,"%lld entries",self->size); MCString_FromBytes(out,buf,n);
}
Tag *CompoundTag_copy(Tag *base) {
 CompoundTag *self=base,*out=MC_Alloc(sizeof(CompoundTag)); I64 i; CompoundTag_Init(out,&self->tagName);
 for(i=0;i<self->size;i++) { Tag *value=Tag_copy(self->entries[i].value); Tag_setName(value,&self->entries[i].key); CompoundTag_Insert(out,&self->entries[i].key,value); }
 return out;
}
Bool CompoundTag_equals(Tag *base,Tag *other) {
 CompoundTag *self=base,*that=other; I64 i;
 if(!Tag_BaseEquals(base,other) || self->size!=that->size) return FALSE;
 for(i=0;i<self->size;i++) if(!MCString_Equal(&self->entries[i].key,&that->entries[i].key) || !Tag_equals(self->entries[i].value,that->entries[i].value)) return FALSE;
 return TRUE;
}
U0 CompoundTag_deleteChildren(Tag *base) {
 CompoundTag *self=base; I64 i;
 for(i=0;i<self->size;i++) { Tag_DeleteDeep(self->entries[i].value); MCString_Destroy(&self->entries[i].key); }
 self->size=0;
}
