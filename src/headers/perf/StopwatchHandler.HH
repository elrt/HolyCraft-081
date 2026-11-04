// Batch 002. Source: minecraftpe/headers/perf/StopwatchHandler.hpp
#ifndef MCPE_HEADERS_PERF_STOPWATCHHANDLER_HPP
#define MCPE_HEADERS_PERF_STOPWATCHHANDLER_HPP
class StopwatchEntry { MCString name; Stopwatch *watch; };
class StopwatchHandler { MCVector entries; I32 field_18; };
U0 StopwatchHandler_Init(StopwatchHandler *self) { MCVector_Init(&self->entries,sizeof(StopwatchEntry)); self->field_18=0; }
U0 StopwatchHandler_clear(StopwatchHandler *self,MCString *name); U0 StopwatchHandler_clearAll(StopwatchHandler *self);
Stopwatch *StopwatchHandler_get(StopwatchHandler *self,MCString *name); U0 StopwatchHandler_print(StopwatchHandler *self); U0 StopwatchHandler_printEvery(StopwatchHandler *self,I32 every);
U0 StopwatchHandler_Destroy(StopwatchHandler *self) { StopwatchHandler_clearAll(self); MCVector_Destroy(&self->entries); }

#endif

