// Batch 003. Source: minecraftpe/headers/network/packet/ContainerSetDataPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_CONTAINERSETDATAPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_CONTAINERSETDATAPACKET_HPP
class ContainerSetDataPacket : Packet { I16 field_C , field_E ;
 U8 field_10 , field_11 , field_12 , field_13 ;
 };
U0 ContainerSetDataPacket_read(Packet *base,MCBitStream *stream) { ContainerSetDataPacket *self=base;MCBitStream_ReadU8 ( stream , & self -> field_10 ) ;
 MCBitStream_ReadI16 ( stream , & self -> field_C ) ;
 MCBitStream_ReadI16 ( stream , & self -> field_E ) ;
}
U0 ContainerSetDataPacket_write(Packet *base,MCBitStream *stream) { ContainerSetDataPacket *self=base;MCBitStream_WriteU8 ( stream , PID_CONTAINER_SET_DATA_PACKET ) ;
 MCBitStream_WriteU8 ( stream , self -> field_10 ) ;
 MCBitStream_WriteI16 ( stream , self -> field_C ) ;
 MCBitStream_WriteI16 ( stream , self -> field_E ) ;
}
U0 ContainerSetDataPacket_Destroy(Packet *base) { ContainerSetDataPacket *self=base;}
U0 ContainerSetDataPacket_Init(ContainerSetDataPacket *self) { memset(self,0,sizeof(ContainerSetDataPacket));Packet_Init(self);self->packetId=PID_CONTAINER_SET_DATA_PACKET;self->readFn=&ContainerSetDataPacket_read;self->writeFn=&ContainerSetDataPacket_write;self->destroyFn=&ContainerSetDataPacket_Destroy;}
U0 ContainerSetDataPacket_InitValues(ContainerSetDataPacket *self,I16 c , I16 e , U8 f10) { ContainerSetDataPacket_Init(self);self -> field_C = c ;
 self -> field_E = e ;
 self -> field_10 = f10 ;
}

#endif

