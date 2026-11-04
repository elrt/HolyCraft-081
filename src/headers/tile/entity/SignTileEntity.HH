// Batch 019: SignTileEntity.hpp; this is a projection, not a C++ TileEntity ABI.
#ifndef MCPE_SIGN_TILE_ENTITY_HH
#define MCPE_SIGN_TILE_ENTITY_HH
class MCSignHost019 {
 U0 *ctx;
 U0 (*baseLoad)(U0 *,U0 *tag);Bool (*baseSave)(U0 *,U0 *tag);
 U0 (*getText)(U0 *,U0 *tag,I32 index,MCString *out);U0 (*putText)(U0 *,U0 *tag,I32 index,MCString *text);
 U0 (*baseSetLevelAndPos)(U0 *,U0 *level,I32 x,I32 y,I32 z);I32 (*getTileId)(U0 *,U0 *level,I32 x,I32 y,I32 z);U0 (*setRemoved)(U0 *);
 U0 *(*getTile)(U0 *);U0 *signTile;I32 signId;
 U0 *(*newTag)(U0 *);U0 (*freeTag)(U0 *,U0 *tag);U0 *(*newPacket)(U0 *,I32 x,I32 y,I32 z,U0 *tag);
};
class SignTileEntity {MCSignHost019 *host;MCString textLines[4];I32 field_6C;Bool editable;I32 x,y,z;};
U0 SignTileEntity_Init(SignTileEntity *,MCSignHost019 *);U0 SignTileEntity_Destroy(SignTileEntity *);
Bool SignTileEntity_isEditable(SignTileEntity *);U0 SignTileEntity_setEditable(SignTileEntity *,Bool);Bool SignTileEntity_shouldSave(SignTileEntity *);
U0 SignTileEntity_load(SignTileEntity *,U0 *);Bool SignTileEntity_save(SignTileEntity *,U0 *);U0 SignTileEntity_setLevelAndPos(SignTileEntity *,U0 *,I32,I32,I32);U0 *SignTileEntity_getUpdatePacket(SignTileEntity *);U0 SignTileEntity_onUpdatePacket(SignTileEntity *,U0 *);F32 SignTileEntity_getShadowRadius(SignTileEntity *);
#endif
