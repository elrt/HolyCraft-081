// Batch 003. Source: minecraftpe/headers/network/packet/TakeItemEntityPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_TAKEITEMENTITYPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_TAKEITEMENTITYPACKET_HPP
class TakeItemEntityPacket : Packet { I32 target , eid ;
 };
U0 TakeItemEntityPacket_read(Packet *base,MCBitStream *stream) { TakeItemEntityPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> target ) ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
}
U0 TakeItemEntityPacket_write(Packet *base,MCBitStream *stream) { TakeItemEntityPacket *self=base;MCBitStream_WriteU8 ( stream , PID_TAKE_ITEM_ENTITY_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> target ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
}
U0 TakeItemEntityPacket_Destroy(Packet *base) { TakeItemEntityPacket *self=base;}
U0 TakeItemEntityPacket_Init(TakeItemEntityPacket *self) { memset(self,0,sizeof(TakeItemEntityPacket));Packet_Init(self);self->packetId=PID_TAKE_ITEM_ENTITY_PACKET;self->readFn=&TakeItemEntityPacket_read;self->writeFn=&TakeItemEntityPacket_write;self->destroyFn=&TakeItemEntityPacket_Destroy;}
U0 TakeItemEntityPacket_InitValues(TakeItemEntityPacket *self,I32 eid , I32 targt) { TakeItemEntityPacket_Init(self);self -> eid = eid ;
 self -> target = targt ;
}

#endif

