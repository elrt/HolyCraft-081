#ifndef MCPE_BATCH021_SIGN_BRIDGE
#define MCPE_BATCH021_SIGN_BRIDGE
U0 MC021_SignKey(I32 i,MCString *key) {U8 *s="Text1";if(i==1)s="Text2";else if(i==2)s="Text3";else if(i==3)s="Text4";MCString_FromC(key,s);}
U0 *MC021_SignNewTag(U0 *ctx) {CompoundTag *tag=MC_Alloc(sizeof(CompoundTag));CompoundTag_InitEmpty(tag);return tag;}
U0 MC021_SignFreeTag(U0 *ctx,U0 *tag) {Tag_DeleteDeep(tag);}
U0 MC021_SignGetText(U0 *ctx,U0 *tag,I32 i,MCString *out) {MCString key;MC021_SignKey(i,&key);CompoundTag_getString(tag,&key,out);MCString_Destroy(&key);}
U0 MC021_SignPutText(U0 *ctx,U0 *tag,I32 i,MCString *text) {MCString key;MC021_SignKey(i,&key);CompoundTag_putString(tag,&key,text);MCString_Destroy(&key);}
U0 *MC021_SignNewPacket(U0 *ctx,I32 x,I32 y,I32 z,U0 *tag) {EntityDataPacket *p=MC_Alloc(sizeof(EntityDataPacket));EntityDataPacket_InitValues(p,x,y,z,tag);return p;}
// Installs only the data/packet layer, leaving all actual world/base hooks intact.
U0 MC021_ConnectSignData(MCSignHost019 *host) {host->newTag=&MC021_SignNewTag;host->freeTag=&MC021_SignFreeTag;host->getText=&MC021_SignGetText;host->putText=&MC021_SignPutText;host->newPacket=&MC021_SignNewPacket;}
U0 MC021_SignReceive(SignTileEntity *sign,EntityDataPacket *packet) {if(packet->data)SignTileEntity_onUpdatePacket(sign,packet->data);}
#endif
