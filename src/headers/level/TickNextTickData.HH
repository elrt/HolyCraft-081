// Batch 003. Source: minecraftpe/headers/level/TickNextTickData.hpp
#ifndef MCPE_HEADERS_LEVEL_TICKNEXTTICKDATA_HPP
#define MCPE_HEADERS_LEVEL_TICKNEXTTICKDATA_HPP
class TickNextTickData { I32 id,x,y,z,field_10,delay; };
extern I32 TickNextTickData_C;
U0 TickNextTickData_Init(TickNextTickData *self,I32 x,I32 y,I32 z,I32 kind);
I32 TickNextTickData_hashCode(TickNextTickData *self);
Bool TickNextTickData_Equals(TickNextTickData *self,TickNextTickData *other);
Bool TickNextTickData_Less(TickNextTickData *self,TickNextTickData *other);
U0 TickNextTickData_setDelay(TickNextTickData *self,I32 delay);

#endif

