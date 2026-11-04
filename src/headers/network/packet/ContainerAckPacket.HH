// Batch 003. Source: minecraftpe/headers/network/packet/ContainerAckPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_CONTAINERACKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_CONTAINERACKPACKET_HPP
class ContainerAckPacket : Packet { I16 field_C ;
 U8 field_E ;
 Bool field_F ;
 };
U0 ContainerAckPacket_read(Packet *base,MCBitStream *stream) { ContainerAckPacket *self=base;MCBitStream_ReadU8 ( stream , & self -> field_E ) ;
 MCBitStream_ReadI16 ( stream , & self -> field_C ) ;
 MCBitStream_ReadBool ( stream , & self -> field_F ) ;
}
U0 ContainerAckPacket_write(Packet *base,MCBitStream *stream) { ContainerAckPacket *self=base;MCBitStream_WriteU8 ( stream , PID_CONTAINER_ACK_PACKET ) ;
 MCBitStream_WriteU8 ( stream , self -> field_E ) ;
 MCBitStream_WriteI16 ( stream , self -> field_C ) ;
 MCBitStream_WriteBool ( stream , self -> field_F ) ;
}
U0 ContainerAckPacket_Destroy(Packet *base) { ContainerAckPacket *self=base;}
U0 ContainerAckPacket_Init(ContainerAckPacket *self) { memset(self,0,sizeof(ContainerAckPacket));Packet_Init(self);self->packetId=PID_CONTAINER_ACK_PACKET;self->readFn=&ContainerAckPacket_read;self->writeFn=&ContainerAckPacket_write;self->destroyFn=&ContainerAckPacket_Destroy;}

#endif

