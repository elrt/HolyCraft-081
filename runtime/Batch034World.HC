// Batch034 world features: FenceTile / WallTile / ThinFenceTile connections (shapes + tesselate*InWorld),
// BaseRailTile + RailLogic (placement / connection rules) + tesselateRailInWorld, SignTile / SignItem /
// SignTileEntity + SignRenderer + TextEditScreen, Minecart (moveAlongTrack / comeOffTrack / push / hurt / riding)
// + MinecartRenderer / MinecartModel, chat commands (/summon, /time), world034.dat persistence and test scenes.
// ---- connections ----
Bool MC34_Cube(MCApp028 *s,I32 t){if(t<=0)return FALSE;MCTileDef023 *d=&s->catalog.registry.tiles[t];return d->solid && d->cube && d->opacity>0;}
Bool MC34_FenceConn(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return FALSE;I32 t=Level_getTile(&s->level,x,y,z);if(t==85 || t==107)return TRUE;if(t==18)return FALSE;return MC34_Cube(s,t);}
Bool MC34_WallConn(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return FALSE;I32 t=Level_getTile(&s->level,x,y,z);if(t==139 || t==107)return TRUE;if(t==18)return FALSE;return MC34_Cube(s,t);}
Bool MC34_PaneConn(MCApp028 *s,I32 self,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return FALSE;I32 t=Level_getTile(&s->level,x,y,z);if(t==self || t==20)return TRUE;return MC34_Cube(s,t);}
U0 MC34_FenceBox(MCApp028 *s,I32 x,I32 y,I32 z,F32 h,F32 *b){F32 x0=0.375,x1=0.625,z0=0.375,z1=0.625;if(MC34_FenceConn(s,x-1,y,z))x0=0;if(MC34_FenceConn(s,x+1,y,z))x1=1;if(MC34_FenceConn(s,x,y,z-1))z0=0;if(MC34_FenceConn(s,x,y,z+1))z1=1;MC32_Set6(b,x0,0,z0,x1,h,z1);}
U0 MC34_WallBox(MCApp028 *s,I32 x,I32 y,I32 z,F32 *b){Bool zn=MC34_WallConn(s,x,y,z-1),zp=MC34_WallConn(s,x,y,z+1),xn=MC34_WallConn(s,x-1,y,z),xp=MC34_WallConn(s,x+1,y,z);F32 x0=0.25,x1=0.75,z0=0.25,z1=0.75,h=1;
 if(zn)z0=0;if(zp)z1=1;if(xn)x0=0;if(xp)x1=1;
 if(zn && zp && !xn && !xp){h=0.8125;x0=0.3125;x1=0.6875;}else if(!zn && !zp && xn && xp){h=0.8125;z0=0.3125;z1=0.6875;}MC32_Set6(b,x0,0,z0,x1,h,z1);}
U0 MC34_PaneBox(MCApp028 *s,I32 id,I32 x,I32 y,I32 z,F32 *b){Bool n=MC34_PaneConn(s,id,x,y,z-1),so=MC34_PaneConn(s,id,x,y,z+1),w=MC34_PaneConn(s,id,x-1,y,z),e=MC34_PaneConn(s,id,x+1,y,z);F32 x0=0.4375,x1=0.5625,z0=0.4375,z1=0.5625;Bool none=!n && !so && !w && !e;
 if((w && e) || none){x0=0;x1=1;}else if(w && !e)x0=0;else if(!w && e)x1=1;
 if((n && so) || none){z0=0;z1=1;}else if(n && !so)z0=0;else if(!n && so)z1=1;MC32_Set6(b,x0,0,z0,x1,1,z1);}
// ---- rails: BaseRailTile::Rail (RailLogic) ----
Bool MC34_IsRail(I32 id){return id==66 || id==27;}
Bool MC34_RailAt(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return FALSE;return MC34_IsRail(Level_getTile(&s->level,x,y,z));}
I32 MC34_RailData(MCApp028 *s,I32 x,I32 y,I32 z){I32 d=Level_getData(&s->level,x,y,z);if(Level_getTile(&s->level,x,y,z)==27)d&=7;if(d<0 || d>9)d=0;return d;}
I32 g34_exit[60]={0,0,-1, 0,0,1, -1,0,0, 1,0,0, -1,-1,0, 1,0,0, -1,0,0, 1,-1,0, 0,0,-1, 0,-1,1, 0,-1,-1, 0,0,1, 0,0,1, 1,0,0, 0,0,1, -1,0,0, 0,0,-1, -1,0,0, 0,0,-1, 1,0,0};
I32 g34_conn[60]={0,0,-1, 0,0,1, -1,0,0, 1,0,0, -1,0,0, 1,1,0, -1,1,0, 1,0,0, 0,1,-1, 0,0,1, 0,0,-1, 0,1,1, 1,0,0, 0,0,1, -1,0,0, 0,0,1, -1,0,0, 0,0,-1, 1,0,0, 0,0,-1};
class MC34Rail {I32 x,y,z,n,cx[2],cy[2],cz[2];Bool bit;};
U0 MC34_RailConns(MC34Rail *r,I32 d){I32 i;r->n=2;for(i=0;i<2;i++){r->cx[i]=r->x+g34_conn[d*6+i*3];r->cy[i]=r->y+g34_conn[d*6+i*3+1];r->cz[i]=r->z+g34_conn[d*6+i*3+2];}}
Bool MC34_RailLoad(MCApp028 *s,MC34Rail *r,I32 x,I32 y,I32 z){if(!MC34_RailAt(s,x,y,z))return FALSE;r->x=x;r->y=y;r->z=z;r->bit=Level_getTile(&s->level,x,y,z)==27;MC34_RailConns(r,MC34_RailData(s,x,y,z));return TRUE;}
Bool MC34_RailGet(MCApp028 *s,MC34Rail *r,I32 x,I32 y,I32 z){if(MC34_RailLoad(s,r,x,y,z))return TRUE;if(MC34_RailLoad(s,r,x,y+1,z))return TRUE;return MC34_RailLoad(s,r,x,y-1,z);}
Bool MC34_RailHas(MC34Rail *r,I32 x,I32 z){I32 i;for(i=0;i<r->n;i++)if(r->cx[i]==x && r->cz[i]==z)return TRUE;return FALSE;}
U0 MC34_RailSoft(MCApp028 *s,MC34Rail *r){I32 i=0;MC34Rail o;while(i<r->n){Bool keep=FALSE;if(MC34_RailGet(s,&o,r->cx[i],r->cy[i],r->cz[i])){if(MC34_RailHas(&o,r->x,r->z)){keep=TRUE;r->cx[i]=o.x;r->cy[i]=o.y;r->cz[i]=o.z;}}
  if(keep)i++;else{if(i==0 && r->n==2){r->cx[0]=r->cx[1];r->cy[0]=r->cy[1];r->cz[0]=r->cz[1];}r->n--;}}}
Bool MC34_RailCan(MC34Rail *r,MC34Rail *o){if(MC34_RailHas(r,o->x,o->z))return TRUE;if(r->n==2)return FALSE;return TRUE;}
Bool MC34_RailNear(MCApp028 *s,MC34Rail *r,I32 x,I32 y,I32 z){MC34Rail o;if(!MC34_RailGet(s,&o,x,y,z))return FALSE;MC34_RailSoft(s,&o);return MC34_RailCan(&o,r);}
I32 MC34_RailSlope(MCApp028 *s,MC34Rail *r,I32 d){I32 x=r->x,y=r->y,z=r->z;if(d==0){if(MC34_RailAt(s,x,y+1,z-1))d=4;if(MC34_RailAt(s,x,y+1,z+1))d=5;}if(d==1){if(MC34_RailAt(s,x+1,y+1,z))d=2;if(MC34_RailAt(s,x-1,y+1,z))d=3;}if(d<0)d=0;return d;}
U0 MC34_RailWrite(MCApp028 *s,MC34Rail *r,I32 d){Level *l=&s->level;I32 id=Level_getTile(l,r->x,r->y,r->z),v=d;if(id==27)v=(Level_getData(l,r->x,r->y,r->z)&8)|d;if(Level_getData(l,r->x,r->y,r->z)!=v){Level_setTileAndData(l,r->x,r->y,r->z,id,v,3);MC028_Dirty(s,r->x,r->y,r->z);}}
U0 MC34_RailConnect(MCApp028 *s,MC34Rail *r,MC34Rail *o){if(r->n<2){r->cx[r->n]=o->x;r->cy[r->n]=o->y;r->cz[r->n]=o->z;r->n++;}I32 x=r->x,z=r->z;
 Bool n=MC34_RailHas(r,x,z-1),so=MC34_RailHas(r,x,z+1),w=MC34_RailHas(r,x-1,z),e=MC34_RailHas(r,x+1,z);I32 d=-1;if(n || so)d=0;if(w || e)d=1;
 if(!r->bit){if(so && e && !n && !w)d=6;if(so && w && !n && !e)d=7;if(n && w && !so && !e)d=8;if(n && e && !so && !w)d=9;}
 MC34_RailWrite(s,r,MC34_RailSlope(s,r,d));}
