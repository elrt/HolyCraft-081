// Port batch 001. Upstream: minecraftpe/headers/input/BuildActionIntention.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_INPUT_BUILDACTIONINTENTION_HPP
#define MCPE_HEADERS_INPUT_BUILDACTIONINTENTION_HPP
class BuildActionIntention { I32 field_0; };
Bool BuildActionIntention_isRemove(BuildActionIntention *self) {
 I32 v=self->field_0; if(v&4) return TRUE; return (v(U32)>>1)&1;
}
#endif

