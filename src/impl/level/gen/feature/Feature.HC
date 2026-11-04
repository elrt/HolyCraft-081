// Batch 004. Source: minecraftpe/impl/level/gen/feature/Feature.cpp
U0 Feature_Init(Feature *self,Bool update) { memset(self,0,sizeof(Feature)); self->update=update; }
U0 Feature_placeBlock(Feature *self,MCFeatureWorld *world,I32 x,I32 y,I32 z,I32 id,I32 data=0) { I32 flags=0; if(self->update) flags=3; world->setBlock(world->context,x,y,z,id,data,flags); }
U0 Feature_init(Feature *self,F32 x,F32 y,F32 z) { if(self->init) self->init(self->context,x,y,z); }
U0 Feature_Destroy(Feature *self) { if(self->destroy) self->destroy(self->context); }

