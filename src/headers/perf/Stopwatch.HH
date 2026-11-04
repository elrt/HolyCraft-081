// Batch 002. Source: minecraftpe/headers/perf/Stopwatch.hpp
#ifndef MCPE_HEADERS_PERF_STOPWATCH_HPP
#define MCPE_HEADERS_PERF_STOPWATCH_HPP
class Stopwatch {
 I32 field_4; F64 startTime,total,lastDiffTime,maxDiffTime; I32 count,field_28;
 U0 (*stopFn)(Stopwatch *self); F64 (*stopContinueFn)(Stopwatch *self); U0 (*printFn)(Stopwatch *self,MCString *name); U0 (*destroyFn)(Stopwatch *self);
};
U0 Stopwatch_Init(Stopwatch *self); I32 Stopwatch_getCount(Stopwatch *self); F64 Stopwatch_getLast(Stopwatch *self); F64 Stopwatch_getMax(Stopwatch *self); F64 Stopwatch_getTotal(Stopwatch *self);
U0 Stopwatch_printEvery(Stopwatch *self,I32 every,MCString *name); U0 Stopwatch_reset(Stopwatch *self); U0 Stopwatch_start(Stopwatch *self);
U0 Stopwatch_stop(Stopwatch *self) { self->stopFn(self); }
F64 Stopwatch_stopContinue(Stopwatch *self) { return self->stopContinueFn(self); }
U0 Stopwatch_print(Stopwatch *self,MCString *name) { self->printFn(self,name); }
U0 Stopwatch_Destroy(Stopwatch *self) { if(self->destroyFn) self->destroyFn(self); }
U0 Stopwatch_BaseStop(Stopwatch *self); F64 Stopwatch_BaseStopContinue(Stopwatch *self); U0 Stopwatch_BasePrint(Stopwatch *self,MCString *name);

#endif

