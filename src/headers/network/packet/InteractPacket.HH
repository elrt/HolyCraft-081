// Batch 003. Source: minecraftpe/headers/network/packet/InteractPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_INTERACTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_INTERACTPACKET_HPP
class InteractPacket : Packet { U8 action ;
 I8 align1 , align2 , align3 ;
 I32 eid , type ;
 };
U0 InteractPacket_read(Packet *base,MCBitStream *stream) { InteractPacket *self=base;MCBitStream_ReadU8 ( stream , & self -> action ) ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI32 ( stream , & self -> type ) ;
}
U0 InteractPacket_write(Packet *base,MCBitStream *stream) { InteractPacket *self=base;MCBitStream_WriteU8 ( stream , PID_INTERACT_PACKET ) ;
 MCBitStream_WriteU8 ( stream , self -> action ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI32 ( stream , self -> type ) ;
}
U0 InteractPacket_Destroy(Packet *base) { InteractPacket *self=base;}
U0 InteractPacket_Init(InteractPacket *self) { memset(self,0,sizeof(InteractPacket));Packet_Init(self);self->packetId=PID_INTERACT_PACKET;self->readFn=&InteractPacket_read;self->writeFn=&InteractPacket_write;self->destroyFn=&InteractPacket_Destroy;}
U0 InteractPacket_InitValues(InteractPacket *self,I32 eid , I32 type , U8 action) { InteractPacket_Init(self);self -> eid = eid ;
 self -> type = type ;
 self -> action = action ;
}

#endif

