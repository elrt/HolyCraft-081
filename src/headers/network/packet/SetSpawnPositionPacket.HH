// Batch 003. Source: minecraftpe/headers/network/packet/SetSpawnPositionPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_SETSPAWNPOSITIONPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_SETSPAWNPOSITIONPACKET_HPP
class SetSpawnPositionPacket : Packet { I32 field_C ;
 I32 x , z ;
 U8 y ;
 I8 field_19 , field_1A , field_1B ;
 };
U0 SetSpawnPositionPacket_read(Packet *base,MCBitStream *stream) { SetSpawnPositionPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadU8 ( stream , & self -> y ) ;
}
U0 SetSpawnPositionPacket_write(Packet *base,MCBitStream *stream) { SetSpawnPositionPacket *self=base;MCBitStream_WriteU8 ( stream , PID_SET_SPAWN_POSITION_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteU8 ( stream , self -> y ) ;
}
U0 SetSpawnPositionPacket_Destroy(Packet *base) { SetSpawnPositionPacket *self=base;}
U0 SetSpawnPositionPacket_Init(SetSpawnPositionPacket *self) { memset(self,0,sizeof(SetSpawnPositionPacket));Packet_Init(self);self->packetId=PID_SET_SPAWN_POSITION_PACKET;self->readFn=&SetSpawnPositionPacket_read;self->writeFn=&SetSpawnPositionPacket_write;self->destroyFn=&SetSpawnPositionPacket_Destroy;}

#endif

