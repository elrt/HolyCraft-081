#ifndef MCPE_BATCH002_SUPPORT
#define MCPE_BATCH002_SUPPORT
#link <pthread>
extern "c" F32 fabsf(F32 value);
// Native glibc Linux x86_64 mutex storage; verified against sizeof/_Alignof in tests/native_abi.c.
class MCNativeMutex { U64 opaque[5]; };
pthread_mutex_t *MC_MutexAddress(MCNativeMutex *ptr) { return ptr(pthread_mutex_t*); }
I64 MC_StrLen(U8 *str) { I64 n=0; if(str) while(str[n]) n++; return n; }
I64 MC_StrNLen(U8 *str,I64 limit) { I64 n=0; while(n<limit && str[n]) n++; return n; }
U8 *MCString_CStr(MCString *self) { if(self->data) return self->data; return ""; }
Bool MCString_Equal(MCString *a,MCString *b) { return a->size==b->size && (a->size==0 || memcmp(a->data,b->data,a->size)==0); }
I32 MCString_Compare(MCString *a,MCString *b) {
 I64 n=a->size; if(b->size<n) n=b->size; I32 value=0; if(n) value=memcmp(a->data,b->data,n);
 if(value) return value; if(a->size<b->size) return -1; if(a->size>b->size) return 1; return 0;
}
U0 MCString_FromC(MCString *self,U8 *value) { MCString_FromBytes(self,value,MC_StrLen(value)); }
class MCVector { U8 *data; I64 size,capacity,itemSize; };
U0 MCVector_Init(MCVector *self,I64 itemSize) { self->data=NULL; self->size=0; self->capacity=0; self->itemSize=itemSize; }
U0 MCVector_Reserve(MCVector *self,I64 capacity) {
 if(capacity<=self->capacity) return; if(capacity<0 || self->itemSize<=0 || capacity>0x7fffffffffffffff/self->itemSize) exit(73);
 U8 *data=MC_Alloc(capacity*self->itemSize); if(self->size) memcpy(data,self->data,self->size*self->itemSize); free(self->data); self->data=data; self->capacity=capacity;
}
U0 *MCVector_At(MCVector *self,I64 index) { return self->data+index*self->itemSize; }
U0 MCVector_Push(MCVector *self,U0 *value) {
 if(self->size==self->capacity) { I64 capacity=self->capacity*2; if(capacity<4) capacity=4; MCVector_Reserve(self,capacity); }
 memcpy(MCVector_At(self,self->size),value,self->itemSize); self->size++;
}
U0 MCVector_Insert(MCVector *self,I64 index,U0 *value) {
 if(index<0 || index>self->size) exit(74);
 if(self->size==self->capacity) { I64 capacity=self->capacity*2; if(capacity<4) capacity=4; MCVector_Reserve(self,capacity); }
 if(index<self->size) memmove(MCVector_At(self,index+1),MCVector_At(self,index),(self->size-index)*self->itemSize);
 memcpy(MCVector_At(self,index),value,self->itemSize); self->size++;
}
U0 MCVector_Erase(MCVector *self,I64 index) {
 if(index<0 || index>=self->size) exit(75);
 if(index+1<self->size) memmove(MCVector_At(self,index),MCVector_At(self,index+1),(self->size-index-1)*self->itemSize); self->size--;
}
U0 MCVector_Destroy(MCVector *self) { free(self->data); self->data=NULL; self->size=0; self->capacity=0; }
class MCPtrVector { U0 **data; I64 size,capacity; };
U0 MCPtrVector_Init(MCPtrVector *self) { self->data=NULL; self->size=0; self->capacity=0; }
U0 MCPtrVector_Push(MCPtrVector *self,U0 *value) {
 if(self->size==self->capacity) {
  I64 capacity=self->capacity*2; if(capacity<4) capacity=4;
  U0 **data=MC_Alloc(capacity*sizeof(U0*)); if(self->size) memcpy(data,self->data,self->size*sizeof(U0*)); free(self->data); self->data=data; self->capacity=capacity;
 } self->data[self->size++]=value;
}
U0 MCPtrVector_Destroy(MCPtrVector *self) { free(self->data); self->data=NULL; self->size=0; self->capacity=0; }
// Optional deterministic clock for tests; production leaves MC_clock.overrideFn NULL.
class MCClockHooks { F64 (*overrideFn)(); };
MCClockHooks MC_clock={NULL};
F64 MC_GetTimeS() {
 if(MC_clock.overrideFn) return MC_clock.overrideFn(); MCTimeval time; gettimeofday(&time,NULL); return time.tv_sec-MC_startedAtSec+time.tv_usec/1000000.0;
}
#endif
