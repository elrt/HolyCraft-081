// Batch 005. Source: minecraftpe/impl/tile/IceTile.cpp
U0 IceTile_Init(IceTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->slipperiness=0.98;self->ticking=TRUE; }
U0 IceTile_tick(IceTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r) { if(self->blockID<0 || self->blockID>=4096)MCBlockMissing();if(MCLeafWorld_brightness(w,x,y,z)>11-MC_blocks.lightBlock[self->blockID]) { MCBlock_Spawn(self,w,x,y,z,MCLeafWorld_getData(w,x,y,z));MCLeafWorld_setTile(w,x,y,z,MC_blocks.calmWater,3); } }
I32 IceTile_getResourceCount(IceTile *self,Random *r) { return 0; }
U0 IceTile_playerDestroy(IceTile *self,MCBlockWorld *w,MCBlockActor *p,I32 x,I32 y,I32 z,I32 data) { Material *m=MCLeafWorld_getMaterial(w,x,y-1,z);if(!m)MCBlockMissing();if(Material_blocksMotion(m) || Material_isLiquid(m))MCLeafWorld_setTile(w,x,y,z,MC_blocks.water,3); }
U0 IceTile_Destroy(IceTile *self) { MCBlock_Destroy(self); }