U0 MC34_RailPlace(MCApp028 *s,I32 x,I32 y,I32 z,Bool first){MC34Rail r;if(!MC34_RailLoad(s,&r,x,y,z))return;
 Bool n=MC34_RailNear(s,&r,x,y,z-1),so=MC34_RailNear(s,&r,x,y,z+1),w=MC34_RailNear(s,&r,x-1,y,z),e=MC34_RailNear(s,&r,x+1,y,z);I32 d=-1;
 if((n || so) && !w && !e)d=0;if((w || e) && !n && !so)d=1;
 if(!r.bit){if(so && e && !n && !w)d=6;if(so && w && !n && !e)d=7;if(n && w && !so && !e)d=8;if(n && e && !so && !w)d=9;}
 if(d==-1){if(n || so)d=0;if(w || e)d=1;if(!r.bit){if(first){if(so && e)d=6;if(w && so)d=7;if(e && n)d=9;if(n && w)d=8;}else{if(n && w)d=8;if(e && n)d=9;if(w && so)d=7;if(so && e)d=6;}}}
 d=MC34_RailSlope(s,&r,d);MC34_RailConns(&r,d);Level *l=&s->level;I32 id=Level_getTile(l,x,y,z),v=d;if(id==27)v=(Level_getData(l,x,y,z)&8)|d;Level_setTileAndData(l,x,y,z,id,v,3);MC028_Dirty(s,x,y,z);
 I32 i;for(i=0;i<r.n;i++){MC34Rail o;if(MC34_RailGet(s,&o,r.cx[i],r.cy[i],r.cz[i])){MC34_RailSoft(s,&o);if(MC34_RailCan(&o,&r))MC34_RailConnect(s,&o,&r);}}}
// ---- shapes: 0 = not ours, 1 = box, 2 = no collision box ----
I32 MC034_Shape(MCApp028 *s,I32 id,I32 x,I32 y,I32 z,Bool collision,F32 *b){
 if(id==85){F32 h=1;if(collision)h=1.5;MC34_FenceBox(s,x,y,z,h,b);return 1;}
 if(id==139){MC34_WallBox(s,x,y,z,b);if(collision)b[4]=1.5;return 1;}
 if(id==101 || id==102){MC34_PaneBox(s,id,x,y,z,b);return 1;}
 if(id==63){if(collision)return 2;MC32_Set6(b,0.25,0,0.25,0.75,1,0.75);return 1;}
 if(id==68){if(collision)return 2;I32 d=Level_getData(&s->level,x,y,z);F32 h0=0.28125,h1=0.78125;MC32_Set6(b,0,h0,0.875,1,h1,1);if(d==3)MC32_Set6(b,0,h0,0,1,h1,0.125);if(d==4)MC32_Set6(b,0.875,h0,0,1,h1,1);if(d==5)MC32_Set6(b,0,h0,0,0.125,h1,1);return 1;}
 if(id==66 || id==27){if(collision)return 2;I32 d=MC34_RailData(s,x,y,z);F32 h=0.125;if(d>=2 && d<=5)h=0.625;MC32_Set6(b,0,0,0,1,h,1);return 1;}
 return 0;}
// ---- tesselation ----
U0 MC34_RailTess(MCApp028 *s,I32 id,I32 data,I32 x,I32 y,I32 z){I32 d=data,tex=82;if(id==27){d=data&7;tex=84;if(data&8)tex=85;}else if(d>=6)tex=83;if(d>9)d=0;
 TextureUVCoordinateSet uv;MC028_UV(&uv,tex,0);F32 u0=uv.minX,u1=uv.maxX,v0=uv.minY,v1=uv.maxY,r=0.0625;
 F32 x0=x+1,x1=x+1,x2=x,x3=x,z0=z,z1=z+1,z2=z+1,z3=z,y0=y+r,y1=y+r,y2=y+r,y3=y+r;
 if(d==1 || d==2 || d==3 || d==7){x0=x+1;x3=x+1;x1=x;x2=x;z0=z+1;z1=z+1;z2=z;z3=z;}
 else if(d==8){x0=x;x1=x;x2=x+1;x3=x+1;z0=z+1;z3=z+1;z1=z;z2=z;}
 else if(d==9){x0=x;x3=x;x1=x+1;x2=x+1;z0=z;z1=z;z2=z+1;z3=z+1;}
 if(d==2 || d==4){y0+=1;y3+=1;}else if(d==3 || d==5){y1+=1;y2+=1;}
 F32 l=MC028_Brightness(s,x,y,z);MC027_Color(&s->tiler,l,l,l);TileRenderer *t=&s->tiler;
 MC027_Vertex(t,x0,y0,z0,u1,v0);MC027_Vertex(t,x1,y1,z1,u1,v1);MC027_Vertex(t,x2,y2,z2,u0,v1);MC027_Vertex(t,x3,y3,z3,u0,v0);
 MC027_Vertex(t,x3,y3,z3,u0,v0);MC027_Vertex(t,x2,y2,z2,u0,v1);MC027_Vertex(t,x1,y1,z1,u1,v1);MC027_Vertex(t,x0,y0,z0,u1,v0);}
Bool MC034_Tess(MCApp028 *s,MCRenderTile027 *v,I32 id,I32 meta,I32 x,I32 y,I32 z){
 if(id==63 || id==68)return TRUE;
 if(id==66 || id==27){MC34_RailTess(s,id,meta,x,y,z);return TRUE;}
 if(id!=85 && id!=139 && id!=101 && id!=102)return FALSE;
 F32 save[6],b[6];I32 i;save[0]=v->minX;save[1]=v->minY;save[2]=v->minZ;save[3]=v->maxX;save[4]=v->maxY;save[5]=v->maxZ;
 if(id==85){for(i=0;i<6;i++)MC028_UV(&v->uv[i],12,0);MC32_BoxFaces(s,v,x,y,z,0.375,0,0.375,0.625,1,0.625);
  Bool w=MC34_FenceConn(s,x-1,y,z),e=MC34_FenceConn(s,x+1,y,z),n=MC34_FenceConn(s,x,y,z-1),so=MC34_FenceConn(s,x,y,z+1);F32 a=0.4375,c=0.5625,x0=a,x1=c,z0=a,z1=c;if(w)x0=0;if(e)x1=1;if(n)z0=0;if(so)z1=1;
  if(w || e){MC32_BoxFaces(s,v,x,y,z,x0,0.75,a,x1,0.9375,c);MC32_BoxFaces(s,v,x,y,z,x0,0.375,a,x1,0.5625,c);}
  if(n || so){MC32_BoxFaces(s,v,x,y,z,a,0.75,z0,c,0.9375,z1);MC32_BoxFaces(s,v,x,y,z,a,0.375,z0,c,0.5625,z1);}}
 else if(id==139){I32 tex=2;if(meta==1)tex=3;for(i=0;i<6;i++)MC028_UV(&v->uv[i],tex,0);
  Bool zl=MC34_WallConn(s,x,y,z-1),zr=MC34_WallConn(s,x,y,z+1),xl=MC34_WallConn(s,x-1,y,z),xr=MC34_WallConn(s,x+1,y,z),up=Level_getTile(&s->level,x,y+1,z)!=0;F32 h=0.8125;if(up)h=1;
  if(zl && zr && !xl && !xr)MC32_BoxFaces(s,v,x,y,z,0.3125,0,0,0.6875,h,1);
  else if(xl && xr && !zl && !zr)MC32_BoxFaces(s,v,x,y,z,0,0,0.3125,1,h,0.6875);
  else{MC32_BoxFaces(s,v,x,y,z,0.25,0,0.25,0.75,1,0.75);if(xl)MC32_BoxFaces(s,v,x,y,z,0,0,0.3125,0.25,0.8125,0.6875);if(xr)MC32_BoxFaces(s,v,x,y,z,0.75,0,0.3125,1,0.8125,0.6875);if(zl)MC32_BoxFaces(s,v,x,y,z,0.3125,0,0,0.6875,0.8125,0.25);if(zr)MC32_BoxFaces(s,v,x,y,z,0.3125,0,0.75,0.6875,0.8125,1);}}
 else{Bool n=MC34_PaneConn(s,id,x,y,z-1),so=MC34_PaneConn(s,id,x,y,z+1),w=MC34_PaneConn(s,id,x-1,y,z),e=MC34_PaneConn(s,id,x+1,y,z),none=!n && !so && !w && !e;F32 a=0.4375,c=0.5625;
  if((w && e) || none)MC32_BoxFaces(s,v,x,y,z,0,0,a,1,1,c);else if(w)MC32_BoxFaces(s,v,x,y,z,0,0,a,0.5,1,c);else if(e)MC32_BoxFaces(s,v,x,y,z,0.5,0,a,1,1,c);
  if((n && so) || none)MC32_BoxFaces(s,v,x,y,z,a,0,0,c,1,1);else if(n)MC32_BoxFaces(s,v,x,y,z,a,0,0,c,1,0.5);else if(so)MC32_BoxFaces(s,v,x,y,z,a,0,0.5,c,1,1);
  if(!(none || (w && e) || (n && so)) && !((w || e) && (n || so)))MC32_BoxFaces(s,v,x,y,z,a,0,a,c,1,c);}
 MC32_Bounds(v,save);return TRUE;}
