U0 MC028_Notice(MCApp028 *s,U8 *text){snprintf(s->notice,256,"%s",text);s->noticeTicks=80;}
U0 MC028_Error(MCApp028 *s,U8 *text){snprintf(s->error,512,"%s",text);s->failed=TRUE;printf("ERROR028 %s\n",s->error);}
I32 MC028_FeatureGet(U0 *ctx,I32 x,I32 y,I32 z){MCApp028 *s=ctx;return Level_getTile(&s->level,x,y,z);}
U0 MC028_FeatureSet(U0 *ctx,I32 x,I32 y,I32 z,I32 id,I32 meta,I32 flags){MCApp028 *s=ctx;if(!Level_InBounds(x,y,z) || !Level_getChunk(&s->level,x>>4,z>>4,FALSE))return;Level_setTileAndData(&s->level,x,y,z,id,meta,flags);}
I32 MC028_FeatureMaterial(U0 *ctx,I32 x,I32 y,I32 z){MCApp028 *s=ctx;return s->catalog.registry.tiles[Level_getTile(&s->level,x,y,z)].material;}
Bool MC028_FeatureSurvive(U0 *ctx,I32 id,I32 x,I32 y,I32 z){MCApp028 *s=ctx;I32 below=Level_getTile(&s->level,x,y-1,z);if(id==81)return below==12 || below==81;if(id==83)return below==2 || below==3 || below==12 || below==83;return below==2 || below==3;}
U0 MC028_FeatureTick(U0 *ctx,I32 id,I32 x,I32 y,I32 z,Random *rng){MC028_TileTick(ctx,id,x,y,z);}
U0 MC028_SkyColumn(MCApp028 *s,LevelChunk *c,I32 x,I32 z){I32 y,light=15,height=0;for(y=127;y>=0;y--){I32 id=LevelChunk_getTile(c,x,y,z),opacity=s->catalog.registry.tiles[id].opacity;if(opacity>0 && height==0)height=y+1;light-=opacity;if(light<0)light=0;DataLayer_set(&c->skyLight,x,y,z,light);}c->heightMap[x+16*z]=height;}
U0 MC028_ChunkLight(MCApp028 *s,LevelChunk *c){I32 x,z;for(x=0;x<16;x++)for(z=0;z<16;z++)MC028_SkyColumn(s,c,x,z);}
Bool MC028_Ensure(MCApp028 *s,I32 cx,I32 cz){if(cx<0 || cz<0 || cx>15 || cz>15)return FALSE;if(s->level.chunks[cx+16*cz])return TRUE;Bool fromDisk=FALSE;
 if(s->previousOpen && s->previous.locations[cx+32*cz]){if(!Level_loadChunk(&s->level,&s->previous,cx,cz)){MC028_Error(s,"Saved chunk is corrupt; it will not be replaced by generated terrain.");return FALSE;}fromDisk=TRUE;s->loaded++;}
 else {if(!RandomLevelSource_getChunk(&s->generator,cx,cz)){MC028_Error(s,"Terrain generation failed");return FALSE;}LargeCaveFeature cave;LargeCaveFeature_Init(&cave,8,9,1,3,2,11);LargeFeature_apply(&cave.base,&s->features,cx,cz,s->level.chunks[cx+16*cz]->tiles,0);LargeFeature_Destroy(&cave.base);s->generated++;}
 LevelChunk *chunk=s->level.chunks[cx+16*cz];chunk->decorated=fromDisk;MC028_ChunkLight(s,chunk);return TRUE;
}
U0 MC028_Decorate(MCApp028 *s,LevelChunk *c){if(c->decorated)return;Random rng;U32 mixed=s->seed(U32)^(c->chunkX*3418731287(U32))^(c->chunkZ*1328979875(U32));Random_setSeed(&rng,mixed);I32 i,x,y,z;OreFeature ore;I32 oreIds[5]={16,15,14,56,13},sizes[5]={16,8,8,7,16},tries[5]={12,8,2,1,4},ceiling[5]={96,64,32,16,96};I32 k;
 for(k=0;k<5;k++){OreFeature_Init(&ore,oreIds[k],sizes[k]);for(i=0;i<tries[k];i++){x=c->chunkX*16+(Random_genrand_int32(&rng)%16)-8;z=c->chunkZ*16+(Random_genrand_int32(&rng)%16)-8;y=Random_genrand_int32(&rng)%ceiling[k];OreFeature_place(&ore,&s->features,&rng,x,y,z);}}
 TreeFeature tree;TreeFeature_Init(&tree,FALSE,0);for(i=0;i<4;i++){x=c->chunkX*16+2+Random_genrand_int32(&rng)%12;z=c->chunkZ*16+2+Random_genrand_int32(&rng)%12;I32 h=127;while(h>0 && !Level_getTile(&s->level,x,h-1,z))h--;if(Level_getTile(&s->level,x,h-1,z)==2 && h>62 && h<112)TreeFeature_place(&tree,&s->features,&rng,x,h,z);}
 for(i=0;i<12;i++){x=c->chunkX*16+Random_genrand_int32(&rng)%16;z=c->chunkZ*16+Random_genrand_int32(&rng)%16;for(y=126;y>0 && !Level_getTile(&s->level,x,y,z);y--){}if(Level_getTile(&s->level,x,y,z)==2 && !Level_getTile(&s->level,x,y+1,z)){I32 plant=31;if(i==0)plant=37;if(i==1)plant=38;Level_setTileAndData(&s->level,x,y+1,z,plant,1,0);}}
 c->decorated=TRUE;c->unsaved=TRUE;
}
U0 MC028_Dirty(MCApp028 *s,I32 x,I32 y,I32 z){I32 cx=x>>4,cz=z>>4,sx,sy,sz;for(sx=cx-1;sx<=cx+1;sx++)for(sz=cz-1;sz<=cz+1;sz++){if(sx<0 || sx>15 || sz<0 || sz>15)continue;MCChunk028 *chunk=s->meshes[sx+16*sz];if(!chunk)continue;for(sy=0;sy<8;sy++)if(sy*16<=y+1 && sy*16+15>=y-1)chunk->section[sy].dirty=TRUE;}s->unsaved=TRUE;}
U0 MC028_Schedule(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 delay){if(!Level_InBounds(x,y,z) || !Level_getChunk(&s->level,x>>4,z>>4,FALSE))return;I32 i;for(i=0;i<s->level.pendingTicks.size;i++){MCTick025 *t=MCVector_At(&s->level.pendingTicks,i);if(t->x==x && t->y==y && t->z==z && t->id==id)return;}if(s->level.pendingTicks.size>=8192)return;MCTick025 t;t.x=x;t.y=y;t.z=z;t.id=id;t.time=s->level.data.time+delay;MCVector_Push(&s->level.pendingTicks,&t);}
U0 MC028_Relight(MCApp028 *s){
 // Local block-light flood; sky is recomputed per changed column, not a fake global fullbright.
 MCVector queue;MCVector_Init(&queue,sizeof(I32));I32 i,x,y,z,cx,cz;
 for(i=0;i<256;i++){LevelChunk *c=s->level.chunks[i];if(!c)continue;memset(c->blockLight.data,0,c->blockLight.layerSize);for(x=0;x<16;x++)for(z=0;z<16;z++)for(y=0;y<128;y++){I32 id=LevelChunk_getTile(c,x,y,z),light=s->catalog.registry.tiles[id].emission;if(!light)continue;DataLayer_set(&c->blockLight,x,y,z,light);I32 packed=y|((x+c->chunkX*16)<<7)|((z+c->chunkZ*16)<<15);MCVector_Push(&queue,&packed);}}
 I32 dX[6]={-1,1,0,0,0,0},dY[6]={0,0,-1,1,0,0},dZ[6]={0,0,0,0,-1,1},head=0;
 while(head<queue.size){I32 packed=*(MCVector_At(&queue,head)(I32*));head++;x=(packed>>7)&255;z=(packed>>15)&255;y=packed&127;LevelChunk *c=Level_getChunk(&s->level,x>>4,z>>4,FALSE);I32 value=DataLayer_get(&c->blockLight,x&15,y,z&15),side;for(side=0;side<6;side++){I32 nx=x+dX[side],ny=y+dY[side],nz=z+dZ[side];if(!Level_InBounds(nx,ny,nz))continue;LevelChunk *n=Level_getChunk(&s->level,nx>>4,nz>>4,FALSE);if(!n)continue;I32 opacity=s->catalog.registry.tiles[LevelChunk_getTile(n,nx&15,ny,nz&15)].opacity;if(opacity<1)opacity=1;I32 next=value-opacity;if(next>DataLayer_get(&n->blockLight,nx&15,ny,nz&15)){DataLayer_set(&n->blockLight,nx&15,ny,nz&15,next);I32 q=ny|(nx<<7)|(nz<<15);MCVector_Push(&queue,&q);}}}
 MCVector_Destroy(&queue);for(i=0;i<256;i++)if(s->meshes[i])for(y=0;y<8;y++)s->meshes[i]->section[y].dirty=TRUE;
}
U0 MC028_LiquidMix(U0 *ctx,Level *l,I32 x,I32 y,I32 z){I32 id=Level_getTile(l,x,y,z);if(id!=10 && id!=11)return;I32 dx[6]={-1,1,0,0,0,0},dy[6]={0,0,-1,1,0,0},dz[6]={0,0,0,0,-1,1},i;for(i=0;i<6;i++){I32 n=Level_getTile(l,x+dx[i],y+dy[i],z+dz[i]);if(n==8 || n==9){I32 result=4;if(Level_getData(l,x,y,z)==0)result=49;Level_setTileAndData(l,x,y,z,result,0,3);return;}}}
U0 MC028_TileTick(U0 *ctx,I32 id,I32 x,I32 y,I32 z){MCApp028 *s=ctx;Level *l=&s->level;
 if(id==12 || id==13){I32 below=Level_getTile(l,x,y-1,z);if(y>0 && MC35_FallFree(below) && MC035_Fall(s,x,y,z,id))return;if(y>0 && (below==0 || below==8 || below==9 || below==51)){I32 meta=Level_getData(l,x,y,z);Level_setTileAndData(l,x,y,z,0,0,3);Level_setTileAndData(l,x,y-1,z,id,meta,3);MC028_Schedule(s,x,y-1,z,id,2);}}
 if(id==8)LiquidTileDynamic_tick(&s->water,l,x,y,z,&l->world.random);
 if(id==10)LiquidTileDynamic_tick(&s->lava,l,x,y,z,&l->world.random);
 if(id==51)FireTile_tick(&s->fire,l,x,y,z,&l->world.random);
 if(id==18)LeafTile_tick(&s->leaf,l,x,y,z,&l->world.random);
 if(id==6 || id==31 || id==37 || id==38 || id==50){I32 below=Level_getTile(l,x,y-1,z);if(!s->catalog.registry.tiles[below].solid){Level_setTileAndData(l,x,y,z,0,0,3);MC027_DropAt(l,x,y,z,id,1,0);}}
}
U0 MC028_LevelEvent(U0 *ctx,MCWorldEvent023 *e){MCApp028 *s=ctx;if(!s->worldReady)return;
 if(e->op==MC023_DIRTY){MC028_Dirty(s,e->x,e->y,e->z);LevelChunk *c=Level_getChunk(&s->level,e->x>>4,e->z>>4,FALSE);if(c)MC028_SkyColumn(s,c,e->x&15,e->z&15);}
 if(e->op==MC023_NEIGHBOR){I32 dx[7]={0,-1,1,0,0,0,0},dy[7]={0,0,0,-1,1,0,0},dz[7]={0,0,0,0,0,-1,1},i;for(i=0;i<7;i++){I32 x=e->x+dx[i],y=e->y+dy[i],z=e->z+dz[i],id=Level_getTile(&s->level,x,y,z);MC035_Neighbor(s,x,y,z,id);id=Level_getTile(&s->level,x,y,z);if(id==12 || id==13 || id==8 || id==10 || id==51 || id==6 || id==31 || id==37 || id==38 || id==50)MC028_Schedule(s,x,y,z,id,3);if(id==9 || id==11){I32 moving=id-1;Level_setTileAndData(&s->level,x,y,z,moving,Level_getData(&s->level,x,y,z),2);MC028_Schedule(s,x,y,z,moving,5);}}}
}
U0 MC028_WorldEvent(U0 *ctx,MCWorldEvent023 *e){Level *l=ctx;MCApp028 *s=l->ctx;
 if(e->op==MC023_WILL_DESTROY && e->id==17){I32 x,y,z;for(x=e->x-4;x<=e->x+4;x++)for(y=e->y-4;y<=e->y+4;y++)for(z=e->z-4;z<=e->z+4;z++)if(Level_getTile(l,x,y,z)==18){I32 data=Level_getData(l,x,y,z);if(!(data&4)){Level_setTileAndData(l,x,y,z,18,data|8,2);MC028_Schedule(s,x,y,z,18,10);}}}if(e->op==MC023_WILL_DESTROY && s->catalog.registry.tiles[e->id].emission)s->lightsDirty=TRUE;if(e->op==MC023_WILL_DESTROY)MC032_WillDestroy(s,e->x,e->y,e->z,e->id,e->meta);
 if(e->op!=MC023_PLAYER_DESTROY){MC025_LevelEvent(ctx,e);return;}
 l->eventCount[MC023_PLAYER_DESTROY]++;I32 id=e->id,meta=e->meta,count=1;
 if(MC032_Drops(s,e->x,e->y,e->z,id,meta))return;if(id==18){LeafTile_playerDestroy(&s->leaf,l,&s->minecraft.player->player,e->x,e->y,e->z,meta);return;}
 if(id==1)id=4;if(id==2)id=3;if(id==16)id=263;if(id==56)id=264;if(id==73 || id==74){id=331;count=4;}if(id==21){id=351;meta=4;count=4;}
 if(id==20 || id==7 || id==95 || id==8 || id==9 || id==10 || id==11 || id==51)return;
 MC027_DropAt(l,e->x,e->y,e->z,id,count,meta);
}
