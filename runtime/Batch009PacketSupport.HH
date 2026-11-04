#ifndef MCPE_BATCH009_PACKET_SUPPORT
#define MCPE_BATCH009_PACKET_SUPPORT
// Explicit host projections, not original Entity / ItemInstance object layout.
class MCPacketEntity009 { I32 eid,type;F32 x,y,z,motionX,motionY,motionZ,yaw,pitch,prevYaw,prevPitch; };
class MCPacketItem009 { I32 id,count,aux;Bool valid; };
// Host must install validity hook before reading UseItemPacket, matching its registry.
class MCPacketRegistry009 { Bool (*itemIsValid)(I32 id,I32 count,I32 aux); };
MCPacketRegistry009 MC009_packetRegistry;
#endif
