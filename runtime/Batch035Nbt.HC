// Batch035: PE-format entities.dat (ExternalFileLevelStorage::saveEntities/loadEntities).
// File = "ENT\0" + int 1 + int n + little-endian named NBT compound {Entities:[...],TileEntities:[...]}.
// Written into every snapshot next to the PE-format level.dat/chunks.dat so the folder is a complete PE 0.8.1 world.
// On load it is only *imported* when the port's own exact runtime files are absent (a world copied from real MCPE).
CompoundTag *MC35_NewC(){CompoundTag *c=MC_Alloc(sizeof(CompoundTag));CompoundTag_InitEmpty(c);return c;}
U0 MC35_PutS(CompoundTag *t,U8 *k,U8 *v){MCString s;MCString_FromC(&s,v);MC024_PutString(t,k,&s);MCString_Destroy(&s);}
U0 MC35_PutEnt(CompoundTag *t,I32 id,F32 x,F32 y,F32 z,F32 mx,F32 my,F32 mz,F32 yaw,F32 pitch,F32 fall,I32 fire,I32 air,Bool ground){
 MC024_PutInt(t,"id",id);F32 pos[3],mo[3],rot[2];pos[0]=x;pos[1]=y;pos[2]=z;mo[0]=mx;mo[1]=my;mo[2]=mz;rot[0]=yaw;rot[1]=pitch;
 MC025_FloatList(t,"Pos",pos,3);MC025_FloatList(t,"Motion",mo,3);MC025_FloatList(t,"Rotation",rot,2);MC025_PutFloat(t,"FallDistance",fall);MC025_PutShort(t,"Fire",fire);MC025_PutShort(t,"Air",air);MC025_PutByte(t,"OnGround",ground);}
