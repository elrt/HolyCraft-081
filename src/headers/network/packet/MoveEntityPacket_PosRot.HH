// Batch 004. Source: minecraftpe/headers/network/packet/MoveEntityPacket_PosRot.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_MOVEENTITYPACKET_POSROT_HPP
#define MCPE_HEADERS_NETWORK_PACKET_MOVEENTITYPACKET_POSROT_HPP
class MoveEntityPacket_PosRot : MoveEntityPacket {  };
U0 MoveEntityPacket_PosRot_write(Packet *base,MCBitStream *stream) { MoveEntityPacket_PosRot *self=base;MCBitStream_WriteU8 ( stream , PID_MOVE_ENTITY_POSROT_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteF32 ( stream , self -> posX ) ;
 MCBitStream_WriteF32 ( stream , self -> posY ) ;
 MCBitStream_WriteF32 ( stream , self -> posZ ) ;
 MCBitStream_WriteF32 ( stream , self -> yaw ) ;
 MCBitStream_WriteF32 ( stream , self -> pitch ) ;
}
U0 MoveEntityPacket_PosRot_read(Packet *base,MCBitStream *stream) { MoveEntityPacket_PosRot *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadF32 ( stream , & self -> posX ) ;
 MCBitStream_ReadF32 ( stream , & self -> posY ) ;
 MCBitStream_ReadF32 ( stream , & self -> posZ ) ;
 MCBitStream_ReadF32 ( stream , & self -> yaw ) ;
 MCBitStream_ReadF32 ( stream , & self -> pitch ) ;
}
U0 MoveEntityPacket_PosRot_Destroy(Packet *base) { MoveEntityPacket_PosRot *self=base; }
U0 MoveEntityPacket_PosRot_Init(MoveEntityPacket_PosRot *self) { memset(self,0,sizeof(MoveEntityPacket_PosRot)); Packet_Init(self); self->packetId=PID_MOVE_ENTITY_POSROT_PACKET; self->readFn=&MoveEntityPacket_PosRot_read; self->writeFn=&MoveEntityPacket_PosRot_write; self->destroyFn=&MoveEntityPacket_PosRot_Destroy;self->hasrot=TRUE;}
U0 MoveEntityPacket_PosRot_InitValues(MoveEntityPacket_PosRot *self,I32 eid,F32 x,F32 y,F32 z,F32 ridingHeight,F32 yaw,F32 pitch) { MoveEntityPacket_PosRot_Init(self);self->hasrot=FALSE;self->eid=eid;self->posX=x;self->posY=y-ridingHeight;self->posZ=z;self->yaw=yaw;self->pitch=pitch; }

#endif

