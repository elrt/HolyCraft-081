// Batch 003. Source: minecraftpe/headers/network/packet/PlaceBlockPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_PLACEBLOCKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_PLACEBLOCKPACKET_HPP
class PlaceBlockPacket : Packet { I32 field_C ;
 I32 field_10 ;
 I32 field_14 ;
 U8 field_18 ;
 U8 field_19 ;
 U8 field_1A ;
 U8 field_1B ;
 };
U0 PlaceBlockPacket_read(Packet *base,MCBitStream *stream) { PlaceBlockPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> field_C ) ;
 MCBitStream_ReadI32 ( stream , & self -> field_10 ) ;
 MCBitStream_ReadI32 ( stream , & self -> field_14 ) ;
 MCBitStream_ReadU8 ( stream , & self -> field_18 ) ;
 MCBitStream_ReadU8 ( stream , & self -> field_19 ) ;
 MCBitStream_ReadU8 ( stream , & self -> field_1A ) ;
 MCBitStream_ReadU8 ( stream , & self -> field_1B ) ;
}
U0 PlaceBlockPacket_write(Packet *base,MCBitStream *stream) { PlaceBlockPacket *self=base;MCBitStream_WriteU8 ( stream , PID_PLACE_BLOCK_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> field_C ) ;
 MCBitStream_WriteI32 ( stream , self -> field_10 ) ;
 MCBitStream_WriteI32 ( stream , self -> field_14 ) ;
 MCBitStream_WriteU8 ( stream , self -> field_18 ) ;
 MCBitStream_WriteU8 ( stream , self -> field_19 ) ;
 MCBitStream_WriteU8 ( stream , self -> field_1A ) ;
 MCBitStream_WriteU8 ( stream , self -> field_1B ) ;
}
U0 PlaceBlockPacket_Destroy(Packet *base) { PlaceBlockPacket *self=base;}
U0 PlaceBlockPacket_Init(PlaceBlockPacket *self) { memset(self,0,sizeof(PlaceBlockPacket));Packet_Init(self);self->packetId=PID_PLACE_BLOCK_PACKET;self->readFn=&PlaceBlockPacket_read;self->writeFn=&PlaceBlockPacket_write;self->destroyFn=&PlaceBlockPacket_Destroy;}

#endif

