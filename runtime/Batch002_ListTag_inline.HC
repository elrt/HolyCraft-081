// Extracted inline definitions from ListTag.hpp, included after all types.
U0 ListTag_write(Tag *base,IDataOutput *out) {
 ListTag *self=base; I64 i; if(self->value.size) self->tagType=Tag_getId(self->value.data[0]); else self->tagType=1;
 IDataOutput_writeByte(out,self->tagType); IDataOutput_writeInt(out,self->value.size);
 for(i=0;i<self->value.size;i++) Tag_write(self->value.data[i],out);
}
U0 ListTag_load(Tag *base,IDataInput *input) {
 ListTag *self=base; self->tagType=IDataInput_readByte(input); I32 count=IDataInput_readInt(input),i;
 if(input->failed || count<0 || count>1000000 || Tag_readDepth>=512) { input->failed=TRUE; return; }
 for(i=0;i<count;i++) {
  Tag *tag=Tag_newTag(self->tagType,&Tag_NullString); if(!tag) { input->failed=TRUE; return; }
  Tag_readDepth++; Tag_load(tag,input); Tag_readDepth--;
  if(input->failed) { Tag_DeleteDeep(tag); return; } MCPtrVector_Push(&self->value,tag);
 }
}
U0 ListTag_toString(Tag *base,MCString *out) {
 ListTag *self=base; MCString name; U8 buf[128]; Tag_getTagName(self->tagType,&name);
 I64 n=snprintf(buf,128,"%lldentries of type %s",self->value.size,MCString_CStr(&name)); MCString_FromBytes(out,buf,n); MCString_Destroy(&name);
}
Tag *ListTag_copy(Tag *base) {
 ListTag *self=base,*out=MC_Alloc(sizeof(ListTag)); I64 i; ListTag_Init(out,&self->tagName); out->tagType=self->tagType;
 for(i=0;i<self->value.size;i++) MCPtrVector_Push(&out->value,Tag_copy(self->value.data[i])); return out;
}
Bool ListTag_equals(Tag *base,Tag *other) {
 ListTag *self=base,*that=other; I64 i;
 if(!Tag_BaseEquals(base,other) || self->tagType!=that->tagType || self->value.size!=that->value.size) return FALSE;
 for(i=0;i<self->value.size;i++) if(Tag_equals(self->value.data[i],that->value.data[i])) return FALSE; // Upstream inverted test.
 return TRUE;
}
U0 ListTag_deleteChildren(Tag *base) {
 ListTag *self=base; I64 i; for(i=0;i<self->value.size;i++) Tag_DeleteDeep(self->value.data[i]); self->value.size=0;
}
