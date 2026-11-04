// Batch 009: minecraftpe/headers/network/packet/DropItemPacket.hpp
class DropItemPacket : Packet { I32 eid;U8 motionType;MCPacketItem009 itemInstance; };
U0 DropItemPacket_Init(DropItemPacket *s);U0 DropItemPacket_InitValues(DropItemPacket *s,I32 eid,U8 motionType,MCPacketItem009 *item);U0 DropItemPacket_write(Packet *p,MCBitStream *stream);U0 DropItemPacket_read(Packet *p,MCBitStream *stream);
