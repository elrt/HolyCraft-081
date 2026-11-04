// Batch 004. Source: minecraftpe/headers/network/packet/RespawnPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_RESPAWNPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_RESPAWNPACKET_HPP
class RespawnPacket : Packet { F32 x , y , z ;
 I32 eid ;
 };
U0 RespawnPacket_write(Packet *base,MCBitStream *stream) { RespawnPacket *self=base;MCBitStream_WriteU8 ( stream , PID_RESPAWN_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteF32 ( stream , self -> x ) ;
 MCBitStream_WriteF32 ( stream , self -> y ) ;
 MCBitStream_WriteF32 ( stream , self -> z ) ;
}
U0 RespawnPacket_read(Packet *base,MCBitStream *stream) { RespawnPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadF32 ( stream , & self -> x ) ;
 MCBitStream_ReadF32 ( stream , & self -> y ) ;
 MCBitStream_ReadF32 ( stream , & self -> z ) ;
}
U0 RespawnPacket_Destroy(Packet *base) { RespawnPacket *self=base; }
U0 RespawnPacket_Init(RespawnPacket *self) { memset(self,0,sizeof(RespawnPacket)); Packet_Init(self); self->packetId=PID_RESPAWN_PACKET; self->readFn=&RespawnPacket_read; self->writeFn=&RespawnPacket_write; self->destroyFn=&RespawnPacket_Destroy;}
U0 RespawnPacket_InitValues(RespawnPacket *self,I32 eid,F32 x,F32 y,F32 z) { RespawnPacket_Init(self);self->eid=eid;self->x=x;self->y=y;self->z=z; }

#endif

