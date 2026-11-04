// Port batch 001. Upstream: minecraftpe/headers/network/mco/RestCallerType.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_NETWORK_MCO_RESTCALLERTYPE_HPP
#define MCPE_HEADERS_NETWORK_MCO_RESTCALLERTYPE_HPP
// RestCallerType: represented as I32, not a C++ enum type.
#define RCT_GET 0
#define RCT_POST 1
#define RCT_PUT 2
#define RCT_DELETE 3
#endif

