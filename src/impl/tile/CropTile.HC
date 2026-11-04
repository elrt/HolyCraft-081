// Ported from minecraftpe/impl/tile/CropTile.cpp; host-facing representation, not C++ ABI.

U0 CropTile_Init(CropTile *s,MCTileHost020 *h,I32 id,MCString *name) {s->h=h;s->blockID=id;MCString_FromBytes(&s->name,name->data,name->size);h->baseInit(h->ctx,s,id,3,name);h->ticking(h->ctx,s,TRUE);h->shape(h->ctx,s,(0)(F32),(0)(F32),(0)(F32),(1)(F32),(0.25)(F32),(1)(F32));}
F32 CropTile_getGrowthSpeed(CropTile *s,I32 x,I32 y,I32 z) {MCTileHost020 *h=s->h;I32 id=s->blockID;Bool onX=h->tile(h->ctx,x-1,y,z)==id || h->tile(h->ctx,x+1,y,z)==id;Bool onZ=h->tile(h->ctx,x,y,z-1)==id || h->tile(h->ctx,x,y,z+1)==id;Bool diag=h->tile(h->ctx,x-1,y,z-1)==id || h->tile(h->ctx,x+1,y,z-1)==id || h->tile(h->ctx,x+1,y,z+1)==id || h->tile(h->ctx,x-1,y,z+1)==id;F32 speed=1;I32 xx,zz;for(xx=x-1;xx<=x+1;xx++)for(zz=z-1;zz<=z+1;zz++){F32 v=0;if(h->tile(h->ctx,xx,y-1,zz)==h->farmland){if(h->data(h->ctx,xx,y-1,zz)>0)v=3;else v=1;}if(xx!=x || zz!=z)v*=0.25;speed+=v;}if(diag || onX && onZ)return speed*0.5;return speed;}
I32 CropTile_getRenderShape(CropTile *s) {return 6;}
U0 * CropTile_getTexture(CropTile *s,I32 face,I32 meta) {if(meta<0)meta=0;return s->h->texture(s->h->ctx,"wheat_stage_x",meta);}
U0 * CropTile_getWorldTexture(CropTile *s,I32 x,I32 y,I32 z,I32 face) {I32 meta=s->h->data(s->h->ctx,x,y,z);if(meta<0)meta=7;return s->h->texture(s->h->ctx,"wheat_stage_x",meta);}
U0 CropTile_tick(CropTile *s,I32 x,I32 y,I32 z,Random *rng) {MCTileHost020 *h=s->h;h->checkAlive(h->ctx,s,x,y,z);if(h->rawLight(h->ctx,x,y,z)>8){I32 meta=h->data(h->ctx,x,y,z);if(meta<=6){F32 speed=CropTile_getGrowthSpeed(s,x,y,z);I32 divisor=25.0/speed;if(Random_genrand_int32(rng)%divisor)h->setData(h->ctx,x,y,z,meta+1,2);}}}
I32 CropTile_getResource(CropTile *s,I32 meta,Random *rng) {if(meta==7)return s->h->wheat;return -1;}
I32 CropTile_getResourceCount(CropTile *s,Random *rng) {return 1;}
U0 CropTile_spawnResources(CropTile *s,I32 x,I32 y,I32 z,I32 meta,F32 chance) {MCTileHost020 *h=s->h;h->baseResources(h->ctx,s,x,y,z,meta,(chance)(F32));if(h->isClient)return;I32 i;for(i=0;i<3;i++)if((Random_genrand_int32(h->random)%15)(I32)<=meta){F32 a=Random_nextFloat(h->random),b=Random_nextFloat(h->random),c=Random_nextFloat(h->random);h->drop(h->ctx,h->seeds,1,0,(x+(a*0.7+0.15))(F32),(y+(b*0.7+0.15))(F32),(z+(c*0.7+0.15))(F32),(0)(F32),(0)(F32),(0)(F32),10);}}
Bool CropTile_mayPlaceOn(CropTile *s,I32 id) {return id==s->h->farmland;}
I32 CropTile_getBaseSeed(CropTile *s) {return s->h->seeds;}
I32 CropTile_getBasePlantId(CropTile *s) {return s->h->wheat;}
U0 CropTile_Destroy(CropTile *s) {MCString_Destroy(&s->name);}