// ---- signs (SignTileEntity: 4 lines of max 15 characters) ----
MC34Sign *MC34_SignFind(I32 x,I32 y,I32 z){I32 i;for(i=0;i<g34_signN;i++){MC34Sign *g=g34_sign[i];if(g->x==x && g->y==y && g->z==z)return g;}return NULL;}
MC34Sign *MC34_SignAdd(I32 x,I32 y,I32 z){MC34Sign *g=MC34_SignFind(x,y,z);if(g){memset(g->text,0,64);return g;}if(g34_signN>=MC34_MAXSIGN)return NULL;g=MC_Alloc(sizeof(MC34Sign));memset(g,0,sizeof(MC34Sign));g->x=x;g->y=y;g->z=z;g34_sign[g34_signN++]=g;return g;}
U0 MC34_SignRemove(I32 x,I32 y,I32 z){I32 i,j;for(i=0;i<g34_signN;i++){MC34Sign *g=g34_sign[i];if(g->x==x && g->y==y && g->z==z){if(g34_edit==g)g34_edit=NULL;free(g);for(j=i;j+1<g34_signN;j++)g34_sign[j]=g34_sign[j+1];g34_signN--;return;}}}
U0 MC34_SignSet(MC34Sign *g,I32 line,U8 *t){I32 i;U8 *d=g->text+line*16;memset(d,0,16);for(i=0;i<15 && t[i];i++)d[i]=t[i];}
// ---- destroy hooks: rails / signs lose their support ----
U0 MC34_Pop(MCApp028 *s,I32 x,I32 y,I32 z){if(!Level_InBounds(x,y,z))return;I32 id=Level_getTile(&s->level,x,y,z),m=Level_getData(&s->level,x,y,z);if(id==63 || id==68)MC34_SignRemove(x,y,z);MC32_Pop(s,x,y,z,id,m);MC028_Dirty(s,x,y,z);printf("POP034 id=%d at=%d,%d,%d\n",id,x,y,z);}
Bool MC34_Is(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 data){if(!Level_InBounds(x,y,z))return FALSE;if(Level_getTile(&s->level,x,y,z)!=id)return FALSE;return data<0 || Level_getData(&s->level,x,y,z)==data;}
U0 MC034_WillDestroy(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta){g34_app=s;if(id==63 || id==68){MC34_SignRemove(x,y,z);return;}if(MC34_IsRail(id))return;
 if(MC34_Is(s,x,y+1,z,63,-1))MC34_Pop(s,x,y+1,z);
 if(MC34_RailAt(s,x,y+1,z))MC34_Pop(s,x,y+1,z);
 if(MC34_Is(s,x,y,z-1,68,2))MC34_Pop(s,x,y,z-1);if(MC34_Is(s,x,y,z+1,68,3))MC34_Pop(s,x,y,z+1);if(MC34_Is(s,x-1,y,z,68,4))MC34_Pop(s,x-1,y,z);if(MC34_Is(s,x+1,y,z,68,5))MC34_Pop(s,x+1,y,z);
 if(MC34_RailAt(s,x-1,y,z) && MC34_RailData(s,x-1,y,z)==2)MC34_Pop(s,x-1,y,z);if(MC34_RailAt(s,x+1,y,z) && MC34_RailData(s,x+1,y,z)==3)MC34_Pop(s,x+1,y,z);
 if(MC34_RailAt(s,x,y,z+1) && MC34_RailData(s,x,y,z+1)==4)MC34_Pop(s,x,y,z+1);if(MC34_RailAt(s,x,y,z-1) && MC34_RailData(s,x,y,z-1)==5)MC34_Pop(s,x,y,z-1);}
Bool MC034_Drops(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta){Level *l=&s->level;
 if(id==63 || id==68){MC027_DropAt(l,x,y,z,323,1,0);return TRUE;}
 if(id==66 || id==27){MC027_DropAt(l,x,y,z,id,1,0);return TRUE;}
 return FALSE;}
// ---- Minecart ----
I32 g34_cartMade,g34_cartBroken,g34_rides;U32 g34_cartTex,g34_signTex;Bool g34_texTried;MCTex029 g34_signGui;
U0 MC34_Tex(){if(g34_texTried)return;g34_texTried=TRUE;g34_cartTex=MC028_Texture("assets/034/entity/minecart.png",NULL,NULL);g34_signTex=MC028_Texture("assets/034/item/sign.png",NULL,NULL);MC029_LoadTex(&g34_signGui,"assets/034/item/sign.png",FALSE,FALSE,FALSE);}
MC34Cart *MC34_AddCart(MCApp028 *s,F32 x,F32 y,F32 z){if(g34_cartN>=MC34_MAXCART)return NULL;MC34Cart *c=&g34_cart[g34_cartN++];memset(c,0,sizeof(MC34Cart));c->x=x;c->y=y;c->z=z;c->px=x;c->py=y;c->pz=z;c->hurtDir=1;c->id=++g34_cartIds;g34_cartMade++;s->unsaved=TRUE;return c;}
// Minecart::getPos: point on the rail centre line (posY convention: box minY + 0.35)
Bool MC34_GetPos(MCApp028 *s,F32 x,F32 y,F32 z,F32 *ox,F32 *oy,F32 *oz){I32 bx=floorf(x),by=floorf(y),bz=floorf(z);if(MC34_RailAt(s,bx,by-1,bz))by--;if(!MC34_RailAt(s,bx,by,bz))return FALSE;I32 d=MC34_RailData(s,bx,by,bz);I32 *e=g34_exit+d*6;
 F32 x0=bx+0.5+e[0]*0.5,y0=by+0.5+e[1]*0.5,z0=bz+0.5+e[2]*0.5,dx=bx+0.5+e[3]*0.5-x0,dy=(by+0.5+e[4]*0.5-y0)*2,dz=bz+0.5+e[5]*0.5-z0,t;
 if(dx==0)t=z-bz;else if(dz==0)t=x-bx;else{t=(z-z0)*dz+(x-x0)*dx;t=t+t;}
 F32 ry=y0+dy*t;*ox=x0+dx*t;*oz=z0+dz*t;if(dy<0)ry+=1;if(dy>0)ry+=0.5;*oy=ry;return TRUE;}
Bool MC34_GetPosOffs(MCApp028 *s,F32 x,F32 y,F32 z,F32 off,F32 *ox,F32 *oy,F32 *oz){I32 bx=floorf(x),by=floorf(y),bz=floorf(z);if(MC34_RailAt(s,bx,by-1,bz))by--;if(!MC34_RailAt(s,bx,by,bz))return FALSE;I32 d=MC34_RailData(s,bx,by,bz);I32 *e=g34_exit+d*6;
 F32 yy=by;if(d>=2 && d<=5)yy=by+1;F32 ddx=e[3]-e[0],ddz=e[5]-e[2],l=sqrt(ddx*ddx+ddz*ddz),nx=x+ddx/l*off,nz=z+ddz/l*off;
 if(e[1] && floorf(nx)-bx==e[0] && floorf(nz)-bz==e[2])yy+=e[1];else if(e[4] && floorf(nx)-bx==e[3] && floorf(nz)-bz==e[5])yy+=e[4];
 return MC34_GetPos(s,nx,yy,nz,ox,oy,oz);}
U0 MC34_CartMove(MCApp028 *s,MC34Cart *c,F32 dx,F32 dy,F32 dz){AABB box;AABB_Init(&box,c->x-0.49,c->y-0.35,c->z-0.49,c->x+0.49,c->y+0.35,c->z+0.49);F32 ox=dx,oy=dy,oz=dz;Level_clipMove(&s->level,&box,&dx,&dy,&dz);
 c->onGround=oy!=dy && oy<0;c->hcol=ox!=dx || oz!=dz;if(ox!=dx)c->mx=0;if(oy!=dy)c->my=0;if(oz!=dz)c->mz=0;c->x=(box.minX+box.maxX)*0.5;c->y=box.minY+0.35;c->z=(box.minZ+box.maxZ)*0.5;}