U0 MC35_PutItem(CompoundTag *t,I32 id,I32 count,I32 aux){MC025_PutShort(t,"id",id);MC025_PutByte(t,"Count",count);MC025_PutShort(t,"Damage",aux);}
ListTag *MC35_Items(MC32TE *te,I32 n){ListTag *l=MC_Alloc(sizeof(ListTag));ListTag_InitEmpty(l);I32 j;for(j=0;j<n;j++){ItemInstance *it=te->it[j];if(!MC029_ValidItem(it))continue;CompoundTag *c=MC35_NewC();MC025_PutByte(c,"Slot",j);MC35_PutItem(c,ItemInstance_getId(it),it->count,it->metadata);ListTag_add(l,c);}return l;}
I32 g35_nbtEnt,g35_nbtTe;
Bool MC035_SaveNBT(MCApp028 *s,U8 *stage){ListTag *ents=MC_Alloc(sizeof(ListTag));ListTag_InitEmpty(ents);ListTag *tes=MC_Alloc(sizeof(ListTag));ListTag_InitEmpty(tes);I32 i;CompoundTag *c;
 for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(m->removed || m->e.body.health<=0)continue;MCBody023 *b=&m->e.body;c=MC35_NewC();
  MC35_PutEnt(c,m->kind,b->x,b->y,b->z,b->motionX,b->motionY,b->motionZ,m->bodyRot,b->pitch,m->e.fallDistance,m->e.fire,m->airSupply,b->onGround);
  MC025_PutShort(c,"Health",b->health);MC025_PutShort(c,"HurtTime",m->hurtTime);MC025_PutShort(c,"DeathTime",m->deathTime);MC025_PutShort(c,"AttackTime",0);
  if(m->kind<32){MC024_PutInt(c,"Age",m->age);MC024_PutInt(c,"InLove",m->inLove);}
  if(m->kind==13){MC025_PutByte(c,"Sheared",m->sheared);MC025_PutByte(c,"Color",m->color);}
  if(m->kind==36)MC025_PutShort(c,"Anger",m->anger);
  ListTag_add(ents,c);}
 for(i=0;i<s->level.drops.size;i++){ItemEntity *d=s->level.drops.data[i];if(d->dead || !MC029_ValidItem(&d->item))continue;c=MC35_NewC();
  MC35_PutEnt(c,64,d->x,d->y,d->z,d->motionX,d->motionY,d->motionZ,d->yaw,d->pitch,0,0,300,d->onGround);
  MC025_PutShort(c,"Health",d->healthValue);MC025_PutShort(c,"Age",d->ticks);CompoundTag *it=MC35_NewC();MC35_PutItem(it,ItemInstance_getId(&d->item),d->item.count,d->item.metadata);MC023_TagPut(c,"Item",it);ListTag_add(ents,c);}
 for(i=0;i<g34_arrowN;i++){MC34Arrow *a=&g34_arrow[i];if(a->removed)continue;c=MC35_NewC();
  MC35_PutEnt(c,80,a->x,a->y,a->z,a->mx,a->my,a->mz,a->yaw,a->pitch,0,0,300,FALSE);
  MC025_PutShort(c,"xTile",a->gx);MC025_PutShort(c,"yTile",a->gy);MC025_PutShort(c,"zTile",a->gz);MC025_PutByte(c,"inTile",a->gt);MC025_PutByte(c,"shake",a->shake);MC025_PutByte(c,"inGround",a->inGround);MC025_PutByte(c,"inData",a->gd);MC025_PutByte(c,"player",a->fromPlayer);ListTag_add(ents,c);}
 for(i=0;i<g35_throwN;i++){MC35Throw *t=&g35_throw[i];if(t->removed)continue;I32 tid=81;if(t->item==344)tid=82;c=MC35_NewC();
  MC35_PutEnt(c,tid,t->x,t->y,t->z,t->mx,t->my,t->mz,0,0,0,0,300,FALSE);MC025_PutShort(c,"xTile",-1);MC025_PutShort(c,"yTile",-1);MC025_PutShort(c,"zTile",-1);MC025_PutByte(c,"inTile",0);MC025_PutByte(c,"shake",0);MC025_PutByte(c,"inGround",0);ListTag_add(ents,c);}
 for(i=0;i<g35_paintN;i++){MC35Paint *p=&g35_paint[i];if(p->removed)continue;c=MC35_NewC();
  MC35_PutEnt(c,83,p->x,p->y,p->z,0,0,0,p->yaw,0,0,0,300,FALSE);I32 legacy[4];legacy[0]=2;legacy[1]=1;legacy[2]=0;legacy[3]=3;
  MC025_PutByte(c,"Direction",p->dir);MC025_PutByte(c,"Dir",legacy[p->dir&3]);MC024_PutInt(c,"TileX",p->tx);MC024_PutInt(c,"TileY",p->ty);MC024_PutInt(c,"TileZ",p->tz);MC35_PutS(c,"Motive",g35_motName[p->motive]);ListTag_add(ents,c);}
 for(i=0;i<g35_fallN;i++){MC35Fall *f=&g35_fall[i];if(f->removed)continue;c=MC35_NewC();
  MC35_PutEnt(c,66,f->x,f->y,f->z,0,f->my,0,0,0,0,0,300,FALSE);MC025_PutByte(c,"Tile",f->id);MC025_PutByte(c,"Data",f->meta);MC025_PutByte(c,"Time",f->time);ListTag_add(ents,c);}
 for(i=0;i<g32_teN;i++){MC32TE *te=g32_te[i];I32 id=Level_getTile(&s->level,te->x,te->y,te->z);c=NULL;
  if(te->kind==1 && id==54){c=MC35_NewC();MC35_PutS(c,"id","Chest");MC024_PutInt(c,"x",te->x);MC024_PutInt(c,"y",te->y);MC024_PutInt(c,"z",te->z);MC023_TagPut(c,"Items",MC35_Items(te,27));}
  if(te->kind==2 && (id==61 || id==62)){c=MC35_NewC();MC35_PutS(c,"id","Furnace");MC024_PutInt(c,"x",te->x);MC024_PutInt(c,"y",te->y);MC024_PutInt(c,"z",te->z);MC025_PutShort(c,"BurnTime",te->burn);MC025_PutShort(c,"CookTime",te->cook);MC023_TagPut(c,"Items",MC35_Items(te,3));}
  if(c)ListTag_add(tes,c);}
 for(i=0;i<g35_reactN;i++){MC35Reactor *r=&g35_react[i];c=MC35_NewC();MC35_PutS(c,"id","NetherReactor");MC024_PutInt(c,"x",r->x);MC024_PutInt(c,"y",r->y);MC024_PutInt(c,"z",r->z);MC025_PutByte(c,"IsInitialized",r->init);MC025_PutShort(c,"Progress",r->progress);MC025_PutByte(c,"HasFinished",r->finished);ListTag_add(tes,c);}
 g35_nbtEnt=ents->value.size;g35_nbtTe=tes->value.size;
 CompoundTag root;CompoundTag_InitEmpty(&root);MC023_TagPut(&root,"Entities",ents);MC023_TagPut(&root,"TileEntities",tes);
 MCMemoryOutput bytes;MCMemoryOutput_Init(&bytes);Tag_writeNamedTag(&root,&bytes);I32 n=bytes.bytes.size;I32 hd[3];hd[0]=0x544E45;hd[1]=1;hd[2]=n;
 MCString path;MCString_FromC(&path,stage);MC025_Append(&path,"/entities.dat");U0 *file=fopen(path.data,"wb");Bool ok=FALSE;
 if(file){ok=fwrite(hd,4,3,file)==3;if(ok)ok=fwrite(bytes.bytes.data,1,n,file)==n;if(fclose(file))ok=FALSE;}
 MCString_Destroy(&path);Tag_deleteChildren(&root);Tag_Destroy(&root);MCMemoryOutput_Destroy(&bytes);return ok;}
