// Batch 009: minecraftpe/headers/network/packet/AddEntityPacket.hpp
class AddEntityPacket : Packet { I32 eid;F32 x,y,z,motionX,motionY,motionZ;I32 type,did; };
U0 AddEntityPacket_Init(AddEntityPacket *s);U0 AddEntityPacket_InitEntity(AddEntityPacket *s,MCPacketEntity009 *e,I32 did);U0 AddEntityPacket_write(Packet *p,MCBitStream *stream);U0 AddEntityPacket_read(Packet *p,MCBitStream *stream);
