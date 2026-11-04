#ifndef MC021_ENTITY_DATA_SYNCHEDENTITYDATA
#define MC021_ENTITY_DATA_SYNCHEDENTITYDATA
class MCSynchedEntry021 {I32 id;DataItem2 *item;};
class SynchedEntityData {MCVector data;Bool isDirty;};
U0 SynchedEntityData_Init(SynchedEntityData *s);
DataItem2 *SynchedEntityData_Find(SynchedEntityData *s,I32 id);
Bool SynchedEntityData_DefineOwned(SynchedEntityData *s,DataItem2 *item);
U0 SynchedEntityData_Destroy(SynchedEntityData *s);
I8 SynchedEntityData_getByte(SynchedEntityData *s,I32 id);
I16 SynchedEntityData_getShort(SynchedEntityData *s,I32 id);
I32 SynchedEntityData_getInt(SynchedEntityData *s,I32 id);
F32 SynchedEntityData_getFloat(SynchedEntityData *s,I32 id);
U0 SynchedEntityData_getString(SynchedEntityData *s,I32 id,MCString *out);
U0 SynchedEntityData_getItemInstance(SynchedEntityData *s,I32 id,MCPacketItem009 *out);
U0 SynchedEntityData_getPos(SynchedEntityData *s,I32 id,Pos *out);
Bool SynchedEntityData_markDirty(SynchedEntityData *s,I32 id);
Bool SynchedEntityData_SetValue(SynchedEntityData *s,I32 id,DataItem2 *value);
U0 SynchedEntityData_assignValuesMode(SynchedEntityData *s,MCPtrVector *values,Bool fixByteBug);
U0 SynchedEntityData_assignValues(SynchedEntityData *s,MCPtrVector *values);
Bool SynchedEntityData_Flag(SynchedEntityData *s,I32 id,I32 bit,Bool set);
Bool SynchedEntityData_setFlag(SynchedEntityData *s,I32 id,I32 bit);
Bool SynchedEntityData_clearFlag(SynchedEntityData *s,I32 id,I32 bit);
U0 SynchedEntityData_packDirty(SynchedEntityData *s,MCPtrVector *out);
U0 SynchedEntityData_writeDataItem(IDataOutput *out,DataItem2 *p);
U0 SynchedEntityData_pack(MCPtrVector *values,IDataOutput *out);
U0 SynchedEntityData_packAll(SynchedEntityData *s,IDataOutput *out);
Bool SynchedEntityData_unpack(IDataInput *input,MCPtrVector *out);

Bool SynchedEntityData_setByte(SynchedEntityData *s,I32 id,I8 value);
Bool SynchedEntityData_setShort(SynchedEntityData *s,I32 id,I16 value);
Bool SynchedEntityData_setInt(SynchedEntityData *s,I32 id,I32 value);
Bool SynchedEntityData_setFloat(SynchedEntityData *s,I32 id,F32 value);
#endif