Bool MC34_Ridden(MC34Cart *c){return g34_ride>=0 && &g34_cart[g34_ride]==c;}
U0 MC34_OffTrack(MCApp028 *s,MC34Cart *c,F32 m){if(c->mx<-m)c->mx=-m;if(c->mx>m)c->mx=m;if(c->mz<-m)c->mz=-m;if(c->mz>m)c->mz=m;if(c->onGround){c->mx*=0.5;c->my*=0.5;c->mz*=0.5;}
 MC34_CartMove(s,c,c->mx,c->my,c->mz);if(!c->onGround){c->mx*=0.95;c->my*=0.95;c->mz*=0.95;}}
U0 MC34_Track(MCApp028 *s,MC34Cart *c,I32 x,I32 y,I32 z,F32 maxSpeed,F32 boost,I32 id,I32 data){F32 p1x,p1y,p1z;Bool had=MC34_GetPos(s,c->x,c->y,c->z,&p1x,&p1y,&p1z);c->y=y;I32 d=data;if(id==27)d&=7;if(d>9)d=0;
 if(d>=2 && d<=5)c->y=y+1;if(d==2)c->mx-=boost;if(d==3)c->mx+=boost;if(d==4)c->mz+=boost;if(d==5)c->mz-=boost;
 I32 *e=g34_exit+d*6;F32 ex=e[3]-e[0],ez=e[5]-e[2],el=sqrt(ex*ex+ez*ez);if(c->mx*ex+c->mz*ez<0){ex=-ex;ez=-ez;}
 F32 sp=sqrt(c->mx*c->mx+c->mz*c->mz);if(sp>2)sp=2;c->mx=sp*ex/el;c->mz=sp*ez/el;
 if(MC34_Ridden(c) && g34_rideFw>0){Player *p=MC32_P(s);F32 yr=p->mob.entity.body.yaw*MC31_PI/180;if(c->mx*c->mx+c->mz*c->mz<0.01){c->mx-=sin(yr)*0.1;c->mz+=cos(yr)*0.1;}}
 F32 x0=x+0.5+e[0]*0.5,z0=z+0.5+e[2]*0.5,dx=x+0.5+e[3]*0.5-x0,dz=z+0.5+e[5]*0.5-z0,t;
 if(dx==0)t=c->z-z;else if(dz==0)t=c->x-x;else{t=(c->z-z0)*dz+(c->x-x0)*dx;t=t+t;}
 c->x=x0+dx*t;c->z=z0+dz*t;c->y=c->y+0.35+0.00001;
 F32 mx=c->mx,mz=c->mz;if(MC34_Ridden(c)){mx*=0.75;mz*=0.75;}if(mx<-maxSpeed)mx=-maxSpeed;if(mx>maxSpeed)mx=maxSpeed;if(mz<-maxSpeed)mz=-maxSpeed;if(mz>maxSpeed)mz=maxSpeed;
 F32 keepX=c->mx,keepZ=c->mz;MC34_CartMove(s,c,mx,0,mz);c->mx=keepX;c->mz=keepZ;if(c->hcol){c->mx=0;c->mz=0;}
 if(e[1] && floorf(c->x)-x==e[0] && floorf(c->z)-z==e[2])c->y+=e[1];else if(e[4] && floorf(c->x)-x==e[3] && floorf(c->z)-z==e[5])c->y+=e[4];
 F32 sl=0.96;if(MC34_Ridden(c))sl=0.997;c->mx*=sl;c->my=0;c->mz*=sl;
 F32 p2x,p2y,p2z;if(MC34_GetPos(s,c->x,c->y,c->z,&p2x,&p2y,&p2z) && had){F32 yd=(p1y-p2y)*0.05,v=sqrt(c->mx*c->mx+c->mz*c->mz);if(v>0){c->mx=c->mx/v*(v+yd);c->mz=c->mz/v*(v+yd);}c->y=p2y;}
 I32 fx=floorf(c->x),fz=floorf(c->z);if(fx!=x || fz!=z){F32 v=sqrt(c->mx*c->mx+c->mz*c->mz);c->mx=v*(fx-x);c->mz=v*(fz-z);}
 if(id==27){F32 v=sqrt(c->mx*c->mx+c->mz*c->mz);if(v>0.01){c->mx+=c->mx/v*0.06;c->mz+=c->mz/v*0.06;}
  else if(d==1){if(MC32_Solid(s,x-1,y,z))c->mx=0.02;else if(MC32_Solid(s,x+1,y,z))c->mx=-0.02;}
  else if(d==0){if(MC32_Solid(s,x,y,z-1))c->mz=0.02;else if(MC32_Solid(s,x,y,z+1))c->mz=-0.02;}}}
// Minecart::push(Entity*) for the player / mobs touching the cart
U0 MC34_PushBody(MC34Cart *c,MCBody023 *b,AABB *eb){if(eb->maxX<c->x-0.69 || eb->minX>c->x+0.69 || eb->maxZ<c->z-0.69 || eb->minZ>c->z+0.69 || eb->maxY<c->y-0.35 || eb->minY>c->y+0.35)return;
 F32 xa=b->x-c->x,za=b->z-c->z,dd=xa*xa+za*za;if(dd<0.0001)return;dd=sqrt(dd);xa/=dd;za/=dd;F32 pw=1/dd;if(pw>1)pw=1;xa*=pw*0.05;za*=pw*0.05;c->mx-=xa;c->mz-=za;b->motionX+=xa/4;b->motionZ+=za/4;}
U0 MC34_CartTick(MCApp028 *s,MC34Cart *c){if(c->hurtTime>0)c->hurtTime--;if(c->damage>0)c->damage-=1;if(c->damage<0)c->damage=0;if(c->y<-64){c->removed=TRUE;return;}
 c->px=c->x;c->py=c->y;c->pz=c->z;c->pyaw=c->yaw;c->ppitch=c->pitch;c->my-=0.04;
 I32 bx=floorf(c->x),by=floorf(c->y),bz=floorf(c->z);if(MC34_RailAt(s,bx,by-1,bz))by--;
 if(MC34_RailAt(s,bx,by,bz))MC34_Track(s,c,bx,by,bz,0.4,0.0078125,Level_getTile(&s->level,bx,by,bz),Level_getData(&s->level,bx,by,bz));else MC34_OffTrack(s,c,0.4);
 c->pitch=0;F32 dx=c->px-c->x,dz=c->pz-c->z;if(dx*dx+dz*dz>0.001){c->yaw=atan2f(dz,dx)*180/MC31_PI;if(c->reverse)c->yaw+=180;}
 F32 r=c->yaw-c->pyaw;while(r>=180)r-=360;while(r<-180)r+=360;if(r<-170 || r>=170){c->yaw+=180;c->reverse=!c->reverse;}
 while(c->yaw-c->pyaw>=180)c->pyaw+=360;while(c->yaw-c->pyaw<-180)c->pyaw-=360;
 Player *p=MC32_P(s);if(!MC34_Ridden(c) && p->mob.entity.body.health>0)MC34_PushBody(c,&p->mob.entity.body,&p->mob.entity.box);
 I32 i;for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(!m->removed && m->e.body.health>0)MC34_PushBody(c,&m->e.body,&m->e.box);}}
U0 MC34_Dismount(MCApp028 *s){if(g34_ride<0)return;MC34Cart *c=&g34_cart[g34_ride];g34_ride=-1;Player *p=MC32_P(s);Entity *e=&p->mob.entity;Entity_setPos(e,c->x,c->y+0.35+1.62+0.01,c->z);e->body.prevX=e->body.x;e->body.prevY=e->body.y;e->body.prevZ=e->body.z;e->body.motionX=0;e->body.motionY=0;e->body.motionZ=0;s->previousFall=0;printf("RIDE034 dismount at=%.2f,%.2f,%.2f\n",c->x,c->y,c->z);}
U0 MC34_Ride(MCApp028 *s,I32 i){if(i<0 || i>=g34_cartN)return;if(g34_ride>=0){MC34_Dismount(s);return;}g34_ride=i;g34_rides++;MC34Cart *c=&g34_cart[i];Player *p=MC32_P(s);if(p->sleeping)return;Entity *e=&p->mob.entity;Entity_setPos(e,c->x,c->y+0.82,c->z);e->body.prevX=e->body.x;e->body.prevY=e->body.y;e->body.prevZ=e->body.z;printf("RIDE034 mount cart=%d\n",c->id);}
U0 MC34_CartHurt(MCApp028 *s,I32 i,I32 dmg){MC34Cart *c=&g34_cart[i];if(c->removed)return;c->hurtDir=-c->hurtDir;c->hurtTime=10;c->damage+=dmg*10;if(s->creative)c->damage=100;
 MC030_Play("step.wood",c->x,c->y,c->z,0.6,1.0);
 if(c->damage>40){if(g34_ride==i)MC34_Dismount(s);c->removed=TRUE;g34_cartBroken++;if(!s->creative)MC31_Drop(328,0,1,c->x,c->y,c->z,0,0,0,FALSE);s->unsaved=TRUE;printf("CART034 broken id=%d\n",c->id);}}
