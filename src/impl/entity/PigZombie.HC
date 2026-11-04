// Batch023: entity/PigZombie; explicit simulation ABI, see docs/BATCH023.md.
U0 PigZombie_Init(PigZombie *s,MCWorld023 *w) {memset(s,0,sizeof(PigZombie));MC023_BodyInit(s,w,36,0.6,1.8);s->health=20;s->isMob=TRUE;s->targetDelay=60;}
I32 PigZombie_alert(PigZombie *s,MCBody023 *attacker) {s->attackTarget=attacker->id;s->anger=400*(Random_genrand_int32(&s->rng)%400);U32 n=Random_genrand_int32(&s->rng);s->soundDelay=n%40;return n/40;}
U0 PigZombie_tick(PigZombie *s) {if(s->targetDelay>0)s->targetDelay--;if(s->soundDelay>0 && --s->soundDelay==0)MC023_Sound(s->w,"mob.zombiepig.zpigangry",s->x,s->y,s->z,2.0,((Random_nextFloat(&s->rng)-Random_nextFloat(&s->rng))*0.2+1.0)*1.8);MC023_BaseTick(s);}
Bool PigZombie_hurt(PigZombie *s,MCBody023 *from,I32 damage) {if(from && from->isPlayer){MCPtrVector v;MC023_Entities(s->w,s,s->x-12,s->y-12,s->z-12,s->x+12,s->y+12,s->z+12,&v);I32 i;for(i=0;i<v.size;i++){MCBody023 *b=v.data[i];if(b && b->type==36)PigZombie_alert(b(PigZombie*),from);}MCPtrVector_Destroy(&v);PigZombie_alert(s,from);}return MC023_Hurt(s,from,damage);/* Arrow owner resolution requires host damage routing. */}
U0 PigZombie_save(PigZombie *s,CompoundTag *t) {MC023_NBTPut(t,"Anger",s->anger,FALSE);}
U0 PigZombie_load(PigZombie *s,CompoundTag *t) {s->anger=MC023_NBTGet(t,"Anger",FALSE);}
