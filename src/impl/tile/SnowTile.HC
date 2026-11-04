// Batch 005. Source: minecraftpe/impl/tile/SnowTile.cpp
U0 SnowTile_Init(SnowTile *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->ticking=TRUE;self->field_5C=255; }
U0 SnowTile_tick(SnowTile *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r) { if(MCLeafWorld_brightness(w,x,y,z)>11) { MCBlock_Spawn(self,w,x,y,z,MCLeafWorld_getData(w,x,y,z),0);MCLeafWorld_setTile(w,x,y,z,0,3); } }
I32 SnowTile_getResource(SnowTile *self,I32 data,Random *r) { return MC_blocks.snowBall; }
I32 SnowTile_getResourceCount(SnowTile *self,Random *r) { return 4; }
U0 SnowTile_Destroy(SnowTile *self) { MCBlock_Destroy(self); }

