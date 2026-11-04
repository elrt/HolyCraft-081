// Batch 009: minecraftpe/headers/network/packet/SendInventoryPacket.hpp
class SendInventoryPacket : Packet { I32 field_C;MCVector items;I16 field_1C;U8 field_1E;I8 field_1F; };
U0 SendInventoryPacket_Init(SendInventoryPacket *s);U0 SendInventoryPacket_Destroy(Packet *p);U0 SendInventoryPacket_write(Packet *p,MCBitStream *stream);U0 SendInventoryPacket_read(Packet *p,MCBitStream *stream);
