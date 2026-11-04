// Batch 005. Source: minecraftpe/impl/tile/HeavyTile.cpp
Bool HeavyTile_isFree(MCBlockWorld *w,I32 x,I32 y,I32 z) { I32 id=MCLeafWorld_getTile(w,x,y,z);if(!id || id==MC_blocks.fire)return TRUE;if(id<0 || id>=4096 || !MC_blocks.materials[id]) { printf("Missing material for block %d\n",id);MCBlockMissing(); }Material *m=MC_blocks.materials[id];return m==Material_water || m==Material_lava; }
U0 HeavyTile_Init(HeavyTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat); }
U0 HeavyTile_InitSand(HeavyTile *self,I32 id,MCString *name) { HeavyTile_Init(self,id,name,Material_sand); }
I32 HeavyTile_getTickDelay(HeavyTile *self) { return 2; }
U0 HeavyTile_falling(HeavyTile *self,U0 *entity) {  }
U0 HeavyTile_onLand(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 data) {  }
U0 HeavyTile_checkSlide(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { I32 yy=y,data;U0 *entity;F32 fx,fy,fz;if(HeavyTile_isFree(w,x,y-1,z) && yy>=0) { if(!HeavyTile_instaFall && MCLeafWorld_hasChunksAt(w,x-32,yy-32,z-32,x+32,yy+32,z+32)) { if(!w->isClient) { data=MCLeafWorld_getData(w,x,yy,z);fx=x+0.5;fy=yy+0.5;fz=z+0.5;entity=MCLeafWorld_createFalling(w,fx,fy,fz,self->blockID,data);if(self->fall)self->fall(self,entity);else HeavyTile_falling(self,entity);MCLeafWorld_addEntity(w,entity); } }else { MCLeafWorld_setTile(w,x,yy,z,0,3);while(HeavyTile_isFree(w,x,yy-1,z)) { if(!yy)return;--yy; }if(yy)MCLeafWorld_setTile(w,x,yy,z,self->blockID,3); } } }
U0 HeavyTile_tick(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r) { if(!w->isClient)HeavyTile_checkSlide(self,w,x,y,z); }
U0 HeavyTile_onPlace(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { I32 delay=2;if(self->tickDelay)delay=self->tickDelay(self);MCLeafWorld_addTick(w,x,y,z,self->blockID,delay); }
U0 HeavyTile_neighborChanged(HeavyTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d) { HeavyTile_onPlace(self,w,x,y,z); }
U0 HeavyTile_Destroy(HeavyTile *self) { MCBlock_Destroy(self); }

