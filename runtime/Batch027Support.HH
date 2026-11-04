// Owned strings, explicit adapters; no engine ABI reinterpretation.
U0 MC027_SetC(MCString *s,U8 *text){MCString t;MCString_FromC(&t,text);MCString_Destroy(s);MCString_MoveInit(s,&t);}
U0 MC027_Append(MCString *s,U8 *data,I64 n){U8 *p=MC_Alloc(s->size+n+1);if(s->size)memcpy(p,s->data,s->size);if(n)memcpy(p+s->size,data,n);p[s->size+n]=0;free(s->data);s->data=p;s->size+=n;}
U0 MC027_Clear(MCString *s){MCString_Destroy(s);MCString_Init(s);}
U0 MC027_DropAt(Level *l,I32 x,I32 y,I32 z,I32 id,I32 count,I32 aux){if(!l->world.isClient && count>0)MC023_Event(&l->world,MC023_DROP,x,y,z,id,aux,count);}

Bool MC027_Empty(Level *l,I32 x,I32 y,I32 z){return !Level_getTile(l,x,y,z);}
Bool MC027_Solid(Level *l,I32 x,I32 y,I32 z){return MC023_Solid(&l->world,x,y,z);}
I32 MC027_Material(Level *l,I32 x,I32 y,I32 z){return MC023_Material(&l->world,x,y,z);}
Bool MC027_SetTile(Level *l,I32 x,I32 y,I32 z,I32 id,I32 flags){return Level_setTileAndData(l,x,y,z,id,0,flags);}
Bool MC027_SetMeta(Level *l,I32 x,I32 y,I32 z,I32 data,I32 flags){return Level_setTileAndData(l,x,y,z,Level_getTile(l,x,y,z),data,flags);}
Bool MC027_SetMetaQuiet(Level *l,I32 x,I32 y,I32 z,I32 data){return MC027_SetMeta(l,x,y,z,data,0);}
Bool MC027_SetTileQuiet(Level *l,I32 x,I32 y,I32 z,I32 id,I32 data){return Level_setTileAndData(l,x,y,z,id,data,0);}
U0 MC027_Neighbors(Level *l,I32 x,I32 y,I32 z,I32 id){MC023_Event(&l->world,MC023_NEIGHBOR,x,y,z,id,0,0);}
