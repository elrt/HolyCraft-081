// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
U0 StairTile_setBaseShape(StairTile *s,I32 meta){if(meta&4)MC023_Shape(&s->shape,0,0.5,0,1,1,1);else MC023_Shape(&s->shape,0,0,0,1,0.5,1);}
U0 StairTile_updateShape(StairTile *s,Bool octant,I32 index){if(!octant){MC023_Shape(&s->shape,0,0,0,1,1,1);return;}F32 x=(index%2)*0.5,y=(index/2%2)*0.5,z=(index/4%2)*0.5;MC023_Shape(&s->shape,x,y,z,x+0.5,y+0.5,z+0.5);}
Bool StairTile_isDeadSpace(I32 meta,I32 octant){I32 spaces[16]={2,6,3,7,2,3,6,7,0,4,1,5,0,1,4,5};if(meta<0 || meta>7 || octant<0 || octant>7)return FALSE;return spaces[meta*2]==octant || spaces[meta*2+1]==octant;}
I32 StairTile_getPlacementDataValue(I32 face,F32 hitY,F32 yaw,I32 aux){I32 bits=aux(U8);if(face==0 || (face!=1 && hitY>0.5))bits|=4;I32 map[4]={2,1,3,0};return (bits&4)|map[floorf(yaw*4/360+0.5)(I32)&3];}
