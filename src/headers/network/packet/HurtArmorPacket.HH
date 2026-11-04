// Batch 003. Source: minecraftpe/headers/network/packet/HurtArmorPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_HURTARMORPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_HURTARMORPACKET_HPP
class HurtArmorPacket : Packet { I8 health ;
 I8 align1 , align2 , align3 ;
 };
U0 HurtArmorPacket_read(Packet *base,MCBitStream *stream) { HurtArmorPacket *self=base;MCBitStream_ReadI8 ( stream , & self -> health ) ;
}
U0 HurtArmorPacket_write(Packet *base,MCBitStream *stream) { HurtArmorPacket *self=base;MCBitStream_WriteU8 ( stream , PID_HURT_ARMOR_PACKET ) ;
 MCBitStream_WriteI8 ( stream , self -> health ) ;
}
U0 HurtArmorPacket_Destroy(Packet *base) { HurtArmorPacket *self=base;}
U0 HurtArmorPacket_Init(HurtArmorPacket *self) { memset(self,0,sizeof(HurtArmorPacket));Packet_Init(self);self->packetId=PID_HURT_ARMOR_PACKET;self->readFn=&HurtArmorPacket_read;self->writeFn=&HurtArmorPacket_write;self->destroyFn=&HurtArmorPacket_Destroy;}
U0 HurtArmorPacket_InitValues(HurtArmorPacket *self,I8 h) { HurtArmorPacket_Init(self);self -> health = h ;
}

#endif

