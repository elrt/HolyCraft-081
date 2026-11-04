// Batch 009: minecraftpe/impl/util/_ChunkSorter.cpp includes the header only.
Bool _ChunkSorter_less(_ChunkSorter *s,IntPair *a,IntPair *b) { I32 x=s->pair.x,y=s->pair.y,ax=a->x-x,ay=a->y-y,bx=b->x-x,by=b->y-y;return ay*ay+ax*ax<by*by+bx*bx; }
