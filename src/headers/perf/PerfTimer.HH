// Batch 004. Source: minecraftpe/headers/perf/PerfTimer.hpp
#ifndef MCPE_HEADERS_PERF_PERFTIMER_HPP
#define MCPE_HEADERS_PERF_PERFTIMER_HPP
class PerfTimerResult { F32 field_0,field_4; MCString sectionName; };
class PerfTimerEntry { MCString key; F32 value; };
Bool PerfTimer_enabled=FALSE;
MCVector PerfTimer_paths,PerfTimer_startTimes,PerfTimer_times;
MCString PerfTimer_path;
U0 PerfTimer_Init(); U0 PerfTimer_Destroy(); U0 PerfTimer_push(MCString *name); U0 PerfTimer_pop(); U0 PerfTimer_popPush(MCString *name); U0 PerfTimer_reset();
U0 PerfTimer_getLog(MCString *name,MCVector *out);
I32 PerfTimerResult_getColor(PerfTimerResult *self);
Bool PerfTimerResult_less(PerfTimerResult *self,PerfTimerResult *other);
U0 PerfTimerResultVector_Destroy(MCVector *v);

#endif

