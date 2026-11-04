// Batch 003. Source: minecraftpe/headers/network/packet/SetHealthPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_SETHEALTHPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_SETHEALTHPACKET_HPP
class SetHealthPacket : Packet { I32 health ;
 };
U0 SetHealthPacket_read(Packet *base,MCBitStream *stream) { SetHealthPacket *self=base;I8 a ;
 MCBitStream_ReadI8 ( stream , & a ) ;
 self -> health = a ;
}
U0 SetHealthPacket_write(Packet *base,MCBitStream *stream) { SetHealthPacket *self=base;MCBitStream_WriteU8 ( stream , PID_SET_HEALTH_PACKET ) ;
 I8 a = ((( self -> health )))(I8) ;
 MCBitStream_WriteI8 ( stream , a ) ;
}
U0 SetHealthPacket_Destroy(Packet *base) { SetHealthPacket *self=base;}
U0 SetHealthPacket_Init(SetHealthPacket *self) { memset(self,0,sizeof(SetHealthPacket));Packet_Init(self);self->packetId=PID_SET_HEALTH_PACKET;self->readFn=&SetHealthPacket_read;self->writeFn=&SetHealthPacket_write;self->destroyFn=&SetHealthPacket_Destroy;}
U0 SetHealthPacket_InitValues(SetHealthPacket *self,I32 h) { SetHealthPacket_Init(self);self -> health = h ;
}

#endif

