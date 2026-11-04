// Port batch 001. Upstream: minecraftpe/headers/BinaryBlob.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_BINARYBLOB_HPP
#define MCPE_HEADERS_BINARYBLOB_HPP
class BinaryBlob { U8 *data; I32 length; };
U0 BinaryBlob_Init(BinaryBlob *self, U8 *data, I32 length) { self->data=data; self->length=length; }
#endif

