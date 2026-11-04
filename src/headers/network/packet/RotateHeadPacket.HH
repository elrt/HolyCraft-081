// Batch 004. Source: minecraftpe/headers/network/packet/RotateHeadPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_ROTATEHEADPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_ROTATEHEADPACKET_HPP
class RotateHeadPacket : Packet { I32 eid ;
 I8 headYaw ;
 I8 field_11 , field_12 , field_13 ;
 };
U0 RotateHeadPacket_write(Packet *base,MCBitStream *stream) { RotateHeadPacket *self=base;MCBitStream_WriteU8 ( stream , PID_ROTATE_HEAD_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI8 ( stream , self -> headYaw ) ;
}
U0 RotateHeadPacket_read(Packet *base,MCBitStream *stream) { RotateHeadPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI8 ( stream , & self -> headYaw ) ;
}
U0 RotateHeadPacket_Destroy(Packet *base) { RotateHeadPacket *self=base; }
U0 RotateHeadPacket_Init(RotateHeadPacket *self) { memset(self,0,sizeof(RotateHeadPacket)); Packet_Init(self); self->packetId=PID_ROTATE_HEAD_PACKET; self->readFn=&RotateHeadPacket_read; self->writeFn=&RotateHeadPacket_write; self->destroyFn=&RotateHeadPacket_Destroy;}
U0 RotateHeadPacket_InitValues(RotateHeadPacket *self,I32 eid,F32 yaw) { RotateHeadPacket_Init(self);self->eid=eid;self->headYaw=yaw; }

#endif

