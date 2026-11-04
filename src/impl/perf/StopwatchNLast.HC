// Batch 002. Source: minecraftpe/impl/perf/StopwatchNLast.cpp
U0 StopwatchNLast_Init(StopwatchNLast *self,I32 size) {
 if(size<=0) exit(72); Stopwatch_Init(self); Stopwatch_Init(&self->field_48); self->size=size; self->field_34=0; self->field_40=0;
 self->field_38=MC_Alloc(size*8); MemSet(self->field_38,0,size*8); self->stopFn=&StopwatchNLast_Stop; self->printFn=&StopwatchNLast_Print; self->destroyFn=&StopwatchNLast_Destroy;
}
U0 StopwatchNLast_Stop(Stopwatch *base) {
 StopwatchNLast *self=base; Stopwatch_BaseStop(base); F64 last=Stopwatch_getLast(base); I32 index=self->field_34; F64 previous=self->field_38[index];
 index++; self->field_34=index; if(index==self->size) self->field_34=0; self->field_38[self->field_34]=last; self->field_40+=last-previous;
}
U0 StopwatchNLast_Print(Stopwatch *base,MCString *name) { Stopwatch_getMax(base); }
U0 StopwatchNLast_Destroy(Stopwatch *base) { StopwatchNLast *self=base; free(self->field_38); self->field_38=NULL; Stopwatch_Destroy(&self->field_48); }