U0 MC34_Carts(MCApp028 *s){I32 i,j=0,ride=-1;for(i=0;i<g34_cartN;i++){MC34_CartTick(s,&g34_cart[i]);}
 for(i=0;i<g34_cartN;i++){if(g34_cart[i].removed){if(g34_ride==i)g34_ride=-1;continue;}if(g34_ride==i)ride=j;if(j!=i)g34_cart[j]=g34_cart[i];j++;}g34_cartN=j;g34_ride=ride;
 if(g34_ride>=0){MC34Cart *c=&g34_cart[g34_ride];Player *p=MC32_P(s);Entity *e=&p->mob.entity;if(e->body.health<=0){g34_ride=-1;return;}Entity_setPos(e,c->x,c->y+0.82,c->z);e->body.motionX=0;e->body.motionY=0;e->body.motionZ=0;e->body.onGround=TRUE;e->fallDistance=0;s->previousFall=0;}}
U0 MC034_RideInput(MCApp028 *s){g34_app=s;g34_rideFw=0;if(g34_ride<0)return;g34_rideFw=s->input.forwardInput;g34_rideSt=s->input.strafeInput;if(s->input.sneaking || s->input.jumping){MC34_Dismount(s);}s->input.strafeInput=0;s->input.forwardInput=0;s->input.jumping=FALSE;s->input.sneaking=FALSE;}
U0 MC034_PickCart(MCApp028 *s){g34_cartSel=-1;if(!s->worldReady || !s->minecraft.player || g29_dirMode==2 || s->paused || s->inventory || !g34_cartN)return;
 Vec3 eye,end;MC028_Direction(s,&eye,&end,1);F32 dx=end.x-eye.x,dy=end.y-eye.y,dz=end.z-eye.z,limit=3;if(s->creative)limit=5;
 if(s->hasHit){I32 id=Level_getTile(&s->level,s->hit.x,s->hit.y,s->hit.z);AABB box;Tile_getAABB(&s->catalog.tiles[id],s->hit.x,s->hit.y,s->hit.z,&box);F32 t=MC31_Slab(&eye,dx,dy,dz,box.minX,box.minY,box.minZ,box.maxX,box.maxY,box.maxZ);if(t>=0 && t<limit)limit=t;}
 if(g31_sel){AABB *a=&g31_sel->e.box;F32 t=MC31_Slab(&eye,dx,dy,dz,a->minX-0.1,a->minY-0.1,a->minZ-0.1,a->maxX+0.1,a->maxY+0.1,a->maxZ+0.1);if(t>=0 && t<limit)limit=t;}
 I32 i;for(i=0;i<g34_cartN;i++){if(i==g34_ride)continue;MC34Cart *c=&g34_cart[i];F32 t=MC31_Slab(&eye,dx,dy,dz,c->x-0.59,c->y-0.45,c->z-0.59,c->x+0.59,c->y+0.45,c->z+0.59);if(t>=0 && t<limit){limit=t;g34_cartSel=i;}}
 if(g34_cartSel>=0){s->hasHit=FALSE;g31_sel=NULL;}}
U0 MC034_CartInput(MCApp028 *s){I32 i=g34_cartSel;if(i<0)return;if(s->mining){SurvivalMode_stopDestroyBlock(&s->minecraft.survival);s->mining=FALSE;}
 Bool attack,use;if(g29_touchOn){attack=s->rightPressed;use=g31_holdEdge;}else{attack=s->leftPressed;use=(s->rightPressed || s->rightDown) && !s->placeCooldown;}
 if(attack)MC34_CartHurt(s,i,MC31_AttackDamage(MC31_Held()));else if(use){MC34_Ride(s,i);s->placeCooldown=5;}
 s->rightPressed=FALSE;}
U0 MC034_Camera(MCApp028 *s,Vec3 *eye,Vec3 *target,F32 pt){if(g35_shooting)MC035_ShotView(s,eye,target);}
// MinecartRenderer + MinecartModel
U0 MC34_CartModel(){F32 PI=MC31_PI;g31_tw=64;g31_th=32;
 MC31_Part(0,4,0,PI/2,0,0);MC31_Box(0,10,-10,-8,-1,20,16,2,0);MC31_End();
 MC31_Part(-9,4,0,0,PI*3/2,0);MC31_Box(0,0,-8,-9,-1,16,8,2,0);MC31_End();
 MC31_Part(9,4,0,0,PI/2,0);MC31_Box(0,0,-8,-9,-1,16,8,2,0);MC31_End();
 MC31_Part(0,4,-7,0,PI,0);MC31_Box(0,0,-8,-9,-1,16,8,2,0);MC31_End();
 MC31_Part(0,4,7,0,0,0);MC31_Box(0,0,-8,-9,-1,16,8,2,0);MC31_End();
 MC31_Part(0,4.1,0,-PI/2,0,0);MC31_Box(44,10,-9,-7,-1,18,14,1,0);MC31_End();}
U0 MC34_RenderCarts(MCApp028 *s,F32 pt){if(!g34_cartN || !g34_cartTex)return;I32 i;hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,g34_cartTex);MC33_LightOn();
 for(i=0;i<g34_cartN;i++){MC34Cart *c=&g34_cart[i];F32 x=c->px+(c->x-c->px)*pt,y=c->py+(c->y-c->py)*pt,z=c->pz+(c->z-c->pz)*pt,yaw=c->pyaw+(c->yaw-c->pyaw)*pt,pitch=c->ppitch+(c->pitch-c->ppitch)*pt,rx,ry,rz;
  if(MC34_GetPos(s,x,y,z,&rx,&ry,&rz)){F32 ax,ay,az,bx,by,bz;if(!MC34_GetPosOffs(s,x,y,z,0.3,&ax,&ay,&az)){ax=rx;ay=ry;az=rz;}if(!MC34_GetPosOffs(s,x,y,z,-0.3,&bx,&by,&bz)){bx=rx;by=ry;bz=rz;}
   x=rx;y=(ay+by)/2;z=rz;F32 dx=bx-ax,dy=by-ay,dz=bz-az,l=sqrt(dx*dx+dy*dy+dz*dz);if(l!=0){dx/=l;dy/=l;dz/=l;yaw=atan2f(dz,dx)*180/MC31_PI;pitch=atan(dy)*73;}}
  F32 li=MC31_Bright(floorf(x),floorf(y),floorf(z));hcgl028_glPushMatrix();hcgl028_glTranslatef(x,y,z);hcgl028_glRotatef(180-yaw,0,1,0);hcgl028_glRotatef(-pitch,0,0,1);
  F32 hurt=c->hurtTime-pt,dmg=c->damage-pt;if(dmg<0)dmg=0;if(hurt>0)hcgl028_glRotatef(sin(hurt)*hurt*dmg/10*c->hurtDir,1,0,0);
  hcgl028_glScalef(-1,-1,1);hcgl028_glColor4f(li,li,li,1);MC34_CartModel();hcgl028_glPopMatrix();}
 MC33_LightOff();hcgl028_glColor4f(1,1,1,1);g31_th=32;}
// ---- SignRenderer ----
U0 MC34_RenderSigns(MCApp028 *s,F32 pt){if(!g34_signN || !g34_signTex)return;Player *p=MC32_P(s);MCBody023 *pb=&p->mob.entity.body;I32 i,k;F32 size=2/3.0;U8 buf[40];
 hcgl028_glEnable(0xDE1);hcgl028_glDisable(0xB50);
 for(i=0;i<g34_signN;i++){MC34Sign *g=g34_sign[i];I32 id=Level_getTile(&s->level,g->x,g->y,g->z);if(id!=63 && id!=68)continue;F32 dx=g->x+0.5-pb->x,dy=g->y+0.5-pb->y,dz=g->z+0.5-pb->z;if(dx*dx+dy*dy+dz*dz>64*64)continue;
  I32 d=Level_getData(&s->level,g->x,g->y,g->z);F32 l=MC028_Brightness(s,g->x,g->y,g->z);hcgl028_glPushMatrix();hcgl028_glTranslatef(g->x+0.5,g->y+0.75*size,g->z+0.5);
  if(id==63)hcgl028_glRotatef(-(d*360/16.0),0,1,0);else{F32 r=0;if(d==2)r=180;if(d==4)r=90;if(d==5)r=-90;hcgl028_glRotatef(-r,0,1,0);hcgl028_glTranslatef(0,-0.3125,-0.4375);}
  hcgl028_glBindTexture(0xDE1,g34_signTex);hcgl028_glColor4f(l,l,l,1);hcgl028_glPushMatrix();hcgl028_glScalef(size,-size,-size);g31_tw=64;g31_th=32;MC31_Box(0,0,-12,-14,-1,24,12,2,0);if(id==63)MC31_Box(0,14,-1,-2,-1,2,14,2,0);hcgl028_glPopMatrix();
  F32 sc=1/60.0*size;hcgl028_glTranslatef(0,0.5*size,0.07*size);hcgl028_glScalef(sc,-sc,sc);hcgl028_glDepthMask(0);
  for(k=0;k<4;k++){U8 *t=g->text+k*16;if(g34_edit==g && k==g34_editLine && ((s->ticks/6)%2)==0){snprintf(buf,40,"> %s <",t);t=buf;}MC029_DrawText(t,-MC029_Width(t)/2,k*10-20,0xFF000000,FALSE);}
  hcgl028_glDepthMask(1);hcgl028_glPopMatrix();}
 hcgl028_glColor4f(1,1,1,1);g31_th=32;}
