// Batch 003. Source: minecraftpe/headers/network/packet/ReadyPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_READYPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_READYPACKET_HPP
class ReadyPacket : Packet { I8 status ;
 I8 align1 , align2 , align3 ;
 };
U0 ReadyPacket_read(Packet *base,MCBitStream *stream) { ReadyPacket *self=base;MCBitStream_ReadI8 ( stream , & self -> status ) ;
}
U0 ReadyPacket_write(Packet *base,MCBitStream *stream) { ReadyPacket *self=base;MCBitStream_WriteU8 ( stream , PID_READY_PACKET ) ;
 MCBitStream_WriteI8 ( stream , self -> status ) ;
}
U0 ReadyPacket_Destroy(Packet *base) { ReadyPacket *self=base;}
U0 ReadyPacket_Init(ReadyPacket *self) { memset(self,0,sizeof(ReadyPacket));Packet_Init(self);self->packetId=PID_READY_PACKET;self->readFn=&ReadyPacket_read;self->writeFn=&ReadyPacket_write;self->destroyFn=&ReadyPacket_Destroy;}
U0 ReadyPacket_InitValues(ReadyPacket *self,I8 s) { ReadyPacket_Init(self);self -> status = s ;
}

#endif

