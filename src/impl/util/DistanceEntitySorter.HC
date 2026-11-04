// Batch 009: minecraftpe/impl/util/DistanceEntitySorter.cpp includes the header only.
Bool DistanceEntitySorter_less(DistanceEntitySorter *s,MCPacketEntity009 *a,MCPacketEntity009 *b) { F32 ax=a->x-s->x,ay=a->y-s->y,az=a->z-s->z,bx=b->x-s->x,by=b->y-s->y,bz=b->z-s->z;F32 da=(ay*ay+ax*ax)+az*az,db=(by*by+bx*bx)+bz*bz;return da<db; }
