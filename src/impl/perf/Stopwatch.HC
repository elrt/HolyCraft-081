// Batch 002. Source: minecraftpe/impl/perf/Stopwatch.cpp
U0 Stopwatch_Init(Stopwatch *self) {
 self->count=0; self->field_28=0; Stopwatch_reset(self); self->stopFn=&Stopwatch_BaseStop;
 self->stopContinueFn=&Stopwatch_BaseStopContinue; self->printFn=&Stopwatch_BasePrint; self->destroyFn=NULL;
}
I32 Stopwatch_getCount(Stopwatch *self) { return self->count; }
F64 Stopwatch_getLast(Stopwatch *self) { return self->lastDiffTime; }
F64 Stopwatch_getMax(Stopwatch *self) { return self->maxDiffTime; }
F64 Stopwatch_getTotal(Stopwatch *self) { return self->total; }
U0 Stopwatch_printEvery(Stopwatch *self,I32 every,MCString *name) { I32 next=self->field_28+1; if(next>=every) { self->field_28=0; Stopwatch_print(self,name); } else self->field_28=next; }
U0 Stopwatch_reset(Stopwatch *self) { self->startTime=-1; self->total=0; self->maxDiffTime=0; }
U0 Stopwatch_start(Stopwatch *self) { self->startTime=MC_GetTimeS(); }
U0 Stopwatch_BaseStop(Stopwatch *self) {
 if(self->startTime== -1) return; F64 diff=MC_GetTimeS()-self->startTime; self->lastDiffTime=diff;
 if(diff>self->maxDiffTime) self->maxDiffTime=diff; self->total+=diff; self->count++; self->startTime=-1;
}
F64 Stopwatch_BaseStopContinue(Stopwatch *self) {
 if(self->startTime== -1) return 0; F64 time=MC_GetTimeS(),diff=time-self->startTime; self->lastDiffTime=diff;
 if(diff>self->maxDiffTime) self->maxDiffTime=diff; self->total+=diff; self->count++; self->startTime=time; return self->total;
}
U0 Stopwatch_BasePrint(Stopwatch *self,MCString *name) {} // Source prints nothing.

