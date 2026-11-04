// Batch 003. Source: minecraftpe/headers/network/packet/EntityEventPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_ENTITYEVENTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_ENTITYEVENTPACKET_HPP
class EntityEventPacket : Packet { I32 eid ;
 U8 event ;
 I8 align1 , align2 , align3 ;
 };
U0 EntityEventPacket_read(Packet *base,MCBitStream *stream) { EntityEventPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadU8 ( stream , & self -> event ) ;
}
U0 EntityEventPacket_write(Packet *base,MCBitStream *stream) { EntityEventPacket *self=base;MCBitStream_WriteU8 ( stream , PID_ENTITY_EVENT_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteU8 ( stream , self -> event ) ;
}
U0 EntityEventPacket_Destroy(Packet *base) { EntityEventPacket *self=base;}
U0 EntityEventPacket_Init(EntityEventPacket *self) { memset(self,0,sizeof(EntityEventPacket));Packet_Init(self);self->packetId=PID_ENTITY_EVENT_PACKET;self->readFn=&EntityEventPacket_read;self->writeFn=&EntityEventPacket_write;self->destroyFn=&EntityEventPacket_Destroy;}
U0 EntityEventPacket_InitValues(EntityEventPacket *self,I32 eid , U8 event) { EntityEventPacket_Init(self);self -> eid = eid ;
 self -> event = event ;
}

#endif