// ---- import (real PE world: entities.dat present, port runtime files absent) ----
Tag *MC35_Get(CompoundTag *t,U8 *k,I32 type){MCString s;MCString_FromC(&s,k);Tag *v=CompoundTag_get(t,&s);MCString_Destroy(&s);if(!v)return NULL;if(Tag_getId(v)!=type)return NULL;return v;}
I32 MC35_GI(CompoundTag *t,U8 *k,I32 def){MCString s;MCString_FromC(&s,k);Tag *v=CompoundTag_get(t,&s);I32 r=def;if(v){I32 ty=Tag_getId(v);if(ty==1)r=CompoundTag_getByte(t,&s);if(ty==2)r=CompoundTag_getShort(t,&s);if(ty==3)r=CompoundTag_getInt(t,&s);}MCString_Destroy(&s);return r;}
Bool MC35_GF(CompoundTag *t,U8 *k,F32 *out,I32 n){ListTag *l=MC35_Get(t,k,9);if(!l)return FALSE;if(l->value.size<n)return FALSE;I32 i;for(i=0;i<n;i++){Tag *e=l->value.data[i];if(Tag_getId(e)!=5)return FALSE;FloatTag *ft=e;out[i]=ft->value;if(!(out[i]>-1.0e7 && out[i]<1.0e7))return FALSE;}return TRUE;}
Bool MC35_Exists(MCApp028 *s,U8 *name){MCString p;MCString_FromC(&p,s->activePath);MC025_Append(&p,name);U0 *f=fopen(p.data,"rb");MCString_Destroy(&p);if(!f)return FALSE;fclose(f);return TRUE;}
I32 g35_impMobs,g35_impItems,g35_impPaint,g35_impTe;
U0 MC35_ImpItems(MCApp028 *s,MC32TE *te,CompoundTag *c,I32 n){ListTag *l=MC35_Get(c,"Items",9);if(!l)return;I32 i;for(i=0;i<l->value.size;i++){CompoundTag *e=l->value.data[i];if(Tag_getId(e)!=10)continue;I32 slot=MC35_GI(e,"Slot",-1),id=MC35_GI(e,"id",0),cnt=MC35_GI(e,"Count",0),aux=MC35_GI(e,"Damage",0);
  if(slot<0 || slot>=n || id<1 || id>511 || !s->catalog.itemExists[id] || cnt<1 || cnt>64 || aux<0)continue;if(te->it[slot])continue;te->it[slot]=MC32_Item(s,id,cnt,aux);}}
