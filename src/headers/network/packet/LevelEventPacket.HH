// Batch 003. Source: minecraftpe/headers/network/packet/LevelEventPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_LEVELEVENTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_LEVELEVENTPACKET_HPP
class LevelEventPacket : Packet { I16 evid ;
 I16 x , y , z ;
 I32 data ;
 };
U0 LevelEventPacket_read(Packet *base,MCBitStream *stream) { LevelEventPacket *self=base;MCBitStream_ReadI16 ( stream , & self -> evid ) ;
 MCBitStream_ReadI16 ( stream , & self -> x ) ;
 MCBitStream_ReadI16 ( stream , & self -> y ) ;
 MCBitStream_ReadI16 ( stream , & self -> z ) ;
 MCBitStream_ReadI32 ( stream , & self -> data ) ;
}
U0 LevelEventPacket_write(Packet *base,MCBitStream *stream) { LevelEventPacket *self=base;MCBitStream_WriteU8 ( stream , PID_LEVEL_EVENT_PACKET ) ;
 MCBitStream_WriteI16 ( stream , self -> evid ) ;
 MCBitStream_WriteI16 ( stream , self -> x ) ;
 MCBitStream_WriteI16 ( stream , self -> y ) ;
 MCBitStream_WriteI16 ( stream , self -> z ) ;
 MCBitStream_WriteI32 ( stream , self -> data ) ;
}
U0 LevelEventPacket_Destroy(Packet *base) { LevelEventPacket *self=base;}
U0 LevelEventPacket_Init(LevelEventPacket *self) { memset(self,0,sizeof(LevelEventPacket));Packet_Init(self);self->packetId=PID_LEVEL_EVENT_PACKET;self->readFn=&LevelEventPacket_read;self->writeFn=&LevelEventPacket_write;self->destroyFn=&LevelEventPacket_Destroy;}
U0 LevelEventPacket_InitValues(LevelEventPacket *self,I16 evid , I16 x , I16 y , I16 z , I32 data) { LevelEventPacket_Init(self);self -> evid = evid ;
 self -> x = x ;
 self -> y = y ;
 self -> z = z ;
 self -> data = data ;
}

#endif

