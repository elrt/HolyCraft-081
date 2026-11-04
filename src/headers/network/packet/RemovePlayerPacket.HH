// Batch 003. Source: minecraftpe/headers/network/packet/RemovePlayerPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_REMOVEPLAYERPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_REMOVEPLAYERPACKET_HPP
class RemovePlayerPacket : Packet { I32 eid ;
 U64 clientId ;
 };
U0 RemovePlayerPacket_read(Packet *base,MCBitStream *stream) { RemovePlayerPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadU64 ( stream , & self -> clientId ) ;
}
U0 RemovePlayerPacket_write(Packet *base,MCBitStream *stream) { RemovePlayerPacket *self=base;MCBitStream_WriteU8 ( stream , PID_REMOVE_PLAYER_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteU64 ( stream , self -> clientId ) ;
}
U0 RemovePlayerPacket_Destroy(Packet *base) { RemovePlayerPacket *self=base;}
U0 RemovePlayerPacket_Init(RemovePlayerPacket *self) { memset(self,0,sizeof(RemovePlayerPacket));Packet_Init(self);self->packetId=PID_REMOVE_PLAYER_PACKET;self->readFn=&RemovePlayerPacket_read;self->writeFn=&RemovePlayerPacket_write;self->destroyFn=&RemovePlayerPacket_Destroy;}
U0 RemovePlayerPacket_InitValues(RemovePlayerPacket *self,I32 eid , U64 cid) { RemovePlayerPacket_Init(self);self -> eid = eid ;
 self -> clientId = cid ;
}

#endif

