// Batch 003. Source: minecraftpe/headers/network/packet/ContainerClosePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_CONTAINERCLOSEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_CONTAINERCLOSEPACKET_HPP
class ContainerClosePacket : Packet { U8 field_C ;
 I8 align1 , align2 , align3 ;
 };
U0 ContainerClosePacket_read(Packet *base,MCBitStream *stream) { ContainerClosePacket *self=base;MCBitStream_ReadU8 ( stream , & self -> field_C ) ;
}
U0 ContainerClosePacket_write(Packet *base,MCBitStream *stream) { ContainerClosePacket *self=base;MCBitStream_WriteU8 ( stream , PID_CONTAINER_CLOSE_PACKET ) ;
 MCBitStream_WriteU8 ( stream , self -> field_C ) ;
}
U0 ContainerClosePacket_Destroy(Packet *base) { ContainerClosePacket *self=base;}
U0 ContainerClosePacket_Init(ContainerClosePacket *self) { memset(self,0,sizeof(ContainerClosePacket));Packet_Init(self);self->packetId=PID_CONTAINER_CLOSE_PACKET;self->readFn=&ContainerClosePacket_read;self->writeFn=&ContainerClosePacket_write;self->destroyFn=&ContainerClosePacket_Destroy;}
U0 ContainerClosePacket_InitValues(ContainerClosePacket *self,U8 field_C) { ContainerClosePacket_Init(self);self -> field_C = field_C ;
}

#endif

