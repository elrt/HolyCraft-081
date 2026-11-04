// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
Bool Tile_Init(Tile *s,MCRegistry023 *r,I32 id,I32 material,Bool solid,Bool cube){if(id<1 || id>255)return FALSE;memset(s,0,sizeof(Tile));s->registry=r;s->id=id;MCString_Init(&s->description);MC023_Shape(&s->shape,0,0,0,1,1,1);MCTileDef023 *t=&r->tiles[id];memset(t,0,sizeof(MCTileDef023));t->material=material;t->registered=TRUE;t->solid=solid;t->cube=cube;t->slipperiness=0.6;t->soundVolume=t->soundPitch=1;t->stepSound="step.stone";t->breakSound="dig.stone";if(solid)t->opacity=255;return TRUE;}
U0 Tile_Destroy(Tile *s){MCString_Destroy(&s->description);}
U0 Tile_setLightBlock(Tile *s,I32 n){s->registry->tiles[s->id].opacity=n;}
U0 Tile_setLightEmission(Tile *s,F32 n){s->registry->tiles[s->id].emission=n*15;}
U0 Tile_setExplodeable(Tile *s,F32 n){s->resistance=n*3;s->registry->tiles[s->id].resistance=s->resistance;}
U0 Tile_setDestroyTime(Tile *s,F32 n){s->hardness=n;if(s->resistance<n*5)s->resistance=n*5;s->registry->tiles[s->id].resistance=s->resistance;}
F32 Tile_getDestroyProgress(Tile *s,Bool canDestroy,F32 speed){if(s->hardness<0)return 0;if(canDestroy)return (speed/s->hardness)/30;return (1.0/s->hardness)/100;}
U0 Tile_setShape(Tile *s,F32 x,F32 y,F32 z,F32 xx,F32 yy,F32 zz){MC023_Shape(&s->shape,x,y,z,xx,yy,zz);}
U0 Tile_getAABB(Tile *s,I32 x,I32 y,I32 z,AABB *out){AABB_Init(out,x+s->shape.x1,y+s->shape.y1,z+s->shape.z1,x+s->shape.x2,y+s->shape.y2,z+s->shape.z2);}
Bool Tile_shouldRenderFace(Tile *s,MCWorld023 *w,I32 x,I32 y,I32 z,I32 face){if(face==0 && s->shape.y1>0)return TRUE;if(face==1 && s->shape.y2<1)return TRUE;return !MC023_Solid(w,x,y,z);}

U0 Tile_bindMaterial(Tile *s,Material *material){s->material=material;}
U0 Tile_spawnResources(Tile *s,Level *level,I32 x,I32 y,I32 z,I32 metadata,F32 chance){if(level->world.isClient)return;Random *rng=&level->world.random;if(Random_nextFloat(rng)>chance)return;F32 xx=x+Random_nextFloat(rng)*0.7+0.15,yy=y+Random_nextFloat(rng)*0.7+0.15,zz=z+Random_nextFloat(rng)*0.7+0.15;ItemInstance item;ItemInstance_Init(&item,level->registry,s->id,1,0);if(!item.isValid)return;ItemEntity *drop=MC_Alloc(sizeof(ItemEntity));ItemEntity_Init(drop,&level->world,xx,yy,zz,&item,Random_genrand_int32(rng));drop->minYBound=yy;drop->pickupDelay=10;MCPtrVector_Push(&level->drops,drop);Level_addEntity(level,drop);}
