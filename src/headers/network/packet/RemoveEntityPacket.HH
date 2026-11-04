// Batch 003. Source: minecraftpe/headers/network/packet/RemoveEntityPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_REMOVEENTITYPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_REMOVEENTITYPACKET_HPP
class RemoveEntityPacket : Packet { I32 eid ;
 };
U0 RemoveEntityPacket_read(Packet *base,MCBitStream *stream) { RemoveEntityPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
}
U0 RemoveEntityPacket_write(Packet *base,MCBitStream *stream) { RemoveEntityPacket *self=base;MCBitStream_WriteU8 ( stream , PID_REMOVE_ENTITY_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
}
U0 RemoveEntityPacket_Destroy(Packet *base) { RemoveEntityPacket *self=base;}
U0 RemoveEntityPacket_Init(RemoveEntityPacket *self) { memset(self,0,sizeof(RemoveEntityPacket));Packet_Init(self);self->packetId=PID_REMOVE_ENTITY_PACKET;self->readFn=&RemoveEntityPacket_read;self->writeFn=&RemoveEntityPacket_write;self->destroyFn=&RemoveEntityPacket_Destroy;}
U0 RemoveEntityPacket_InitValues(RemoveEntityPacket *self,I32 eid) { RemoveEntityPacket_Init(self);self -> eid = eid ;
}

#endif

