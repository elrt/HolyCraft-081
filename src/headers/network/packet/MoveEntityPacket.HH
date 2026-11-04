// Batch 003. Source: minecraftpe/headers/network/packet/MoveEntityPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_MOVEENTITYPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_MOVEENTITYPACKET_HPP
class MoveEntityPacket : Packet { I32 eid ;
 F32 posX , posY , posZ ;
 F32 pitch , yaw ;
 Bool hasrot ;
 };
U0 MoveEntityPacket_read(Packet *base,MCBitStream *stream) { MoveEntityPacket *self=base;}
U0 MoveEntityPacket_write(Packet *base,MCBitStream *stream) { MoveEntityPacket *self=base;MCBitStream_WriteU8 ( stream , PID_MOVE_ENTITY_PACKET ) ;
}
U0 MoveEntityPacket_Destroy(Packet *base) { MoveEntityPacket *self=base;}
U0 MoveEntityPacket_Init(MoveEntityPacket *self) { memset(self,0,sizeof(MoveEntityPacket));Packet_Init(self);self->packetId=PID_MOVE_ENTITY_PACKET;self->readFn=&MoveEntityPacket_read;self->writeFn=&MoveEntityPacket_write;self->destroyFn=&MoveEntityPacket_Destroy;}
U0 MoveEntityPacket_InitValues(MoveEntityPacket *self,Bool hasrot) { MoveEntityPacket_Init(self);self -> hasrot = hasrot ;
}

#endif

