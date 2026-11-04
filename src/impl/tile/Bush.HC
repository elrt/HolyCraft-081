// Batch 005. Source: minecraftpe/impl/tile/Bush.cpp
U0 Bush_Init(Bush *self,I32 id,MCString *name,Material *mat) { MCBlock_Init(self,id,name,mat);self->ticking=TRUE;self->shape[0]=0.3;self->shape[1]=0;self->shape[2]=0.3;self->shape[3]=0.7;self->shape[4]=0.6;self->shape[5]=0.7; }
U0 Bush_InitPlant(Bush *self,I32 id,MCString *name) { Bush_Init(self,id,name,Material_plant); }
Bool Bush_isCubeShaped(Bush *self) { return FALSE; }
I32 Bush_getRenderShape(Bush *self) { return 1; }
AABB * Bush_getAABB(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { return NULL; }
Bool Bush_isSolidRender(Bush *self) { return FALSE; }
I32 Bush_getRenderLayer(Bush *self) { return 1; }
Bool Bush_mayPlaceOn(Bush *self,I32 id) { return id==MC_blocks.grass || id==MC_blocks.dirt || id==MC_blocks.farmland; }
Bool Bush__soil(Bush *self,I32 id) { if(self->soil)return self->soil(self,id);return Bush_mayPlaceOn(self,id); }
Bool Bush_mayPlace(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,U8 side) { return Bush__soil(self,MCLeafWorld_getTile(w,x,y-1,z)); }
Bool Bush_canSurvive(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { if(MCLeafWorld_rawBrightness(w,x,y,z)<=7 || !MCLeafWorld_canSeeSky(w,x,y,z))return FALSE;return Bush__soil(self,MCLeafWorld_getTile(w,x,y-1,z)); }
Bool Bush_checkAlive(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z) { Bool alive;if(self->survive)alive=self->survive(self,w,x,y,z);else alive=Bush_canSurvive(self,w,x,y,z);if(alive)return TRUE;MCBlock_Spawn(self,w,x,y,z,MCLeafWorld_getData(w,x,y,z));return MCLeafWorld_setTile(w,x,y,z,0,3); }
U0 Bush_tick(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,Random *r) { Bush_checkAlive(self,w,x,y,z); }
U0 Bush_neighborChanged(Bush *self,MCBlockWorld *w,I32 x,I32 y,I32 z,I32 a,I32 b,I32 c,I32 d) { MCBlock_Neighbor(self,w,x,y,z,a,b,c,d);Bush_checkAlive(self,w,x,y,z); }
U0 Bush_Destroy(Bush *self) { MCBlock_Destroy(self); }

