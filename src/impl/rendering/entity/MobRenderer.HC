// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
U0 MobRenderer_Init(MobRenderer *s,MCG020 *g,U0 *model){s->graphics=g;s->model=model;s->armorModel=NULL;}
F32 MobRenderer_lerpRotation(F32 previous,F32 current,F32 partial){F32 d=current-previous;while(d<-180)d+=360;while(d>=180)d-=360;return previous+partial*d;}
U0 MobRenderer_setupPosition(MobRenderer *s,F32 x,F32 y,F32 z){MCG020_C(s->graphics,3,x,y,z,0,0);}
U0 MobRenderer_setupRotations(MobRenderer *s,F32 bodyYaw,I32 deathTime,F32 partial,F32 flip){MCG020_C(s->graphics,5,180-bodyYaw,0,1,0,0);if(deathTime>0){F32 v=sqrtf(((deathTime+partial-1)/20)*1.6);if(v>1)v=1;MCG020_C(s->graphics,5,v*flip,0,0,1,0);}}
F32 MobRenderer_getBob(I32 ticks,F32 partial){return ticks+partial;}
U0 MobRenderer_setArmor(MobRenderer *s,U0 *model){s->armorModel=model;}
