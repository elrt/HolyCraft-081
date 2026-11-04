// Batch 003. Source: minecraftpe/headers/network/packet/RequestChunkPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_REQUESTCHUNKPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_REQUESTCHUNKPACKET_HPP
class RequestChunkPacket : Packet { I32 x , z ;
 };
U0 RequestChunkPacket_read(Packet *base,MCBitStream *stream) { RequestChunkPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
}
U0 RequestChunkPacket_write(Packet *base,MCBitStream *stream) { RequestChunkPacket *self=base;MCBitStream_WriteU8 ( stream , PID_REQUEST_CHUNK_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
}
U0 RequestChunkPacket_Destroy(Packet *base) { RequestChunkPacket *self=base;}
U0 RequestChunkPacket_Init(RequestChunkPacket *self) { memset(self,0,sizeof(RequestChunkPacket));Packet_Init(self);self->packetId=PID_REQUEST_CHUNK_PACKET;self->readFn=&RequestChunkPacket_read;self->writeFn=&RequestChunkPacket_write;self->destroyFn=&RequestChunkPacket_Destroy;}
U0 RequestChunkPacket_InitValues(RequestChunkPacket *self,I32 x , I32 z) { RequestChunkPacket_Init(self);self -> x = x ;
 self -> z = z ;
}

#endif

