// Batch 003. Source: minecraftpe/impl/level/TickNextTickData.cpp
I32 TickNextTickData_C=0;
U0 TickNextTickData_Init(TickNextTickData *self,I32 x,I32 y,I32 z,I32 kind) { self->x=x;self->y=y;self->z=z;self->field_10=kind;TickNextTickData_C++;self->id=TickNextTickData_C;self->delay=0; }
I32 TickNextTickData_hashCode(TickNextTickData *self) { return self->field_10+((self->y+((self->z+(self->x<<10))<<7))<<8); }
Bool TickNextTickData_Equals(TickNextTickData *self,TickNextTickData *other) { if(self->x==other->x && self->y==other->y && self->z==other->z) { if(self->field_10==other->field_10) return FALSE; return TRUE; } return FALSE; }
Bool TickNextTickData_Less(TickNextTickData *self,TickNextTickData *other) { if(self->delay<other->delay) return TRUE; if(self->delay<=other->delay) return self->id<other->id; return FALSE; }
U0 TickNextTickData_setDelay(TickNextTickData *self,I32 delay) { self->delay=delay; }

