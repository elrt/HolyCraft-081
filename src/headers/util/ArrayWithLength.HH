// Port batch 001. Upstream: minecraftpe/headers/util/ArrayWithLength.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_ARRAYWITHLENGTH_HPP
#define MCPE_HEADERS_UTIL_ARRAYWITHLENGTH_HPP
// The only upstream instantiation is Node*. Allocate pointer slots, not bytes.
class arrayWithLength { U0 **array; I32 size; };
U0 ArrayWithLength_DefaultInit(arrayWithLength *self) {} // Source leaves members uninitialised.
U0 ArrayWithLength_Init(arrayWithLength *self,I32 size) {
 self->size=size; self->array=MC_Alloc(size*sizeof(U0*));
}
U0 ArrayWithLength_Wrap(arrayWithLength *self,U0 **arr,I32 size) { self->array=arr; self->size=size; }
// No implicit destructor: upstream ownership is managed by Path/BinaryHeap. 
#endif

