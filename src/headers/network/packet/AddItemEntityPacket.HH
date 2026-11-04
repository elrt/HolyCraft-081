// Batch 009: minecraftpe/headers/network/packet/AddItemEntityPacket.hpp
class AddItemEntityPacket : Packet { I32 eid;F32 x,y,z;I16 itemID,itemMeta;I8 count,motionX,motionY,motionZ; };
U0 AddItemEntityPacket_Init(AddItemEntityPacket *s);U0 AddItemEntityPacket_InitEntity(AddItemEntityPacket *s,MCPacketEntity009 *e,MCPacketItem009 *item);U0 AddItemEntityPacket_write(Packet *p,MCBitStream *stream);U0 AddItemEntityPacket_read(Packet *p,MCBitStream *stream);
