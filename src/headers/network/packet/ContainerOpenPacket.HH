// Batch 003. Source: minecraftpe/headers/network/packet/ContainerOpenPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_CONTAINEROPENPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_CONTAINEROPENPACKET_HPP
class ContainerOpenPacket : Packet { U8 field_C ;
 U8 containerId ;
 U8 field_E , field_F ;
 I32 x , y , z ;
 };
U0 ContainerOpenPacket_read(Packet *base,MCBitStream *stream) { ContainerOpenPacket *self=base;MCBitStream_ReadU8 ( stream , & self -> field_C ) ;
 MCBitStream_ReadU8 ( stream , & self -> containerId ) ;
 MCBitStream_ReadU8 ( stream , & self -> field_E ) ;
 MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> y ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
}
U0 ContainerOpenPacket_write(Packet *base,MCBitStream *stream) { ContainerOpenPacket *self=base;MCBitStream_WriteU8 ( stream , PID_CONTAINER_OPEN_PACKET ) ;
 MCBitStream_WriteU8 ( stream , self -> field_C ) ;
 MCBitStream_WriteU8 ( stream , self -> containerId ) ;
 MCBitStream_WriteU8 ( stream , self -> field_E ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> y ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
}
U0 ContainerOpenPacket_Destroy(Packet *base) { ContainerOpenPacket *self=base;}
U0 ContainerOpenPacket_Init(ContainerOpenPacket *self) { memset(self,0,sizeof(ContainerOpenPacket));Packet_Init(self);self->packetId=PID_CONTAINER_OPEN_PACKET;self->readFn=&ContainerOpenPacket_read;self->writeFn=&ContainerOpenPacket_write;self->destroyFn=&ContainerOpenPacket_Destroy;}
U0 ContainerOpenPacket_InitValues(ContainerOpenPacket *self,U8 c , U8 cid , U8 e , I32 x , I32 y , I32 z) { ContainerOpenPacket_Init(self);self -> field_C = c ;
 self -> containerId = cid ;
 self -> field_E = e ;
 self -> x = x ;
 self -> y = y ;
 self -> z = z ;
}

#endif

