// Batch 003. Source: minecraftpe/headers/network/packet/AdventureSettingsPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_ADVENTURESETTINGSPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_ADVENTURESETTINGSPACKET_HPP
#define AS_ALLOW_INTERACT 0x1
#define AS_ENABLE_PVP 0x2
#define AS_ENABLE_PVE 0x4
#define AS_FIELD_3 0x8
#define AS_NO_DAYLIGHT_CYCLE 0x10
#define AS_FIELD_5 0x20
class AdventureSettingsPacket : Packet { I32 flags ;
 };
U0 AdventureSettingsPacket_read(Packet *base,MCBitStream *stream) { AdventureSettingsPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> flags ) ;
}
U0 AdventureSettingsPacket_write(Packet *base,MCBitStream *stream) { AdventureSettingsPacket *self=base;MCBitStream_WriteU8 ( stream , PID_ADVENTURE_SETTINGS_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> flags ) ;
}
U0 AdventureSettingsPacket_Destroy(Packet *base) { AdventureSettingsPacket *self=base;}
U0 AdventureSettingsPacket_Init(AdventureSettingsPacket *self) { memset(self,0,sizeof(AdventureSettingsPacket));Packet_Init(self);self->packetId=PID_ADVENTURE_SETTINGS_PACKET;self->readFn=&AdventureSettingsPacket_read;self->writeFn=&AdventureSettingsPacket_write;self->destroyFn=&AdventureSettingsPacket_Destroy;}
U0 AdventureSettingsPacket_set(AdventureSettingsPacket *self,I32 flag,Bool enabled) { if(enabled)self->flags|=flag;else self->flags&=~flag; }

#endif

