// Batch 009: minecraftpe/impl/util/PacketUtil.cpp
I8 PacketUtil_Rot_degreesToChar(F32 deg) { return ((deg/360.0)*256)(I8); }
F32 PacketUtil_Rot_charToDegrees(I8 chr) { return (chr(F32)/256.0)*360.0; }
U0 PacketUtil_Rot_entityToChar(MCPacketEntity009 *e,I8 *yaw,I8 *pitch) { *pitch=PacketUtil_Rot_degreesToChar(e->pitch);*yaw=PacketUtil_Rot_degreesToChar(e->yaw); }
U0 PacketUtil_Rot_charToEntity(MCPacketEntity009 *e,I8 yaw,I8 pitch) { e->prevPitch=e->pitch=PacketUtil_Rot_charToDegrees(pitch);e->prevYaw=e->yaw=PacketUtil_Rot_charToDegrees(yaw); }
U0 PacketUtil_writeItemInstance(MCPacketItem009 *it,MCBitStream *s) { MCBitStream_WriteI16(s,it->id);MCBitStream_WriteU8(s,it->count);MCBitStream_WriteI16(s,it->aux); }
U0 PacketUtil_readItemInstance(MCPacketItem009 *out,MCBitStream *s) { I16 id=0,aux=0;U8 count=0;MCBitStream_ReadI16(s,&id);MCBitStream_ReadU8(s,&count);MCBitStream_ReadI16(s,&aux);memset(out,0,sizeof(MCPacketItem009));out->id=-1;if(s->failed)return;if(!MC009_packetRegistry.itemIsValid) { printf("PacketUtil: missing item validity callback\n");exit(95); }if(MC009_packetRegistry.itemIsValid(id,count,aux)) { out->id=id;out->count=count;out->aux=aux;out->valid=TRUE; } }
