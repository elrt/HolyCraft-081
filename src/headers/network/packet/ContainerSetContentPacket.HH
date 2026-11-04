// Batch 009: minecraftpe/headers/network/packet/ContainerSetContentPacket.hpp
class ContainerSetContentPacket : Packet { U8 field_C,field_D,field_E,field_F;MCVector field_10,field_1C; };
U0 ContainerSetContentPacket_Init(ContainerSetContentPacket *s);U0 ContainerSetContentPacket_InitValues(ContainerSetContentPacket *s,I32 c,MCVector *items,I32 unused);U0 ContainerSetContentPacket_Destroy(Packet *p);U0 ContainerSetContentPacket_write(Packet *p,MCBitStream *stream);U0 ContainerSetContentPacket_read(Packet *p,MCBitStream *stream);
