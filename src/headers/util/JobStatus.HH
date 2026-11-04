// Port batch 001. Upstream: minecraftpe/headers/util/JobStatus.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_JOBSTATUS_HPP
#define MCPE_HEADERS_UTIL_JOBSTATUS_HPP
// JobStatus: represented as I32, not a C++ enum type.
#define JS_0 0
#define JS_STARTED 1
#define JS_STOPPED 2
#define JS_FINISHED 3
#endif

