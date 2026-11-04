#ifndef MCPE_BATCH_CORE
#define MCPE_BATCH_CORE
#link <m>
extern "c" F32 sqrtf(F32 x);
extern "c" F32 logf(F32 x);
extern "c" F32 floorf(F32 x);
extern "c" F32 fmodf(F32 x,F32 y);
extern "c" U0 *memcpy(U0 *dst,U0 *src,U64 len);
extern "c" U0 exit(I32 status);
class MCTimeval { I64 tv_sec,tv_usec; };
extern "c" I32 gettimeofday(MCTimeval *tv,U0 *tz);
I64 MC_startedAtSec=0;
U0 MC_TimeInit() { MCTimeval tv; gettimeofday(&tv,NULL); MC_startedAtSec=tv.tv_sec; }
I32 MC_GetTimeMs() { MCTimeval tv; gettimeofday(&tv,NULL); return (tv.tv_sec-MC_startedAtSec)*1000+tv.tv_usec/1000; }
U0 *MC_Alloc(I64 bytes) {
 U0 *p; if(bytes<0) exit(70); if(bytes==0) bytes=1;
 p=malloc(bytes); if(!p) exit(71); return p;
}
class MCString { U8 *data; I64 size; };
U0 MCString_Init(MCString *self) { self->data=NULL; self->size=0; }
U0 MCString_FromBytes(MCString *self,U8 *bytes,I64 size) {
 self->data=MC_Alloc(size+1); self->size=size;
 if(size) memcpy(self->data,bytes,size); self->data[size]=0;
}
U0 MCString_CopyInit(MCString *self,MCString *other) { MCString_FromBytes(self,other->data,other->size); }
U0 MCString_MoveInit(MCString *self,MCString *other) {
 self->data=other->data; self->size=other->size; MCString_Init(other);
}
U0 MCString_Destroy(MCString *self) { free(self->data); self->data=NULL; self->size=0; }
U0 MCString_Assign(MCString *self,MCString *other) {
 U8 *data; if(self==other) return;
 data=MC_Alloc(other->size+1); if(other->size) memcpy(data,other->data,other->size);
 data[other->size]=0; free(self->data); self->data=data; self->size=other->size;
}
#endif