// ---- TextEditScreen ----
I32 g34_bx,g34_by,g34_bw,g34_bh;
U0 MC34_SignLayout(){g34_bw=192;g34_bh=96;if(g34_bw>g29_gw-20){g34_bw=g29_gw-20;g34_bh=g34_bw/2;}g34_bx=g29_gw/2-g34_bw/2;g34_by=g29_gh/2-g34_bh/2-10;if(g34_by<24)g34_by=24;}
U0 MC034_SignInit(MCApp028 *s){g29_btnN=0;MC34_SignLayout();MC029_AddT(1,g29_gw/2-50,g34_by+g34_bh+12,100,20,"Done");}
U0 MC034_SignRender(MCApp028 *s){MC34_Tex();MC029_RenderBackground(TRUE);MC34_SignLayout();U8 *title="Edit sign message:";MC029_DrawText(title,g29_gw/2-MC029_Width(title)/2,g34_by-16,0xFFFFFFFF,TRUE);
 hcgl028_glColor4f(1,1,1,1);MC029_BlitUV(&g34_signGui,g34_bx,g34_by,g34_bw,g34_bh,2/64.0,2/32.0,26/64.0,14/32.0);
 if(g34_edit){I32 k;U8 buf[40];for(k=0;k<4;k++){U8 *t=g34_edit->text+k*16;if(k==g34_editLine && ((s->ticks/6)%2)==0){snprintf(buf,40,"> %s <",t);t=buf;}MC029_DrawText(t,g29_gw/2-MC029_Width(t)/2,g34_by+g34_bh/2-38+k*20,0xFF000000,FALSE);}}
 MC029_White();MC029_RenderButtons();}
U0 MC034_SignPress(MCApp028 *s){MC029_PressButtons();I32 k;for(k=0;k<4;k++)if(MC029_Inside(g34_bx,g34_by+g34_bh/2-44+k*20,g34_bw,20))g34_editLine=k;}
U0 MC034_SignRelease(MCApp028 *s){if(MC029_ReleaseButtons()==1)MC029_Go(G29S_NONE);}
U0 MC034_SignKey(MCApp028 *s,I32 k){if(!g34_edit){MC029_Go(G29S_NONE);return;}U8 *t=g34_edit->text+g34_editLine*16;I32 n=strlen(t);
 if(k==27){MC029_Go(G29S_NONE);return;}if(k==8){if(n>0)t[n-1]=0;return;}if(k==13 || k==301){g34_editLine++;if(g34_editLine>3){g34_editLine=3;if(k==13)MC029_Go(G29S_NONE);}return;}if(k==300){if(g34_editLine>0)g34_editLine--;return;}}
U0 MC034_SignChars(){I32 c;while((c=hc029_text())>=0){if(!g34_edit)continue;U8 *t=g34_edit->text+g34_editLine*16;I32 n=strlen(t);if(c>=32 && c<127 && n<15){t[n]=c;t[n+1]=0;}}}
U0 MC034_SignClose(MCApp028 *s){if(g34_edit){printf("SIGN034 text=[%s|%s|%s|%s]\n",g34_edit->text,g34_edit->text+16,g34_edit->text+32,g34_edit->text+48);s->unsaved=TRUE;}g34_edit=NULL;}
// ---- use: SignItem::useOn, BaseRailTile placement, MinecartItem::useOn ----
I32 MC034_UseOn(MCApp028 *s,ItemInstance *item,I32 x,I32 y,I32 z,I32 face){g34_app=s;I32 id=ItemInstance_getId(item);Level *l=&s->level;
 if(id==323){if(face<1 || face>5)return 0;I32 t=Level_getTile(l,x,y,z);if(t<=0 || !s->catalog.registry.tiles[t].solid)return 0;I32 dx[6]={0,0,0,0,-1,1},dz[6]={0,0,-1,1,0,0},dy[6]={-1,1,0,0,0,0};
  I32 nx=x+dx[face],ny=y+dy[face],nz=z+dz[face];if(!MC32_Air(s,nx,ny,nz))return 0;I32 tile=68,data=face;if(face==1){tile=63;F32 yaw=MC32_P(s)->mob.entity.body.yaw;data=floorf((yaw+180)*16/360+0.5);data&=15;}
  if(!MC32_PlaceTile(s,item,nx,ny,nz,tile,data))return 0;MC34Sign *g=MC34_SignAdd(nx,ny,nz);if(g){g34_edit=g;g34_editLine=0;MC029_Go(G34S_SIGN);}return 1;}
 if(id==66 || id==27){I32 nx=x,ny=y,nz=z;if(!MC32_Next(s,&nx,&ny,&nz,face))return 0;if(!MC32_Solid(s,nx,ny-1,nz))return 0;if(!MC32_PlaceTile(s,item,nx,ny,nz,id,0))return 0;MC34_RailPlace(s,nx,ny,nz,TRUE);return 1;}
 if(id==328){if(!MC34_RailAt(s,x,y,z))return 0;if(!MC34_AddCart(s,x+0.5,y+0.5+0.35,z+0.5))return 0;MC32_Use1(s,item);printf("CART034 placed at=%d,%d,%d\n",x,y,z);return 1;}
 return -1;}
// ---- chat commands ----
I32 MC34_Kind(U8 *n){if(!strcmp(n,"zombie"))return 32;if(!strcmp(n,"creeper"))return 33;if(!strcmp(n,"skeleton"))return 34;if(!strcmp(n,"spider"))return 35;if(!strcmp(n,"pigzombie") || !strcmp(n,"pigman") || !strcmp(n,"zombiepigman"))return 36;
 if(!strcmp(n,"chicken"))return 10;if(!strcmp(n,"cow"))return 11;if(!strcmp(n,"pig"))return 12;if(!strcmp(n,"sheep"))return 13;if(!strcmp(n,"minecart") || !strcmp(n,"cart"))return 1;return 0;}
Bool MC34_Summon(MCApp028 *s,I32 kind,F32 dist){Player *p=MC32_P(s);MCBody023 *pb=&p->mob.entity.body;F32 yr=pb->yaw*MC31_PI/180,x=pb->x-sin(yr)*dist,z=pb->z+cos(yr)*dist,y=p->mob.entity.box.minY;I32 bx=floorf(x),bz=floorf(z),by=floorf(y),k;
 if(bx<0 || bz<0 || bx>255 || bz>255)return FALSE;for(k=0;k<8;k++){if(!MC31_Cube(MC31_Tile(bx,by,bz)) && !MC31_Cube(MC31_Tile(bx,by+1,bz)))break;by++;}
 if(kind==1){if(MC34_RailAt(s,bx,by,bz))return MC34_AddCart(s,bx+0.5,by+0.5+0.35,bz+0.5)!=NULL;return MC34_AddCart(s,x,by+0.36,z)!=NULL;}
 g31_app=s;MC31Mob *m=MC31_New(kind,x,by,z,pb->yaw+180);if(!m)return FALSE;if(kind==13)MC31_SheepColor(m);s->unsaved=TRUE;printf("SUMMON034 kind=%d at=%.1f,%d,%.1f\n",kind,x,by,z);return TRUE;}
