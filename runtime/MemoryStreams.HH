#ifndef MCPE_MEMORY_STREAMS
#define MCPE_MEMORY_STREAMS
// Additional functional adapters, not counted as original-file ports.
class MCMemoryInput : BytesDataInput { U8 *data; I64 size,cursor; };
Bool MCMemoryInput_Read(IDataInput *base,U0 *dst,I32 count) {
 MCMemoryInput *self=base;
 if(count<0 || count>self->size-self->cursor) { self->failed=TRUE; if(count>0) MemSet(dst,0,count); return FALSE; }
 if(count) memcpy(dst,self->data+self->cursor,count); self->cursor+=count; return TRUE;
}
I32 MCMemoryInput_Left(IDataInput *base) { MCMemoryInput *self=base; return self->size-self->cursor; }
U0 MCMemoryInput_Init(MCMemoryInput *self,U8 *data,I64 size) {
 BytesDataInput_Init(self,&MCMemoryInput_Read,&MCMemoryInput_Left); self->data=data; self->size=size; self->cursor=0;
}
class MCMemoryOutput : BytesDataOutput { MCVector bytes; };
U0 MCMemoryOutput_Write(IDataOutput *base,U0 *data,I32 count) {
 MCMemoryOutput *self=base; if(count<0) exit(76);
 I64 required=self->bytes.size+count; if(required>self->bytes.capacity) { I64 cap=self->bytes.capacity*2; if(cap<required) cap=required; MCVector_Reserve(&self->bytes,cap); }
 if(count) memcpy(self->bytes.data+self->bytes.size,data,count); self->bytes.size=required;
}
U0 MCMemoryOutput_Init(MCMemoryOutput *self) { BytesDataOutput_Init(self,&MCMemoryOutput_Write); MCVector_Init(&self->bytes,1); }
U0 MCMemoryOutput_Destroy(MCMemoryOutput *self) { MCVector_Destroy(&self->bytes); }
#endif
