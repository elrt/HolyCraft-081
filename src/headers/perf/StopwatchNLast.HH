// Batch 002. Source: minecraftpe/headers/perf/StopwatchNLast.hpp
#ifndef MCPE_HEADERS_PERF_STOPWATCHNLAST_HPP
#define MCPE_HEADERS_PERF_STOPWATCHNLAST_HPP
class StopwatchNLast : Stopwatch { I32 size,field_34; F64 *field_38; I32 field_3C; F64 field_40; Stopwatch field_48; };
U0 StopwatchNLast_Init(StopwatchNLast *self,I32 size);
U0 StopwatchNLast_Stop(Stopwatch *base); U0 StopwatchNLast_Print(Stopwatch *base,MCString *name); U0 StopwatchNLast_Destroy(Stopwatch *base);

#endif

