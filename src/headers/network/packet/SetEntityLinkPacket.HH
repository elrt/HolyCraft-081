// Batch 004. Source: minecraftpe/headers/network/packet/SetEntityLinkPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_SETENTITYLINKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_SETENTITYLINKPACKET_HPP
class SetEntityLinkPacket : Packet { I32 typeMaybe , rider , riding ;
 };
U0 SetEntityLinkPacket_write(Packet *base,MCBitStream *stream) { SetEntityLinkPacket *self=base;MCBitStream_WriteU8 ( stream , PID_SET_ENTITY_LINK_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> rider ) ;
 MCBitStream_WriteI32 ( stream , self -> riding ) ;
 MCBitStream_WriteI32 ( stream , self -> typeMaybe ) ;
}
U0 SetEntityLinkPacket_read(Packet *base,MCBitStream *stream) { SetEntityLinkPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> rider ) ;
 MCBitStream_ReadI32 ( stream , & self -> riding ) ;
 MCBitStream_ReadI32 ( stream , & self -> typeMaybe ) ;
}
U0 SetEntityLinkPacket_Destroy(Packet *base) { SetEntityLinkPacket *self=base; }
U0 SetEntityLinkPacket_Init(SetEntityLinkPacket *self) { memset(self,0,sizeof(SetEntityLinkPacket)); Packet_Init(self); self->packetId=PID_SET_ENTITY_LINK_PACKET; self->readFn=&SetEntityLinkPacket_read; self->writeFn=&SetEntityLinkPacket_write; self->destroyFn=&SetEntityLinkPacket_Destroy;}
U0 SetEntityLinkPacket_InitValues(SetEntityLinkPacket *self,I32 type,I32 rider,I32 riding) { SetEntityLinkPacket_Init(self);self->typeMaybe=type;self->rider=rider;self->riding=riding; }

#endif

