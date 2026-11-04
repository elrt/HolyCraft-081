// Batch 004. Source: minecraftpe/headers/network/packet/SetEntityMotionPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_SETENTITYMOTIONPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_SETENTITYMOTIONPACKET_HPP
class SetEntityMotionPacket : Packet { I32 eid ;
 F32 speedX , speedY , speedZ ;
 };
U0 SetEntityMotionPacket_write(Packet *base,MCBitStream *stream) { SetEntityMotionPacket *self=base;F32 motX = self -> speedX ;
 F32 motY = self -> speedY ;
 F32 motZ = self -> speedZ ;
 if ( motX > 3.9 ) motX = 3.9 ;
 else if ( motX <= - 3.9 ) motX = - 3.9 ;
 I16 mX = ((( motX * 8000 )))(I16) ;
 if ( motY > 3.9 ) motY = 3.9 ;
 else if ( motY <= - 3.9 ) motY = - 3.9 ;
 I16 mY = ((( motY * 8000 )))(I16) ;
 if ( motZ > 3.9 ) motZ = 3.9 ;
 else if ( motZ <= - 3.9 ) motZ = - 3.9 ;
 I16 mZ = ((( motZ * 8000 )))(I16) ;
 MCBitStream_WriteU8 ( stream , PID_SET_ENTITY_MOTION_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI16 ( stream , motX ) ;
 MCBitStream_WriteI16 ( stream , motY ) ;
 MCBitStream_WriteI16 ( stream , motZ ) ;
}
U0 SetEntityMotionPacket_read(Packet *base,MCBitStream *stream) { SetEntityMotionPacket *self=base;I16 speedX = 0 , speedY = 0 , speedZ = 0 ;
 MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI16 ( stream , & speedX ) ;
 MCBitStream_ReadI16 ( stream , & speedY ) ;
 MCBitStream_ReadI16 ( stream , & speedZ ) ;
 self -> speedX = ((speedX))(F32) / 8000.0 ;
 self -> speedY = ((speedY))(F32) / 8000.0 ;
 self -> speedZ = ((speedZ))(F32) / 8000.0 ;
}
U0 SetEntityMotionPacket_Destroy(Packet *base) { SetEntityMotionPacket *self=base; }
U0 SetEntityMotionPacket_Init(SetEntityMotionPacket *self) { memset(self,0,sizeof(SetEntityMotionPacket)); Packet_Init(self); self->packetId=PID_SET_ENTITY_MOTION_PACKET; self->readFn=&SetEntityMotionPacket_read; self->writeFn=&SetEntityMotionPacket_write; self->destroyFn=&SetEntityMotionPacket_Destroy;}
U0 SetEntityMotionPacket_InitValues(SetEntityMotionPacket *self,I32 eid,F32 x,F32 y,F32 z) { SetEntityMotionPacket_Init(self);self->eid=eid;self->speedX=x;self->speedY=y;self->speedZ=z; }

#endif

