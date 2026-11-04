// Port batch 001. Upstream: minecraftpe/headers/util/ChunkPos.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_UTIL_CHUNKPOS_HPP
#define MCPE_HEADERS_UTIL_CHUNKPOS_HPP
class ChunkPos { I32 x,z; };
Bool ChunkPos_Less(ChunkPos *self,ChunkPos *other) {
 I32 a,b,sa=0,sb=0;
 if(self->z<0) sa=0x8000;
 if(other->z<0) sb=0x8000;
 a=(self->z&0x7FFF)|(self->x&0x80000000)|((self->x&0x7FFF)<<16)|sa;
 b=(other->z&0x7FFF)|(other->x&0x80000000)|((other->x&0x7FFF)<<16)|sb;
 return a<b;
}
#endif

