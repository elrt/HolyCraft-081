// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
U0 TileEntity_Init(TileEntity *s,I32 type){memset(s,0,sizeof(TileEntity));s->type=type;s->id=++MC024_runningId;s->metadata=-1;MC023_Shape(&s->bounds,0,0,0,1,1,1);}
U0 TileEntity_clearCache(TileEntity *s){s->metadata=-1;s->cachedTile=0;}
U0 TileEntity_setLevelAndPos(TileEntity *s,MCWorld024 *w,I32 x,I32 y,I32 z){s->world=w;s->x=x;s->y=y;s->z=z;MC023_Shape(&s->bounds,x,y,z,x+1,y+1,z+1);if(w)s->cachedTile=MC023_Tile(w->w,x,y,z);}
I32 TileEntity_getData(TileEntity *s){if(s->metadata==-1 && s->world)s->metadata=MC023_Data(s->world->w,s->x,s->y,s->z);return s->metadata;}
U0 TileEntity_setData(TileEntity *s,I32 data){s->metadata=data;if(s->world)MC023_Set(s->world->w,MC023_SET_DATA,s->x,s->y,s->z,0,data,3);}
U0 TileEntity_setChanged(TileEntity *s){if(s->world){s->metadata=MC023_Data(s->world->w,s->x,s->y,s->z);MC023_Event(s->world->w,MC023_CHANGED,s->x,s->y,s->z,0,0,0,s);}}
U0 TileEntity_setRemoved(TileEntity *s){if(s->removed)return;s->removed=TRUE;if(s->world && !s->world->w->isClient)MC023_Event(s->world->w,MC023_PACKET_REMOVE,s->x,s->y,s->z,s->id,0,0,s);}
F32 TileEntity_distanceToSqr(TileEntity *s,F32 x,F32 y,F32 z){x=s->x+0.5-x;y=s->y+0.5-y;z=s->z+0.5-z;return x*x+y*y+z*z;}
U0 TileEntity_load(TileEntity *s,CompoundTag *tag){s->x=MC024_Int(tag,"x");s->y=MC024_Int(tag,"y");s->z=MC024_Int(tag,"z");}
Bool TileEntity_save(TileEntity *s,CompoundTag *tag){U8 *name=NULL;if(s->type==1)name="Furnace";if(s->type==2)name="Chest";if(s->type==3)name="NetherReactor";if(s->type==4)name="Sign";if(!name)return FALSE;MCString n;MCString_FromC(&n,name);MC024_PutString(tag,"id",&n);MCString_Destroy(&n);MC024_PutInt(tag,"x",s->x);MC024_PutInt(tag,"y",s->y);MC024_PutInt(tag,"z",s->z);return TRUE;}
