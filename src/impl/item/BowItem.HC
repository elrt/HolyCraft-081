// Inline implementation from BowItem.hpp; BowItem.cpp contains only #include.
U0 BowItem_Init(BowItem *s,MCItemContext010 *c,I32 id) { I32 i;MCItem009_Init(&s->base,c->items,id);TextureUVCoordinateSet_DefaultInit(&s->icon);s->base.maxStackSize=1;s->base.maxDamage=384;s->frames=3;for(i=0;i<3;i++)s->textures[i]=*c->place->itemTexture(c->place->host,"bow_pulling",i); }
I32 BowItem_getMaxUseDuration(BowItem *s) { return 72000; }
I32 BowItem_getUseAnimation(BowItem *s) { return 4; }
F32 BowItem_getLaunchPower(BowItem *s,I32 a) { F32 f=(BowItem_getMaxUseDuration(s)-a)/20.0,p=(f+f+f*f)/3.0;if(p<=1.0)return p;return 1.0; }
TextureUVCoordinateSet *BowItem_getIcon(BowItem *s,I32 frame,Bool unused) { if(frame) { if(frame<1 || frame>3) { printf("BowItem invalid frame\n");exit(98); }return &s->textures[frame-1]; }return &s->icon; }
MCPacketItem009 *BowItem_use(BowItem *s,MCItemContext010 *c,MCPacketItem009 *it) { if(c->items->instabuild || c->hasResource(c->host,c->arrowID))c->items->startUsing(c->items->host,it,BowItem_getMaxUseDuration(s));return it; }
U0 BowItem_releaseUsing(BowItem *s,MCItemContext010 *c,MCPacketItem009 *it,I32 dur) { F32 power=BowItem_getLaunchPower(s,dur),f,pitch;if(power>=0.1) { if(!c->items->instabuild) { c->items->hurtAndBreak(c->items->host,it,1);if(!it->count)c->clearSelected(c->host);c->removeResource(c->host,c->arrowID); }f=Random_nextFloat(c->items->itemRandom);pitch=1.0/(f*0.4+1.2)+power*0.5;c->items->playSound(c->items->host,"random.bow",1.0,pitch);if(!c->items->isClient)c->spawnArrow(c->host,power+power,power==1.0); } }
I32 BowItem_getAnimationFrameFor(BowItem *s,I32 duration) { if(duration)return BowItem_getLaunchPower(s,duration)*0.99*s->frames+1;return 0; }
