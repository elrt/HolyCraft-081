// Batch 003. Source: minecraftpe/headers/network/packet/StartGamePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_STARTGAMEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_STARTGAMEPACKET_HPP
class StartGamePacket : Packet { I32 seed , genver , gamemode , eid ;
 F32 x , y , z ;
 };
U0 StartGamePacket_read(Packet *base,MCBitStream *stream) { StartGamePacket *self=base;MCBitStream_ReadI32 ( stream , & self -> seed ) ;
 MCBitStream_ReadI32 ( stream , & self -> genver ) ;
 MCBitStream_ReadI32 ( stream , & self -> gamemode ) ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadF32 ( stream , & self -> x ) ;
 MCBitStream_ReadF32 ( stream , & self -> y ) ;
 MCBitStream_ReadF32 ( stream , & self -> z ) ;
}
U0 StartGamePacket_write(Packet *base,MCBitStream *stream) { StartGamePacket *self=base;MCBitStream_WriteU8 ( stream , PID_START_GAME_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> seed ) ;
 MCBitStream_WriteI32 ( stream , self -> genver ) ;
 MCBitStream_WriteI32 ( stream , self -> gamemode ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteF32 ( stream , self -> x ) ;
 MCBitStream_WriteF32 ( stream , self -> y ) ;
 MCBitStream_WriteF32 ( stream , self -> z ) ;
}
U0 StartGamePacket_Destroy(Packet *base) { StartGamePacket *self=base;}
U0 StartGamePacket_Init(StartGamePacket *self) { memset(self,0,sizeof(StartGamePacket));Packet_Init(self);self->packetId=PID_START_GAME_PACKET;self->readFn=&StartGamePacket_read;self->writeFn=&StartGamePacket_write;self->destroyFn=&StartGamePacket_Destroy;}
U0 StartGamePacket_InitValues(StartGamePacket *self,I32 seed , I32 genver , I32 gm , I32 eid , F32 x , F32 y , F32 z) { StartGamePacket_Init(self);self -> seed = seed ;
 self -> genver = genver ;
 self -> gamemode = gm ;
 self -> eid = eid ;
 self -> x = x ;
 self -> y = y ;
 self -> z = z ;
}

#endif

