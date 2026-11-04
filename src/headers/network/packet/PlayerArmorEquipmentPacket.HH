// Batch 004. Source: minecraftpe/headers/network/packet/PlayerArmorEquipmentPacket.hpp
#ifndef MCPE_HEADERS_NETWORK_PACKET_PLAYERARMOREQUIPMENTPACKET_HPP
#define MCPE_HEADERS_NETWORK_PACKET_PLAYERARMOREQUIPMENTPACKET_HPP
class PlayerArmorEquipmentPacket : Packet { I32 eid ;
 I8 headId , chestId , legsId , bootsId ;
 };
U0 PlayerArmorEquipmentPacket_write(Packet *base,MCBitStream *stream) { PlayerArmorEquipmentPacket *self=base;MCBitStream_WriteU8 ( stream , PID_PLAYER_ARMOR_EQUIPMENT_PACKET ) ;
 MCBitStream_WriteI32 ( stream , self -> eid ) ;
 MCBitStream_WriteI8 ( stream , self -> headId ) ;
 MCBitStream_WriteI8 ( stream , self -> chestId ) ;
 MCBitStream_WriteI8 ( stream , self -> legsId ) ;
 MCBitStream_WriteI8 ( stream , self -> bootsId ) ;
}
U0 PlayerArmorEquipmentPacket_read(Packet *base,MCBitStream *stream) { PlayerArmorEquipmentPacket *self=base;MCBitStream_ReadI32 ( stream , & self -> eid ) ;
 MCBitStream_ReadI8 ( stream , & self -> headId ) ;
 MCBitStream_ReadI8 ( stream , & self -> chestId ) ;
 MCBitStream_ReadI8 ( stream , & self -> legsId ) ;
 MCBitStream_ReadI8 ( stream , & self -> bootsId ) ;
}
U0 PlayerArmorEquipmentPacket_Destroy(Packet *base) { PlayerArmorEquipmentPacket *self=base; }
U0 PlayerArmorEquipmentPacket_Init(PlayerArmorEquipmentPacket *self) { memset(self,0,sizeof(PlayerArmorEquipmentPacket)); Packet_Init(self); self->packetId=PID_PLAYER_ARMOR_EQUIPMENT_PACKET; self->readFn=&PlayerArmorEquipmentPacket_read; self->writeFn=&PlayerArmorEquipmentPacket_write; self->destroyFn=&PlayerArmorEquipmentPacket_Destroy;}
U0 PlayerArmorEquipmentPacket_InitValues(PlayerArmorEquipmentPacket *self,I32 eid,I32 head,I32 chest,I32 legs,I32 boots) { PlayerArmorEquipmentPacket_Init(self);self->eid=eid;self->headId=head;self->chestId=chest;self->legsId=legs;self->bootsId=boots; }

#endif

