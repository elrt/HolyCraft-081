// Batch 003. Source: minecraftpe/headers/network/packet/RemoveBlockPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_REMOVEBLOCKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_REMOVEBLOCKPACKET_HPP
class RemoveBlockPacket : Packet { I32 eid ;
 I32 x , z ;
 U8 y ;
 I8 field_19 , field_1A , field_1B ;
 };
U0 RemoveBlockPacket_read(Packet *base,MCBitStream *stream) { RemoveBlockPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadU8 ( stream , & self -> y ) ;
}
U0 RemoveBlockPacket_write(Packet *base,MCBitStream *stream) { RemoveBlockPacket *self=base;MCBitStream_WriteU8 ( stream , PID_REMOVE_BLOCK_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteU8 ( stream , self -> y ) ;
}
U0 RemoveBlockPacket_Destroy(Packet *base) { RemoveBlockPacket *self=base;}
U0 RemoveBlockPacket_Init(RemoveBlockPacket *self) { memset(self,0,sizeof(RemoveBlockPacket));Packet_Init(self);self->packetId=PID_REMOVE_BLOCK_PACKET;self->readFn=&RemoveBlockPacket_read;self->writeFn=&RemoveBlockPacket_write;self->destroyFn=&RemoveBlockPacket_Destroy;}
U0 RemoveBlockPacket_InitValues(RemoveBlockPacket *self,I32 eid , I32 x , I32 y , I32 z) { RemoveBlockPacket_Init(self);self -> eid = eid ;
 self -> x = x ;
 self -> z = z ;
 self -> y = y ;
}

#endif

