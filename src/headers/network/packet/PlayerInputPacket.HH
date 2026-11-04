// Batch 003. Source: minecraftpe/headers/network/packet/PlayerInputPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_PLAYERINPUTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_PLAYERINPUTPACKET_HPP
class PlayerInputPacket : Packet { F32 moveForward , moveStrafe ;
 Bool isJumping , isSneaking ;
 I8 align , align1 ;
 };
U0 PlayerInputPacket_read(Packet *base,MCBitStream *stream) { PlayerInputPacket *self=base;MCBitStream_ReadF32 ( stream , & self -> moveStrafe ) ;
 MCBitStream_ReadF32 ( stream , & self -> moveForward ) ;
 MCBitStream_ReadBool ( stream , & self -> isJumping ) ;
 MCBitStream_ReadBool ( stream , & self -> isSneaking ) ;
}
U0 PlayerInputPacket_write(Packet *base,MCBitStream *stream) { PlayerInputPacket *self=base;MCBitStream_WriteU8 ( stream , PID_PLAYER_INPUT_PACKET ) ;
 MCBitStream_WriteF32 ( stream , self -> moveStrafe ) ;
 MCBitStream_WriteF32 ( stream , self -> moveForward ) ;
 MCBitStream_WriteBool ( stream , self -> isJumping ) ;
 MCBitStream_WriteBool ( stream , self -> isSneaking ) ;
}
U0 PlayerInputPacket_Destroy(Packet *base) { PlayerInputPacket *self=base;}
U0 PlayerInputPacket_Init(PlayerInputPacket *self) { memset(self,0,sizeof(PlayerInputPacket));Packet_Init(self);self->packetId=PID_PLAYER_INPUT_PACKET;self->readFn=&PlayerInputPacket_read;self->writeFn=&PlayerInputPacket_write;self->destroyFn=&PlayerInputPacket_Destroy;}
U0 PlayerInputPacket_InitValues(PlayerInputPacket *self,F32 fwd , F32 stf , Bool jmp , Bool snk) { PlayerInputPacket_Init(self);self -> moveForward = fwd ;
 self -> moveStrafe = stf ;
 self -> isJumping = jmp ;
 self -> isSneaking = snk ;
}

#endif

