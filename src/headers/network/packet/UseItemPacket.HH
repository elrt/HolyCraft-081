// Batch 009: minecraftpe/headers/network/packet/UseItemPacket.hpp
class UseItemPacket : Packet { I32 x,y,z,face;F32 faceX,faceY,faceZ,posX,posY,posZ;I32 entityID;U16 itemId;U8 blockMeta;MCPacketItem009 item; };
U0 UseItemPacket_Init(UseItemPacket *s);U0 UseItemPacket_InitValues(UseItemPacket *s,I32 eid,I32 x,I32 y,I32 z,I32 face,I32 id,I32 meta);U0 UseItemPacket_InitEntity(UseItemPacket *s,MCPacketEntity009 *e,I32 x,I32 y,I32 z,I32 face,F32 fx,F32 fy,F32 fz,MCPacketItem009 *it);U0 UseItemPacket_write(Packet *p,MCBitStream *stream);U0 UseItemPacket_read(Packet *p,MCBitStream *stream);
