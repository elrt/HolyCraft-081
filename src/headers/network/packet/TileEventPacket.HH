// Batch 003. Source: minecraftpe/headers/network/packet/TileEventPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_TILEEVENTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_TILEEVENTPACKET_HPP
class TileEventPacket : Packet { I32 x , y , z ;
 I32 case1 , case2 ;
 };
U0 TileEventPacket_read(Packet *base,MCBitStream *stream) { TileEventPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> y ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadI32 ( stream , & self -> case1 ) ;
 MCBitStream_ReadI32 ( stream , & self -> case2 ) ;
}
U0 TileEventPacket_write(Packet *base,MCBitStream *stream) { TileEventPacket *self=base;MCBitStream_WriteU8 ( stream , PID_TILE_EVENT_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> y ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteI32 ( stream , self -> case1 ) ;
 MCBitStream_WriteI32 ( stream , self -> case2 ) ;
}
U0 TileEventPacket_Destroy(Packet *base) { TileEventPacket *self=base;}
U0 TileEventPacket_Init(TileEventPacket *self) { memset(self,0,sizeof(TileEventPacket));Packet_Init(self);self->packetId=PID_TILE_EVENT_PACKET;self->readFn=&TileEventPacket_read;self->writeFn=&TileEventPacket_write;self->destroyFn=&TileEventPacket_Destroy;}
U0 TileEventPacket_InitValues(TileEventPacket *self,I32 x , I32 y , I32 z , I32 c1 , I32 c2) { TileEventPacket_Init(self);self -> x = x ;
 self -> y = y ;
 self -> z = z ;
 self -> case1 = c1 ;
 self -> case2 = c2 ;
}

#endif

