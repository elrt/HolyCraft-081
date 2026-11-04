// Batch 003. Source: minecraftpe/headers/network/packet/MovePlayerPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_MOVEPLAYERPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_MOVEPLAYERPACKET_HPP
class MovePlayerPacket : Packet { I32 eid ;
 F32 x , y , z ;
 F32 pitch , yaw , bodyYaw ;
 };
U0 MovePlayerPacket_read(Packet *base,MCBitStream *stream) { MovePlayerPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadF32 ( stream , & self -> x ) ;
 MCBitStream_ReadF32 ( stream , & self -> y ) ;
 MCBitStream_ReadF32 ( stream , & self -> z ) ;
 MCBitStream_ReadF32 ( stream , & self -> yaw ) ;
 MCBitStream_ReadF32 ( stream , & self -> pitch ) ;
 MCBitStream_ReadF32 ( stream , & self -> bodyYaw ) ;
}
U0 MovePlayerPacket_write(Packet *base,MCBitStream *stream) { MovePlayerPacket *self=base;MCBitStream_WriteU8 ( stream , PID_MOVE_PLAYER_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteF32 ( stream , self -> x ) ;
 MCBitStream_WriteF32 ( stream , self -> y ) ;
 MCBitStream_WriteF32 ( stream , self -> z ) ;
 MCBitStream_WriteF32 ( stream , self -> yaw ) ;
 MCBitStream_WriteF32 ( stream , self -> pitch ) ;
 MCBitStream_WriteF32 ( stream , self -> bodyYaw ) ;
}
U0 MovePlayerPacket_Destroy(Packet *base) { MovePlayerPacket *self=base;}
U0 MovePlayerPacket_Init(MovePlayerPacket *self) { memset(self,0,sizeof(MovePlayerPacket));Packet_Init(self);self->packetId=PID_MOVE_PLAYER_PACKET;self->readFn=&MovePlayerPacket_read;self->writeFn=&MovePlayerPacket_write;self->destroyFn=&MovePlayerPacket_Destroy;}
U0 MovePlayerPacket_InitValues(MovePlayerPacket *self,I32 eid , F32 x , F32 y , F32 z , F32 p , F32 yaw , F32 byaw) { MovePlayerPacket_Init(self);self -> eid = eid ;
 self -> x = x ;
 self -> y = y ;
 self -> z = z ;
 self -> pitch = p ;
 self -> yaw = yaw ;
 self -> bodyYaw = byaw ;
}

#endif

