// Batch 003. Source: minecraftpe/headers/network/packet/PlayerActionPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_PLAYERACTIONPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_PLAYERACTIONPACKET_HPP
class PlayerActionPacket : Packet { I32 x , y , z ;
 I32 face , action , eid ;
 };
U0 PlayerActionPacket_read(Packet *base,MCBitStream *stream) { PlayerActionPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> action ) ;
 MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> y ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadI32 ( stream , & self -> face ) ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
}
U0 PlayerActionPacket_write(Packet *base,MCBitStream *stream) { PlayerActionPacket *self=base;MCBitStream_WriteU8 ( stream , PID_PLAYER_ACTION_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> action ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> y ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteI32 ( stream , self -> face ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
}
U0 PlayerActionPacket_Destroy(Packet *base) { PlayerActionPacket *self=base;}
U0 PlayerActionPacket_Init(PlayerActionPacket *self) { memset(self,0,sizeof(PlayerActionPacket));Packet_Init(self);self->packetId=PID_PLAYER_ACTION_PACKET;self->readFn=&PlayerActionPacket_read;self->writeFn=&PlayerActionPacket_write;self->destroyFn=&PlayerActionPacket_Destroy;}
U0 PlayerActionPacket_InitValues(PlayerActionPacket *self,I32 eid , I32 x , I32 y , I32 z , I32 face , I32 action) { PlayerActionPacket_Init(self);self -> eid = eid ;
 self -> x = x ;
 self -> y = y ;
 self -> z = z ;
 self -> face = face ;
 self -> action = action ;
}

#endif

