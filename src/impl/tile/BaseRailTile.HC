// Batch024 partial API; explicit backend contracts: docs/BATCH024.md
U0 BaseRailTile_Init(BaseRailTile *s,MCWorld024 *world,I32 x,I32 y,I32 z,Bool bit){memset(s,0,sizeof(BaseRailTile));s->world=world;s->x=x;s->y=y;s->z=z;s->useDataBit=bit;MC023_Shape(&s->shape,0,0,0,1,0.125,1);}
U0 BaseRailTile_updateConnections(BaseRailTile *s,I32 data){I32 dx[20]={0,0,-1,1,-1,1,-1,1,0,0,0,0,1,0,-1,0,-1,0,1,0};I32 dz[20]={-1,1,0,0,0,0,0,0,-1,1,-1,1,0,1,0,1,0,-1,0,-1};s->connectionCount=0;if(data<0 || data>9)return;I32 i;for(i=0;i<2;i++){MCRailPos024 *p=&s->connections[i];p->x=s->x+dx[data*2+i];p->y=s->y;p->z=s->z+dz[data*2+i];if((data==2 && i==1) || (data==3 && i==0) || (data==4 && i==0) || (data==5 && i==1))p->y++;}s->connectionCount=2;}
Bool BaseRailTile_hasConnection(BaseRailTile *s,I32 x,I32 z){I32 i;for(i=0;i<s->connectionCount;i++)if(s->connections[i].x==x && s->connections[i].z==z)return TRUE;return FALSE;}
Bool BaseRailTile_hasRail(BaseRailTile *s,I32 x,I32 y,I32 z){I32 a,id;for(a=-1;a<=1;a++){id=MC023_Tile(s->world->w,x,y+a,z);if(MC024_ValidId(id) && s->world->rails[id])return TRUE;}return FALSE;}
I32 BaseRailTile_countPotentialConnections(BaseRailTile *s){return BaseRailTile_hasRail(s,s->x,s->y,s->z-1)+BaseRailTile_hasRail(s,s->x,s->y,s->z+1)+BaseRailTile_hasRail(s,s->x-1,s->y,s->z)+BaseRailTile_hasRail(s,s->x+1,s->y,s->z);}
U0 BaseRailTile_updateShape(BaseRailTile *s,I32 meta){F32 h=0.125;if((meta-2)(U32)<=3)h=0.625;MC023_Shape(&s->shape,0,0,0,1,h,1);}
Bool BaseRailTile_mayPlace(BaseRailTile *s){return MC023_Solid(s->world->w,s->x,s->y-1,s->z);}
