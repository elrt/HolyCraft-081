// Batch 004. Source: minecraftpe/headers/network/packet/AddPaintingPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_ADDPAINTINGPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_ADDPAINTINGPACKET_HPP
class AddPaintingPacket : Packet { I32 eid ;
 I32 x , y , z ;
 I32 direction ;
 MCString title ;
 };
U0 AddPaintingPacket_write(Packet *base,MCBitStream *stream) { AddPaintingPacket *self=base;MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI32 ( stream , self -> x ) ;
 MCBitStream_WriteI32 ( stream , self -> y ) ;
 MCBitStream_WriteI32 ( stream , self -> z ) ;
 MCBitStream_WriteI32 ( stream , self -> direction ) ;
 MCBitStream_WriteString ( stream , & self -> title ) ;
}
U0 AddPaintingPacket_read(Packet *base,MCBitStream *stream) { AddPaintingPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI32 ( stream , & self -> x ) ;
 MCBitStream_ReadI32 ( stream , & self -> y ) ;
 MCBitStream_ReadI32 ( stream , & self -> z ) ;
 MCBitStream_ReadI32 ( stream , & self -> direction ) ;
 MCBitStream_ReadString ( stream , & self -> title ) ;
}
U0 AddPaintingPacket_Destroy(Packet *base) { AddPaintingPacket *self=base;MCString_Destroy(&self->title); }
U0 AddPaintingPacket_Init(AddPaintingPacket *self) { memset(self,0,sizeof(AddPaintingPacket)); Packet_Init(self); self->packetId=PID_ADD_PAINTING_PACKET; self->readFn=&AddPaintingPacket_read; self->writeFn=&AddPaintingPacket_write; self->destroyFn=&AddPaintingPacket_Destroy;MCString_Init(&self->title);self->direction=-1;}
U0 AddPaintingPacket_InitValues(AddPaintingPacket *self,I32 eid,I32 x,I32 y,I32 z,I32 direction,MCString *title) { AddPaintingPacket_Init(self);self->eid=eid;self->x=x;self->y=y;self->z=z;self->direction=direction;MCString_Assign(&self->title,title); }

#endif

