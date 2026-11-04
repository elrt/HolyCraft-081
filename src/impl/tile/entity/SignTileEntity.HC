// Batch 019: minecraftpe/impl/tile/entity/SignTileEntity.cpp.
U0 SignTileEntity_Init(SignTileEntity *s,MCSignHost019 *h){I32 i;s->host=h;for(i=0;i<4;i++)MCString_Init(&s->textLines[i]);s->field_6C=-1;s->editable=TRUE;s->x=0;s->y=0;s->z=0;}
U0 SignTileEntity_Destroy(SignTileEntity *s){I32 i;for(i=0;i<4;i++)MCString_Destroy(&s->textLines[i]);}
Bool SignTileEntity_isEditable(SignTileEntity *s){return s->editable;}U0 SignTileEntity_setEditable(SignTileEntity *s,Bool value){s->editable=value;}Bool SignTileEntity_shouldSave(SignTileEntity *s){return TRUE;}
U0 SignTileEntity_load(SignTileEntity *s,U0 *tag){I32 i;MCString v,sub;MCSignHost019 *h=s->host;s->editable=FALSE;h->baseLoad(h->ctx,tag);for(i=0;i<4;i++){h->getText(h->ctx,tag,i,&v);MCString_Destroy(&s->textLines[i]);s->textLines[i]=v;}for(i=0;i<4;i++){if(Util_utf8len(&s->textLines[i])>15){Util_utf8substring(&sub,&s->textLines[i],0,15);MCString_Destroy(&s->textLines[i]);s->textLines[i]=sub;}}}
Bool SignTileEntity_save(SignTileEntity *s,U0 *tag){I32 i;MCSignHost019 *h=s->host;if(!h->baseSave(h->ctx,tag))return FALSE;for(i=0;i<4;i++)h->putText(h->ctx,tag,i,&s->textLines[i]);return TRUE;}
U0 SignTileEntity_setLevelAndPos(SignTileEntity *s,U0 *level,I32 x,I32 y,I32 z){MCSignHost019 *h=s->host;h->baseSetLevelAndPos(h->ctx,level,x,y,z);s->x=x;s->y=y;s->z=z;if(h->getTileId(h->ctx,level,x,y,z)!=h->signId)h->setRemoved(h->ctx);}
U0 *SignTileEntity_getUpdatePacket(SignTileEntity *s){MCSignHost019 *h=s->host;U0 *tag=h->newTag(h->ctx),*p;SignTileEntity_save(s,tag);p=h->newPacket(h->ctx,s->x,s->y,s->z,tag);h->freeTag(h->ctx,tag);return p;}
U0 SignTileEntity_onUpdatePacket(SignTileEntity *s,U0 *tag){SignTileEntity_load(s,tag);}
F32 SignTileEntity_getShadowRadius(SignTileEntity *s){if(s->host->getTile(s->host->ctx)==s->host->signTile)return 0.2;return 0;}
