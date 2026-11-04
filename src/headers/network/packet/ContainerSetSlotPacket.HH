// Batch 009: minecraftpe/headers/network/packet/ContainerSetSlotPacket.hpp
class ContainerSetSlotPacket : Packet { I8 field_C,field_D;I16 field_E;MCPacketItem009 field_10; };
U0 ContainerSetSlotPacket_Init(ContainerSetSlotPacket *s);U0 ContainerSetSlotPacket_InitValues(ContainerSetSlotPacket *s,I8 c,I8 d,I16 e,MCPacketItem009 *item);U0 ContainerSetSlotPacket_write(Packet *p,MCBitStream *stream);U0 ContainerSetSlotPacket_read(Packet *p,MCBitStream *stream);