I32 MC35_ImportNBT(MCApp028 *s){g35_impMobs=0;g35_impItems=0;g35_impPaint=0;g35_impTe=0;
 if(MC35_Exists(s,"/entities031.dat") || MC35_Exists(s,"/tiles032.dat") || MC35_Exists(s,"/world035.dat"))return 0;
 MCString path;MCString_FromC(&path,s->activePath);MC025_Append(&path,"/entities.dat");MCVector bytes;MC024_BytesInit(&bytes);Bool ok=MC024_ReadFile(path.data,&bytes);MCString_Destroy(&path);
 if(!ok || bytes.size<12){MCVector_Destroy(&bytes);return 0;}
 I32 *hd=bytes.data(I32*);I32 n=hd[2];if(hd[0]!=0x544E45 || n<=0 || n>bytes.size-12){MCVector_Destroy(&bytes);printf("IMPORT035 entities.dat ignored (bad header)\n");return 0;}
 MCMemoryInput in;MCMemoryInput_Init(&in,bytes.data(U8*)+12,n);CompoundTag *root=NbtIo_read(&in);if(!root){MCVector_Destroy(&bytes);printf("IMPORT035 entities.dat ignored (bad NBT)\n");return 0;}
 ListTag *ents=MC35_Get(root,"Entities",9);I32 i;Bool haveDrops=s->level.drops.size>0;F32 pos[3],mo[3],rot[2];
 if(ents){Bool cleared=FALSE;for(i=0;i<ents->value.size;i++){CompoundTag *e=ents->value.data[i];if(Tag_getId(e)!=10)continue;I32 id=MC35_GI(e,"id",-1);
   if(!MC35_GF(e,"Pos",pos,3))continue;if(!(pos[0]>=0 && pos[0]<=256 && pos[1]>-64 && pos[1]<256 && pos[2]>=0 && pos[2]<=256))continue;
   if(!MC35_GF(e,"Motion",mo,3)){mo[0]=0;mo[1]=0;mo[2]=0;}if(!MC35_GF(e,"Rotation",rot,2)){rot[0]=0;rot[1]=0;}
   if(MC34_KindOk(id)){if(!cleared){MC031_ClearMobs();cleared=TRUE;}MC31Mob *m=MC31_New(id,pos[0],pos[1],pos[2],rot[0]);if(!m)continue;MCBody023 *b=&m->e.body;
    I32 hp=MC35_GI(e,"Health",b->health);if(hp<1)continue;if(hp<=20)b->health=hp;b->pitch=rot[1];b->prevPitch=rot[1];m->bodyRot=rot[0];m->prevBodyRot=rot[0];m->headYaw=rot[0];m->prevHeadYaw=rot[0];m->lastHeadYaw=rot[0];
    I32 age=MC35_GI(e,"Age",0);if(age>=-24000 && age<=6000)m->age=age;if(id==13){m->sheared=MC35_GI(e,"Sheared",0)!=0;m->color=MC35_GI(e,"Color",0)&15;}if(id==36){I32 an=MC35_GI(e,"Anger",0);if(an>=0 && an<=2000)m->anger=an;}
    I32 fire=MC35_GI(e,"Fire",0);if(fire>0 && fire<=600)m->e.fire=fire;m->firstTick=TRUE;g35_impMobs++;}
   if(id==64 && !haveDrops){CompoundTag *it=MC35_Get(e,"Item",10);if(!it)continue;I32 iid=MC35_GI(it,"id",0),cnt=MC35_GI(it,"Count",0),aux=MC35_GI(it,"Damage",0);
    if(iid<1 || iid>511 || !s->catalog.itemExists[iid] || cnt<1 || cnt>64 || aux<0)continue;I32 before=s->level.drops.size;MC31_Drop(iid,aux,cnt,pos[0],pos[1],pos[2],0,0,0,FALSE);
    if(s->level.drops.size>before){ItemEntity *d=s->level.drops.data[before];d->x=pos[0];d->y=pos[1];d->z=pos[2];d->motionX=0;d->motionY=0;d->motionZ=0;d->pickupDelay=0;I32 age2=MC35_GI(e,"Age",0);if(age2>=0 && age2<6000)d->ticks=age2;g35_impItems++;}}
   if(id==83 && g35_paintN<MC35_MAXPAINT){MCString key,mot;MCString_FromC(&key,"Motive");CompoundTag_getString(e,&key,&mot);MCString_Destroy(&key);I32 k,mi=-1;for(k=0;k<28;k++)if(mot.data && !strcmp(mot.data,g35_motName[k]))mi=k;MCString_Destroy(&mot);
    I32 dir=MC35_GI(e,"Direction",-1);if(dir<0){I32 lg=MC35_GI(e,"Dir",0);I32 back[4];back[0]=2;back[1]=1;back[2]=0;back[3]=3;dir=back[lg&3];}
    I32 tx=MC35_GI(e,"TileX",0),ty=MC35_GI(e,"TileY",0),tz=MC35_GI(e,"TileZ",0);
    if(mi>=0 && dir>=0 && dir<=3 && Level_InBounds(tx,ty,tz)){MC35Paint *p=&g35_paint[g35_paintN++];memset(p,0,sizeof(MC35Paint));p->tx=tx;p->ty=ty;p->tz=tz;p->motive=mi;MC35_SetDir(p,dir);g35_impPaint++;}}}}
 ListTag *tes=MC35_Get(root,"TileEntities",9);
 if(tes)for(i=0;i<tes->value.size;i++){CompoundTag *e=tes->value.data[i];if(Tag_getId(e)!=10)continue;MCString key,name;MCString_FromC(&key,"id");CompoundTag_getString(e,&key,&name);MCString_Destroy(&key);
  I32 x=MC35_GI(e,"x",-1),y=MC35_GI(e,"y",-1),z=MC35_GI(e,"z",-1);I32 kind=0;if(name.data){if(!strcmp(name.data,"Chest"))kind=1;if(!strcmp(name.data,"Furnace"))kind=2;if(!strcmp(name.data,"NetherReactor"))kind=3;}MCString_Destroy(&name);
  if(!kind || !Level_InBounds(x,y,z))continue;I32 tid=Level_getTile(&s->level,x,y,z);
  if(kind==1 && tid==54){MC32TE *t=MC32_Get(1,x,y,z);if(t){MC35_ImpItems(s,t,e,27);g35_impTe++;}}
  if(kind==2 && (tid==61 || tid==62)){MC32TE *t=MC32_Get(2,x,y,z);if(t){I32 bt=MC35_GI(e,"BurnTime",0),ct=MC35_GI(e,"CookTime",0);if(bt>=0 && bt<=20000){t->burn=bt;t->burnDur=bt;}if(ct>=0 && ct<200)t->cook=ct;MC35_ImpItems(s,t,e,3);g35_impTe++;}}
  if(kind==3 && tid==247 && g35_reactN<MC35_MAXREACT){MC35Reactor *r=&g35_react[g35_reactN++];memset(r,0,sizeof(MC35Reactor));r->x=x;r->y=y;r->z=z;I32 pr=MC35_GI(e,"Progress",0);if(pr>=0 && pr<=2000)r->progress=pr;r->init=MC35_GI(e,"IsInitialized",0)!=0;r->finished=MC35_GI(e,"HasFinished",0)!=0;g35_impTe++;}}
 Tag_DeleteDeep(root);MCVector_Destroy(&bytes);
 printf("IMPORT035 entities.dat mobs=%d items=%d paintings=%d tiles=%d\n",g35_impMobs,g35_impItems,g35_impPaint,g35_impTe);s->unsaved=TRUE;return 1;}
