// Batch 004. Source: minecraftpe/headers/network/packet/ExplodePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_EXPLODEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_EXPLODEPACKET_HPP
class ExplodePacket : Packet { F32 x , y , z , radius ;
 MCVector positions ;
 };
U0 ExplodePacket_write(Packet *base,MCBitStream *stream) { ExplodePacket *self=base;MCBitStream_WriteU8 ( stream , PID_EXPLODE_PACKET ) ;
 MCBitStream_WriteF32 ( stream , self -> x ) ;
 MCBitStream_WriteF32 ( stream , self -> y ) ;
 MCBitStream_WriteF32 ( stream , self -> z ) ;
 MCBitStream_WriteF32 ( stream , self -> radius ) ;
 I32 count = self -> positions. size , i , x = self -> x , y = self -> y , z = self -> z ;
 MCBitStream_WriteI32 ( stream , count ) ;
 for ( i = 0 ;
 i < count ;
 i ++ ) {
 TilePos * p = MCVector_At ( & self -> positions , i ) ;
 MCBitStream_WriteI8 ( stream , p -> x - x ) ;
 MCBitStream_WriteI8 ( stream , p -> y - y ) ;
 MCBitStream_WriteI8 ( stream , p -> z - z ) ;
 
}
}
U0 ExplodePacket_read(Packet *base,MCBitStream *stream) { ExplodePacket *self=base;MCBitStream_ReadF32 ( stream , & self -> x ) ;
 MCBitStream_ReadF32 ( stream , & self -> y ) ;
 MCBitStream_ReadF32 ( stream , & self -> z ) ;
 MCBitStream_ReadF32 ( stream , & self -> radius ) ;
 I32 count = 0 , i ;
 I8 x , y , z ;
 TilePos p ;
 MCBitStream_ReadI32 ( stream , & count ) ;
 for ( i = 0 ;
 i < count && MCBitStream_ReadI8 ( stream , & x ) && MCBitStream_ReadI8 ( stream , & y ) && MCBitStream_ReadI8 ( stream , & z ) ;
 i ++ ) {
 p. x = (self->x)(I32) + x ;
 p. y = (self->y)(I32) + y ;
 p. z = (self->z)(I32) + z ;
 MCVector_Push ( & self -> positions , & p ) ;
 
}
}
U0 ExplodePacket_Destroy(Packet *base) { ExplodePacket *self=base;MCVector_Destroy(&self->positions); }
U0 ExplodePacket_Init(ExplodePacket *self) { memset(self,0,sizeof(ExplodePacket)); Packet_Init(self); self->packetId=PID_EXPLODE_PACKET; self->readFn=&ExplodePacket_read; self->writeFn=&ExplodePacket_write; self->destroyFn=&ExplodePacket_Destroy;MCVector_Init(&self->positions,sizeof(TilePos));}
U0 ExplodePacket_InitValues(ExplodePacket *self,F32 x,F32 y,F32 z,F32 radius) { ExplodePacket_Init(self);self->x=x;self->y=y;self->z=z;self->radius=radius; }

#endif

