// Ported from minecraftpe/impl/tile/ChestTile.cpp; host-facing representation, not C++ ABI.

U0 ChestTile_Init(ChestTile *s,MCTileHost020 *h,I32 id) {s->h=h;s->blockID=id;Random_Init(&s->random);h->baseInit(h->ctx,s,id,1,NULL);h->shape(h->ctx,s,(0.025)(F32),(0)(F32),(0.025)(F32),(0.975)(F32),(0.95)(F32),(0.975)(F32));s->top=h->texture(h->ctx,"chest_inventory",0);s->side=h->texture(h->ctx,"chest_inventory",1);s->front=h->texture(h->ctx,"chest_inventory",2);}
Bool ChestTile_isCubeShaped(ChestTile *s) {return FALSE;}
I32 ChestTile_getRenderShape(ChestTile *s) {return 22;}
U0 * ChestTile_getTexture(ChestTile *s,I32 face) {if(face(U32)<=1)return s->top;if(face==3)return s->front;return s->side;}
U0 * ChestTile_getWorldTexture(ChestTile *s,I32 x,I32 y,I32 z,I32 face) {if(face(U32)<=1)return s->top;if(face==s->h->data(s->h->ctx,x,y,z))return s->front;return s->side;}
Bool ChestTile_isSolidRender(ChestTile *s) {return FALSE;}
U0 ChestTile_onRemove(ChestTile *s,I32 x,I32 y,I32 z) {MCTileHost020 *h=s->h;U0 *te=h->tileEntity(h->ctx,x,y,z);if(te && h->entityType(h->ctx,te)==2){h->unpair(h->ctx,te);if(!h->isClient){I32 n;for(n=0;n<h->containerSize(h->ctx,te);n++){MCItem020 *i=h->item(h->ctx,te,n);if(i){F32 xo=Random_nextFloat(&s->random)*0.8+0.1,yo=Random_nextFloat(&s->random)*0.8+0.1,zo=Random_nextFloat(&s->random)*0.8+0.1;while(i->count>0){I32 count=Random_nextInt(&s->random,21)+10;if(count>i->count)count=i->count;i->count-=count;F32 mx=Random_nextGaussian(&s->random)*0.05,my=Random_nextGaussian(&s->random)*0.05+0.2,mz=Random_nextGaussian(&s->random)*0.05;h->drop(h->ctx,i->id,count,i->aux,(x+xo)(F32),(y+yo)(F32),(z+zo)(F32),(mx)(F32),(my)(F32),(mz)(F32),0);}}}}}h->baseRemove(h->ctx,s,x,y,z);}
Bool ChestTile_use(ChestTile *s,I32 x,I32 y,I32 z,U0 *player) {MCTileHost020 *h=s->h;U0 *te=h->tileEntity(h->ctx,x,y,z);if(te && h->entityType(h->ctx,te)==2 && !h->isClient && h->canOpen(h->ctx,te))h->open(h->ctx,te,player);return TRUE;}
I32 ChestTile_getPlacementDataValue(ChestTile *s,F32 yaw,I32 meta) {F32 dir=(yaw*4)/360.0+0.5;I32 v=Mth_floor(dir)&3;if(v==0)return meta|2;if(v==1)return meta|5;if(v==2)return meta|3;return meta|4;}
U0 ChestTile_Destroy(ChestTile *s) {}
