// Batch 003. Source: minecraftpe/headers/network/packet/AnimatePacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_ANIMATEPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_ANIMATEPACKET_HPP
class AnimatePacket : Packet { I32 eid ;
 I8 action ;
 };
U0 AnimatePacket_read(Packet *base,MCBitStream *stream) { AnimatePacket *self=base;MCBitStream_ReadI8 ( stream , & self -> action ) ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
}
U0 AnimatePacket_write(Packet *base,MCBitStream *stream) { AnimatePacket *self=base;MCBitStream_WriteU8 ( stream , PID_ANIMATE_PACKET ) ;
 MCBitStream_WriteI8 ( stream , self -> action ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
}
U0 AnimatePacket_Destroy(Packet *base) { AnimatePacket *self=base;}
U0 AnimatePacket_Init(AnimatePacket *self) { memset(self,0,sizeof(AnimatePacket));Packet_Init(self);self->packetId=PID_ANIMATE_PACKET;self->readFn=&AnimatePacket_read;self->writeFn=&AnimatePacket_write;self->destroyFn=&AnimatePacket_Destroy;}
U0 AnimatePacket_InitValues(AnimatePacket *self,I32 eid , I32 action) { AnimatePacket_Init(self);self -> eid = eid ;
 self -> action = action ;
}

#endif

