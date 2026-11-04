// Batch 003. Source: minecraftpe/headers/network/packet/UpdateBlockPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_UPDATEBLOCKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_UPDATEBLOCKPACKET_HPP
class UpdateBlockPacket : Packet { I32 x , z ;
 U8 y ;
 U8 id , meta ;
 };
U0 UpdateBlockPacket_read(Packet *base,MCBitStream *stream) { UpdateBlockPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadU8 ( stream , & self -> y ) ;
 MCBitStream_ReadU8 ( stream , & self -> id ) ;
 MCBitStream_ReadU8 ( stream , & self -> meta ) ;
}
U0 UpdateBlockPacket_write(Packet *base,MCBitStream *stream) { UpdateBlockPacket *self=base;MCBitStream_WriteU8 ( stream , PID_UPDATE_BLOCK_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteU8 ( stream , self -> y ) ;
 MCBitStream_WriteU8 ( stream , self -> id ) ;
 MCBitStream_WriteU8 ( stream , self -> meta ) ;
}
U0 UpdateBlockPacket_Destroy(Packet *base) { UpdateBlockPacket *self=base;}
U0 UpdateBlockPacket_Init(UpdateBlockPacket *self) { memset(self,0,sizeof(UpdateBlockPacket));Packet_Init(self);self->packetId=PID_UPDATE_BLOCK_PACKET;self->readFn=&UpdateBlockPacket_read;self->writeFn=&UpdateBlockPacket_write;self->destroyFn=&UpdateBlockPacket_Destroy;}
U0 UpdateBlockPacket_InitValues(UpdateBlockPacket *self,I32 x , I32 y , I32 z , I32 id , I32 meta) { UpdateBlockPacket_Init(self);self -> x = x ;
 self -> y = y ;
 self -> z = z ;
 self -> id = id ;
 self -> meta = meta ;
}

#endif

