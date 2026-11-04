// Batch 003. Source: minecraftpe/headers/network/packet/PlayerEquipmentPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_PLAYEREQUIPMENTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_PLAYEREQUIPMENTPACKET_HPP
class PlayerEquipmentPacket : Packet { I32 eid ;
 U16 itemID , itemMeta ;
 I8 slot ;
 I8 align , align2 , align3 ;
 };
U0 PlayerEquipmentPacket_read(Packet *base,MCBitStream *stream) { PlayerEquipmentPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadU16 ( stream , & self -> itemID ) ;
 MCBitStream_ReadU16 ( stream , & self -> itemMeta ) ;
 MCBitStream_ReadI8 ( stream , & self -> slot ) ;
}
U0 PlayerEquipmentPacket_write(Packet *base,MCBitStream *stream) { PlayerEquipmentPacket *self=base;MCBitStream_WriteU8 ( stream , PID_PLAYER_EQUIPMENT_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteU16 ( stream , self -> itemID ) ;
 MCBitStream_WriteU16 ( stream , self -> itemMeta ) ;
 MCBitStream_WriteI8 ( stream , self -> slot ) ;
}
U0 PlayerEquipmentPacket_Destroy(Packet *base) { PlayerEquipmentPacket *self=base;}
U0 PlayerEquipmentPacket_Init(PlayerEquipmentPacket *self) { memset(self,0,sizeof(PlayerEquipmentPacket));Packet_Init(self);self->packetId=PID_PLAYER_EQUIPMENT_PACKET;self->readFn=&PlayerEquipmentPacket_read;self->writeFn=&PlayerEquipmentPacket_write;self->destroyFn=&PlayerEquipmentPacket_Destroy;}
U0 PlayerEquipmentPacket_InitValues(PlayerEquipmentPacket *self,I32 eid , U16 itemId , U16 itemMeta , I8 slot) { PlayerEquipmentPacket_Init(self);self -> eid = eid ;
 self -> itemID = itemId ;
 self -> itemMeta = itemMeta ;
 self -> slot = slot ;
}

#endif

