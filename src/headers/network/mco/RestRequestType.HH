// Port batch 001. Upstream: minecraftpe/headers/network/mco/RestRequestType.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_NETWORK_MCO_RESTREQUESTTYPE_HPP
#define MCPE_HEADERS_NETWORK_MCO_RESTREQUESTTYPE_HPP
// RestRequestType: represented as I32, not a C++ enum type.
#define RRT_GET 0
#define RRT_POST 1
#define RRT_PUT 2
#define RRT_DELETE 3
#endif