Bool MC034_Command(MCApp028 *s,U8 *text){if(text[0]!='/' || !s->worldReady)return FALSE;U8 cmd[32],arg[32];I32 i=1,n=0;while(text[i]==32)i++;while(text[i] && text[i]!=32 && n<31)cmd[n++]=text[i++];cmd[n]=0;while(text[i]==32)i++;n=0;while(text[i] && text[i]!=32 && n<31){U8 c=text[i++];if(c>='A' && c<='Z')c+=32;arg[n++]=c;}arg[n]=0;
 U8 reply[160];Bool ok=TRUE;
 if(!strcmp(cmd,"summon") || !strcmp(cmd,"spawn")){I32 k=MC34_Kind(arg);if(!k)snprintf(reply,160,"Usage: /summon zombie|skeleton|spider|creeper|pigzombie|chicken|cow|pig|sheep|minecart");else if(MC34_Summon(s,k,3))snprintf(reply,160,"Summoned %s",arg);else snprintf(reply,160,"Could not summon %s here",arg);}
 else if(!strcmp(cmd,"time")){I32 v=-1;if(!strcmp(arg,"day"))v=1000;else if(!strcmp(arg,"night"))v=14400;else if(!strcmp(arg,"noon"))v=4800;else if(arg[0]>='0' && arg[0]<='9')v=atoi(arg)%19200;
  if(v<0)snprintf(reply,160,"Usage: /time day|night|noon|<0-19199>");else{I64 day=s->level.data.time/19200;s->level.data.time=day*19200+v;s->unsaved=TRUE;snprintf(reply,160,"Time set to %d",v);}}
 else if(!strcmp(cmd,"help"))snprintf(reply,160,"Commands: /summon <mob|minecart>, /time day|night|<ticks>");
 else ok=FALSE;
 if(!ok)return FALSE;MC029_PushMessage(g29_opt.username,text,200);MC029_PushMessage("server",reply,200);printf("CMD034 %s -> %s\n",text,reply);return TRUE;}
// ---- world034.dat (magic 'M43D', v1): signs (x,y,z + 64 text bytes) then carts (x,y,z,mx,my,mz,yaw,damage) ----
#define MC34_SREC 76
#define MC34_CREC 32
Bool MC034_Save(MCApp028 *s,U8 *stage){I32 ns=0,nc=g34_cartN,i,k=0;for(i=0;i<g34_signN;i++){I32 id=Level_getTile(&s->level,g34_sign[i]->x,g34_sign[i]->y,g34_sign[i]->z);if(id==63 || id==68)ns++;}
 I32 size=20+ns*MC34_SREC+nc*MC34_CREC;U8 *buf=MC_Alloc(size);memset(buf,0,size);I32 *h=buf(I32*);h[0]=0x4434334D;h[1]=1;h[2]=ns;h[3]=nc;
 for(i=0;i<g34_signN;i++){MC34Sign *g=g34_sign[i];I32 id=Level_getTile(&s->level,g->x,g->y,g->z);if(id!=63 && id!=68)continue;U8 *r=buf+20+k*MC34_SREC;I32 *w=r(I32*);w[0]=g->x;w[1]=g->y;w[2]=g->z;memcpy(r+12,g->text,64);k++;}
 for(i=0;i<nc;i++){MC34Cart *c=&g34_cart[i];F32 *f=(buf+20+ns*MC34_SREC+i*MC34_CREC)(F32*);f[0]=c->x;f[1]=c->y;f[2]=c->z;f[3]=c->mx;f[4]=c->my;f[5]=c->mz;f[6]=c->yaw;f[7]=c->damage;}
 h[4]=MC028_Hash(buf,size);MCString path;MCString_FromC(&path,stage);MC025_Append(&path,"/world034.dat");U0 *file=fopen(path.data,"wb");Bool ok=FALSE;if(file){ok=fwrite(buf,1,size,file)==size;if(fclose(file))ok=FALSE;}MCString_Destroy(&path);free(buf);return ok;}
U0 MC034_Clear(){while(g34_signN>0){g34_signN--;free(g34_sign[g34_signN]);}g34_edit=NULL;g34_cartN=0;g34_arrowN=0;g34_ride=-1;g34_cartSel=-1;}
I32 MC34_Load(MCApp028 *s){MCString path;MCString_FromC(&path,s->activePath);MC025_Append(&path,"/world034.dat");U0 *file=fopen(path.data,"rb");MCString_Destroy(&path);if(!file)return 0;
 if(fseek(file,0,2)){fclose(file);return -1;}I64 size=ftell(file);if(size<20 || size>20+MC34_MAXSIGN*MC34_SREC+MC34_MAXCART*MC34_CREC){fclose(file);return -1;}rewind(file);U8 *buf=MC_Alloc(size);Bool ok=fread(buf,1,size,file)==size;fclose(file);if(!ok){free(buf);return -1;}
 I32 *h=buf(I32*);if(h[0]!=0x4434334D || h[1]!=1 || h[2]<0 || h[2]>MC34_MAXSIGN || h[3]<0 || h[3]>MC34_MAXCART || size!=20+h[2]*MC34_SREC+h[3]*MC34_CREC){free(buf);return -1;}U32 expected=h[4];h[4]=0;if(MC028_Hash(buf,size)!=expected){free(buf);return -1;}
 I32 i,j;for(i=0;i<h[2];i++){U8 *r=buf+20+i*MC34_SREC;I32 *w=r(I32*);if(!Level_InBounds(w[0],w[1],w[2])){free(buf);MC034_Clear();return -1;}MC34Sign *g=MC34_SignAdd(w[0],w[1],w[2]);if(!g)break;for(j=0;j<4;j++){U8 *src=r+12+j*16;I32 q;for(q=0;q<15 && src[q];q++){U8 c=src[q];if(c<32 || c>126)c='?';g->text[j*16+q]=c;}}}
 for(i=0;i<h[3];i++){F32 *f=(buf+20+h[2]*MC34_SREC+i*MC34_CREC)(F32*);if(!(f[0]>=0 && f[0]<=256 && f[1]>-64 && f[1]<300 && f[2]>=0 && f[2]<=256 && fabs(f[3])<=10 && fabs(f[4])<=10 && fabs(f[5])<=10 && fabs(f[6])<1.0e6 && f[7]>=0 && f[7]<=100)){free(buf);MC034_Clear();return -1;}
  MC34Cart *c=MC34_AddCart(s,f[0],f[1],f[2]);if(!c)break;c->mx=f[3];c->my=f[4];c->mz=f[5];c->yaw=f[6];c->pyaw=f[6];c->damage=f[7];}
 free(buf);return 1;}
U0 MC34_Demo(MCApp028 *s);
Bool MC034_Start(MCApp028 *s,I32 active){MC034_Clear();g34_app=s;g34_cartMade=0;g34_cartBroken=0;g34_rides=0;if(active==1){I32 r=MC34_Load(s);if(r<0)return FALSE;if(r==1)printf("WORLD034 loaded signs=%d carts=%d\n",g34_signN,g34_cartN);}MC34_Demo(s);return TRUE;}
// ---- per-tick / render entry points ----
U0 MC34_DemoTick(MCApp028 *s);
U0 MC034_Tick(MCApp028 *s){g34_app=s;g31_app=s;s->level.world.difficulty=g29_opt.difficulty;MC34_FireTick();MC34_Carts(s);MC34_Arrows(s);
 if((s->ticks%20)==0){I32 i=0;while(i<g34_signN){MC34Sign *g=g34_sign[i];I32 id=Level_getTile(&s->level,g->x,g->y,g->z);if(id!=63 && id!=68){MC34_SignRemove(g->x,g->y,g->z);continue;}i++;}}
 if(g34_demo)MC34_DemoTick(s);}
U0 MC034_Render(MCApp028 *s,F32 pt){g34_app=s;g31_app=s;MC34_Tex();MC34_Flames(s,pt);MC34_RenderArrows(s,pt);MC34_RenderCarts(s,pt);MC34_RenderSigns(s,pt);MC035_Render(s,pt);hcgl028_glEnable(0xDE1);hcgl028_glColor4f(1,1,1,1);}
// ---- MCPE_DEMO034=m|n|c|k|s|e|f : scripted test scenes (testing aid) ----
I32 g34_gx,g34_gy,g34_gz;
U0 MC34_Demo(MCApp028 *s){U8 *v=C31_getenv("MCPE_DEMO034");g34_demo=0;if(!v)return;g34_demo=v[0];printf("DEMO034 mode=%c\n",g34_demo);}
U0 MC34_DSet(MCApp028 *s,I32 dx,I32 dy,I32 dz,I32 id,I32 m){Level_setTileAndData(&s->level,g34_gx+dx,g34_gy+dy,g34_gz+dz,id,m,3);}
U0 MC34_DRail(MCApp028 *s,I32 dx,I32 dy,I32 dz,I32 id){MC34_DSet(s,dx,dy,dz,id,0);MC34_RailPlace(s,g34_gx+dx,g34_gy+dy,g34_gz+dz,TRUE);}
U0 MC34_DMob(MCApp028 *s,I32 kind,F32 dx,F32 dz){MC31Mob *m=MC31_New(kind,g34_gx+dx+0.5,g34_gy+1,g34_gz+dz+0.5,180);if(m){m->bodyRot=180;m->prevBodyRot=180;m->headYaw=180;m->prevHeadYaw=180;m->lastHeadYaw=180;}}
U0 MC34_DemoTick(MCApp028 *s){I32 t=s->ticks,dx,dz,dy,mode=g34_demo;Player *p=MC32_P(s);MCBody023 *b=&p->mob.entity.body;
 if(t==5){g34_gx=floorf(b->x);g34_gz=floorf(b->z);g34_gy=floorf(p->mob.entity.box.minY)-1;
  for(dx=-8;dx<=8;dx++)for(dz=-2;dz<=16;dz++){MC34_DSet(s,dx,0,dz,1,0);MC34_DSet(s,dx,-1,dz,1,0);for(dy=1;dy<=6;dy++)MC34_DSet(s,dx,dy,dz,0,0);}
  if(mode=='g'){I32 ids[5]={391,392,458,361,362},tiles[5]={141,142,244,104,105},i,ok=0;for(i=0;i<5;i++){I32 xx=g34_gx+i-2,yy=g34_gy,zz=g34_gz+5;MC34_DSet(s,i-2,0,5,60,7);ItemInstance seed;ItemInstance_Init(&seed,&s->catalog.registry,ids[i],1,0);I32 r=MC032_UseOn(s,&seed,xx,yy,zz,1);if(r==1 && Level_getTile(&s->level,xx,yy+1,zz)==tiles[i])ok++;ItemInstance meal;ItemInstance_Init(&meal,&s->catalog.registry,351,1,15);MC032_UseOn(s,&meal,xx,yy+1,zz,1);if(Level_getData(&s->level,xx,yy+1,zz)==7)ok++;}printf("TEST035 planting-and-bonemeal=%d/10\n",ok);for(dx=-3;dx<=3;dx++){MC34_DSet(s,dx,0,8,60,7);MC34_DSet(s,dx,1,8,59,dx+3);MC34_DSet(s,dx,0,10,60,7);MC34_DSet(s,dx,1,10,141,dx+3);}MC34_DSet(s,4,1,6,103,0);MC34_DSet(s,-4,1,6,86,0);s->level.data.time=1000;}
  if(mode=='m' || mode=='n'){s->level.data.time=1000;if(mode=='n')s->level.data.time=14400;MC34_DMob(s,32,-4,7);MC34_DMob(s,34,-2,7);MC34_DMob(s,33,0,7);MC34_DMob(s,35,2,7);MC34_DMob(s,36,4,7);}
  if(mode=='c' || mode=='k'){for(dx=-3;dx<=3;dx++){MC34_DRail(s,dx,1,3,66);}for(dz=4;dz<=9;dz++)MC34_DRail(s,3,1,dz,66);for(dx=2;dx>=-3;dx--)MC34_DRail(s,dx,1,9,66);for(dz=8;dz>=4;dz--){I32 id=66;if(dz>=5 && dz<=7)id=27;MC34_DRail(s,-3,1,dz,id);}
   MC34_DRail(s,6,1,3,66);MC34_DRail(s,6,1,4,66);MC34_DSet(s,6,1,5,1,0);MC34_DSet(s,6,1,6,1,0);MC34_DSet(s,6,1,7,1,0);MC34_DRail(s,6,2,5,66);MC34_DRail(s,6,2,6,66);MC34_DRail(s,6,2,7,66);
   MC34Cart *c=MC34_AddCart(s,g34_gx-3+0.5,g34_gy+1+0.5+0.35,g34_gz+6+0.5);if(c)c->mz=0.3;MC34_AddCart(s,g34_gx+6+0.5,g34_gy+1+0.5+0.35,g34_gz+3+0.5);
   I32 d[8];d[0]=MC34_RailData(s,g34_gx-3,g34_gy+1,g34_gz+3);d[1]=MC34_RailData(s,g34_gx+3,g34_gy+1,g34_gz+3);d[2]=MC34_RailData(s,g34_gx+3,g34_gy+1,g34_gz+9);d[3]=MC34_RailData(s,g34_gx-3,g34_gy+1,g34_gz+9);d[4]=MC34_RailData(s,g34_gx,g34_gy+1,g34_gz+3);d[5]=MC34_RailData(s,g34_gx+6,g34_gy+1,g34_gz+4);d[6]=MC34_RailData(s,g34_gx+6,g34_gy+2,g34_gz+5);d[7]=MC34_RailData(s,g34_gx-3,g34_gy+1,g34_gz+6);
   printf("RAIL034 corners=%d,%d,%d,%d straight=%d slope=%d top=%d golden=%d\n",d[0],d[1],d[2],d[3],d[4],d[5],d[6],d[7]);}
  if(mode=='s' || mode=='e'){MC34_DSet(s,0,1,4,63,8);MC34Sign *g=MC34_SignAdd(g34_gx,g34_gy+1,g34_gz+4);if(g){MC34_SignSet(g,0,"Hello");MC34_SignSet(g,1,"HolyC port");MC34_SignSet(g,2,"MCPE 0.8.1");MC34_SignSet(g,3,"batch034");}
   MC34_DSet(s,3,1,5,4,0);MC34_DSet(s,3,2,5,4,0);MC34_DSet(s,3,1,4,68,2);g=MC34_SignAdd(g34_gx+3,g34_gy+1,g34_gz+4);if(g){MC34_SignSet(g,1,"Wall sign");MC34_SignSet(g,2,"<- rails");}
   MC34_DSet(s,-3,1,4,63,6);g=MC34_SignAdd(g34_gx-3,g34_gy+1,g34_gz+4);if(g)MC34_SignSet(g,1,"Rotated");}
  if(mode=='f'){for(dx=-7;dx<=-2;dx++)MC34_DSet(s,dx,1,4,85,0);MC34_DSet(s,-4,1,5,85,0);MC34_DSet(s,-4,1,6,85,0);MC34_DSet(s,-7,1,5,85,0);MC34_DSet(s,-7,2,4,85,0);
   for(dx=-1;dx<=2;dx++)MC34_DSet(s,dx,1,4,139,0);MC34_DSet(s,0,1,5,139,1);MC34_DSet(s,0,1,6,139,1);MC34_DSet(s,2,2,4,1,0);MC34_DSet(s,-1,1,7,139,0);
   for(dx=4;dx<=7;dx++)MC34_DSet(s,dx,1,4,102,0);MC34_DSet(s,4,1,5,102,0);MC34_DSet(s,4,2,4,102,0);for(dx=4;dx<=7;dx++)MC34_DSet(s,dx,1,7,101,0);MC34_DSet(s,8,1,7,1,0);MC34_DSet(s,6,1,8,101,0);MC34_DSet(s,2,1,8,101,0);MC34_DSet(s,-2,1,8,102,0);}
  F32 yaw=0,back=0;U8 *ev=C31_getenv("MCPE_DEMO034_YAW");if(ev)yaw=atoi(ev);ev=C31_getenv("MCPE_DEMO034_BACK");if(ev)back=atoi(ev);Entity_moveTo(&p->mob.entity,g34_gx+0.5,b->y,g34_gz+0.5-back,yaw,25);b->prevX=b->x;b->prevZ=b->z;s->lightsDirty=TRUE;printf("DEMO034 scene at=%d,%d,%d\n",g34_gx,g34_gy,g34_gz);}
 if(mode=='c' && t==12 && g34_cartN>0){MC34_Ride(s,0);}
 if(mode=='c' && t>12 && (t%40)==0 && g34_ride>=0){MC34Cart *c=&g34_cart[g34_ride];printf("RIDE034 t=%d pos=%.2f,%.2f,%.2f v=%.3f,%.3f\n",t,c->x-g34_gx,c->y-g34_gy,c->z-g34_gz,c->mx,c->mz);}
 if(mode=='k' && (t%40)==0 && g34_cartN>0){MC34Cart *c=&g34_cart[0];printf("CART034 t=%d pos=%.2f,%.2f,%.2f v=%.3f,%.3f\n",t,c->x-g34_gx,c->y-g34_gy,c->z-g34_gz,c->mx,c->mz);}
 if(mode=='e' && t==15){g34_edit=MC34_SignFind(g34_gx,g34_gy+1,g34_gz+4);g34_editLine=1;if(g34_edit)MC029_Go(G34S_SIGN);}
 if((mode=='m' || mode=='n') && (t%40)==0){I32 i;for(i=0;i<g31_mobN;i++){MC31Mob *m=g31_mobs[i];if(m->kind>=32)printf("MOB034 t=%d kind=%d pos=%.1f,%.1f hp=%d fire=%d target=%d\n",t,m->kind,m->e.body.x-g34_gx,m->e.body.z-g34_gz,m->e.body.health,m->e.fire,m->target);}printf("PLAYER034 t=%d hp=%d\n",t,b->health);}}
