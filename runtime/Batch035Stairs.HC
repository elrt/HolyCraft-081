// Batch035 stairs: port of StairTile (setBaseShape/setStepShape/setInnerPieceShape/addAABBs/
// getPlacementDataValue) and TileRenderer::tesselateStairsInWorld (render shape 10).
Bool MC35_IsStairs(I32 id){return id==53 || id==67 || id==108 || id==109 || id==114 || id==128 || id==134 || id==135 || id==136 || id==156;}
Bool MC35_Lock(MCApp028 *s,I32 x,I32 y,I32 z,I32 meta){if(!MC35_IsStairs(Level_getTile(&s->level,x,y,z)))return FALSE;return Level_getData(&s->level,x,y,z)==meta;}
Bool MC35_StairN(MCApp028 *s,I32 x,I32 y,I32 z,I32 meta,I32 *d){if(!MC35_IsStairs(Level_getTile(&s->level,x,y,z)))return FALSE;I32 m=Level_getData(&s->level,x,y,z);if((m^meta)&4)return FALSE;*d=m&3;return TRUE;}
U0 MC35_StairBase(MCApp028 *s,I32 x,I32 y,I32 z,F32 *b){I32 m=Level_getData(&s->level,x,y,z);if(m&4)MC32_Set6(b,0,0.5,0,1,1,1);else MC32_Set6(b,0,0,0,1,0.5,1);}
Bool MC35_StairStep(MCApp028 *s,I32 x,I32 y,I32 z,F32 *b){I32 meta=Level_getData(&s->level,x,y,z),dir=meta&3,d;F32 y0=0.5,y1=1,x0=0,x1=1,z0=0,z1=0.5;Bool full=TRUE;if(meta&4){y0=0;y1=0.5;}
 if(dir==0){x0=0.5;z1=1;if(MC35_StairN(s,x+1,y,z,meta,&d)){if(d==3 && !MC35_Lock(s,x,y,z+1,meta)){z1=0.5;full=FALSE;}else if(d==2 && !MC35_Lock(s,x,y,z-1,meta)){z0=0.5;full=FALSE;}}}
 else if(dir==1){x1=0.5;z1=1;if(MC35_StairN(s,x-1,y,z,meta,&d)){if(d==3 && !MC35_Lock(s,x,y,z+1,meta)){z1=0.5;full=FALSE;}else if(d==2 && !MC35_Lock(s,x,y,z-1,meta)){z0=0.5;full=FALSE;}}}
 else if(dir==2){z0=0.5;z1=1;if(MC35_StairN(s,x,y,z+1,meta,&d)){if(d==1 && !MC35_Lock(s,x+1,y,z,meta)){x1=0.5;full=FALSE;}else if(d==0 && !MC35_Lock(s,x-1,y,z,meta)){x0=0.5;full=FALSE;}}}
 else{if(MC35_StairN(s,x,y,z-1,meta,&d)){if(d==1 && !MC35_Lock(s,x+1,y,z,meta)){x1=0.5;full=FALSE;}else if(d==0 && !MC35_Lock(s,x-1,y,z,meta)){x0=0.5;full=FALSE;}}}
 MC32_Set6(b,x0,y0,z0,x1,y1,z1);return full;}
Bool MC35_StairInner(MCApp028 *s,I32 x,I32 y,I32 z,F32 *b){I32 meta=Level_getData(&s->level,x,y,z),dir=meta&3,d;F32 y0=0.5,y1=1,x0=0,x1=0.5,z0=0.5,z1=1;Bool ok=FALSE;if(meta&4){y0=0;y1=0.5;}
 if(dir==0){if(MC35_StairN(s,x-1,y,z,meta,&d)){if(d==3 && !MC35_Lock(s,x,y,z-1,meta)){z0=0;z1=0.5;ok=TRUE;}else if(d==2 && !MC35_Lock(s,x,y,z+1,meta)){z0=0.5;z1=1;ok=TRUE;}}}
 else if(dir==1){x0=0.5;x1=1;if(MC35_StairN(s,x+1,y,z,meta,&d)){if(d==3 && !MC35_Lock(s,x,y,z-1,meta)){z0=0;z1=0.5;ok=TRUE;}else if(d==2 && !MC35_Lock(s,x,y,z+1,meta)){z0=0.5;z1=1;ok=TRUE;}}}
 else if(dir==2){z0=0;z1=0.5;if(MC35_StairN(s,x,y,z-1,meta,&d)){if(d==1 && !MC35_Lock(s,x-1,y,z,meta)){ok=TRUE;}else if(d==0 && !MC35_Lock(s,x+1,y,z,meta)){x0=0.5;x1=1;ok=TRUE;}}}
 else{if(MC35_StairN(s,x,y,z+1,meta,&d)){if(d==1 && !MC35_Lock(s,x-1,y,z,meta)){ok=TRUE;}else if(d==0 && !MC35_Lock(s,x+1,y,z,meta)){x0=0.5;x1=1;ok=TRUE;}}}
 if(ok)MC32_Set6(b,x0,y0,z0,x1,y1,z1);return ok;}
U0 MC35_StairPart(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z,F32 *b){MC32_Bounds(v,b);MC035_TessCubeAO(s,v,x,y,z);}
U0 MC035_StairTess(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z){F32 save[6],b[6];save[0]=v->minX;save[1]=v->minY;save[2]=v->minZ;save[3]=v->maxX;save[4]=v->maxY;save[5]=v->maxZ;
 MC35_StairBase(s,x,y,z,b);MC35_StairPart(s,v,x,y,z,b);Bool full=MC35_StairStep(s,x,y,z,b);MC35_StairPart(s,v,x,y,z,b);if(full && MC35_StairInner(s,x,y,z,b))MC35_StairPart(s,v,x,y,z,b);MC32_Bounds(v,save);}
U0 MC35_StairAdd(I32 x,I32 y,I32 z,F32 *b,AABB *box,MCVector *out){AABB a;AABB_Init(&a,x+b[0],y+b[1],z+b[2],x+b[3],y+b[4],z+b[5]);if(MC025_Intersects(&a,box))MCVector_Push(out,&a);}
// CactusTile::getAABB: collision box inset by 1/16 on the sides and the top
Bool MC35_MultiHook(U0 *lvl,I32 id,I32 x,I32 y,I32 z,AABB *box,MCVector *out){if(!g32_app || &g32_app->level!=lvl)return FALSE;F32 b[6];
 if(id==81){MC32_Set6(b,0.0625,0,0.0625,0.9375,0.9375,0.9375);MC35_StairAdd(x,y,z,b,box,out);return TRUE;}
 if(!MC35_IsStairs(id))return FALSE;MCApp028 *s=g32_app;
 MC35_StairBase(s,x,y,z,b);MC35_StairAdd(x,y,z,b,box,out);Bool full=MC35_StairStep(s,x,y,z,b);MC35_StairAdd(x,y,z,b,box,out);if(full && MC35_StairInner(s,x,y,z,b))MC35_StairAdd(x,y,z,b,box,out);return TRUE;}
I32 MC035_StairPlaced(MCApp028 *s,I32 face,F32 clickY){I32 r=0;if(!face || (face!=1 && clickY>0.5))r=4;I32 d=MC32_Dir(s);if(d==0)return r|2;if(d==1)return r|1;if(d==2)return r|3;return r;}
I32 MC35_StairBoxN(MCApp028 *s,I32 x,I32 y,I32 z){MCVector c;AABB q;AABB_Init(&q,x+0.01,y+0.01,z+0.01,x+0.99,y+0.99,z+0.99);Level_getCubes(&s->level,&q,&c);I32 n=c.size;MCVector_Destroy(&c);return n;}
I32 MC35_StairTry(MCApp028 *s,F32 yaw,I32 x,I32 y,I32 z,I32 face,F32 fy){Player *p=MC35_P(s);MC35_DLook(s,yaw,0);ItemInstance it;ItemInstance_Init(&it,&s->catalog.registry,53,4,0);Vec3 rel;rel.x=x+0.5;rel.y=y+fy;rel.z=z+0.5;
 I32 dx[6]={0,0,0,0,-1,1},dy[6]={-1,1,0,0,0,0},dz[6]={0,0,-1,1,0,0};if(!MC028_UseOn(s,&it,s->minecraft.survival.player,x,y,z,face,&rel))return -1;return Level_getData(&s->level,x+dx[face],y+dy[face],z+dz[face]);}
F32 g35_stairMaxY;
U0 MC35_StairDemo(MCApp028 *s,I32 t){Player *p=MC35_P(s);MCBody023 *b=&p->mob.entity.body;I32 gx=g35_gx,gy=g35_gy,gz=g35_gz;Level *l=&s->level;
 if(t==6){I32 m0=MC35_StairTry(s,0,gx+6,gy,gz+8,1,1),m1=MC35_StairTry(s,90,gx+7,gy,gz+8,1,1),m2=MC35_StairTry(s,180,gx+8,gy,gz+8,1,1),m3=MC35_StairTry(s,270,gx+9,gy,gz+8,1,1);
   Level_setTileAndData(l,gx+6,gy+2,gz+10,1,0,3);I32 m4=MC35_StairTry(s,0,gx+6,gy+2,gz+10,2,0.75),m5=MC35_StairTry(s,0,gx+6,gy+2,gz+10,0,0.0);
   printf("TEST035 stair-place yaw0=%d yaw90=%d yaw180=%d yaw270=%d side-high=%d bottom=%d\n",m0,m1,m2,m3,m4,m5);
   // straight flight going +z, plus outer/inner corners and an upside-down row
   Level_setTileAndData(l,gx,gy+1,gz+3,53,2,3);Level_setTileAndData(l,gx,gy+1,gz+4,4,0,3);Level_setTileAndData(l,gx,gy+2,gz+4,67,2,3);Level_setTileAndData(l,gx,gy+1,gz+5,4,0,3);Level_setTileAndData(l,gx,gy+2,gz+5,4,0,3);
   Level_setTileAndData(l,gx-3,gy+1,gz+4,53,2,3);Level_setTileAndData(l,gx-4,gy+1,gz+4,53,2,3);Level_setTileAndData(l,gx-4,gy+1,gz+3,53,1,3);
   Level_setTileAndData(l,gx+3,gy+1,gz+4,108,2,3);Level_setTileAndData(l,gx+4,gy+1,gz+4,108,2,3);Level_setTileAndData(l,gx+4,gy+1,gz+3,108,0,3);
   Level_setTileAndData(l,gx-2,gy+2,gz+7,109,6,3);Level_setTileAndData(l,gx-1,gy+2,gz+7,109,6,3);Level_setTileAndData(l,gx+1,gy+1,gz+7,128,3,3);Level_setTileAndData(l,gx+2,gy+1,gz+7,156,1,3);
   I32 k;for(k=-1;k<=1;k++)MC028_Dirty(s,gx+k*5,gy+1,gz+5);
   printf("TEST035 stair-boxes straight=%d outer=%d inner=%d upside=%d full=%d\n",MC35_StairBoxN(s,gx,gy+1,gz+3),MC35_StairBoxN(s,gx-4,gy+1,gz+3),MC35_StairBoxN(s,gx+4,gy+1,gz+4),MC35_StairBoxN(s,gx-2,gy+2,gz+7),MC35_StairBoxN(s,gx,gy+1,gz+4));
   Entity_moveTo(&p->mob.entity,gx+0.5,gy+1+1.62,gz+1.5,0,0);b->prevX=b->x;b->prevY=b->y;b->prevZ=b->z;g35_stairMaxY=0;MC35_DLook(s,0,0);}
 if(t>8 && t<60){b->motionZ=0.15;F32 fy=p->mob.entity.box.minY-gy-1;if(fy>g35_stairMaxY)g35_stairMaxY=fy;}
 if(t==60)printf("TEST035 stair-climb feet=%.2f z=%.2f\n",g35_stairMaxY,b->z-gz);
 if(t==61){Entity_moveTo(&p->mob.entity,gx+0.5,gy+3+1.62,gz-1.5,0,0);b->prevX=b->x;b->prevY=b->y;b->prevZ=b->z;b->motionX=0;b->motionY=0;b->motionZ=0;MC35_DLook(s,0,30);}
 if(t>61){b->motionX=0;b->motionZ=0;}
 if(t==150){Level_setTileAndData(l,gx-1,gy+1,gz+1,51,0,3);Level_setTileAndData(l,gx+2,gy+1,gz+2,5,0,3);Level_setTileAndData(l,gx+2,gy+2,gz+2,5,0,3);Level_setTileAndData(l,gx+2,gy+3,gz+1,0,0,3);Level_setTileAndData(l,gx+1,gy+2,gz+2,51,0,3);Level_setTileAndData(l,gx+1,gy+1,gz+2,0,0,3);MC028_Dirty(s,gx,gy+1,gz+1);}}
// MCPE_PROBE035=x,y,z prints the same block checksum as the original-build test harness (HX probe)
U0 MC035_Probe(MCApp028 *s){U8 *e=C31_getenv("MCPE_PROBE035");if(!e)return;I32 v[3],n=0,sign=1,cur=0;Bool dig=FALSE;U8 *q=e;
 while(n<3){U8 c=*q;if(c=='-')sign=-1;else if(c>='0' && c<='9'){cur=cur*10+c-'0';dig=TRUE;}else{if(dig){v[n++]=cur*sign;}cur=0;sign=1;dig=FALSE;if(!c)break;}q++;}
 if(n<3)return;I64 sum=0;I32 dx,dz,yy;for(dx=-8;dx<=8;dx++)for(dz=-8;dz<=8;dz++)for(yy=0;yy<128;yy++)sum+=Level_getTile(&s->level,v[0]+dx,yy,v[2]+dz)*(yy+1)+Level_getData(&s->level,v[0]+dx,yy,v[2]+dz);
 printf("PROBE035 %d,%d,%d sum=%d\n",v[0],v[1],v[2],sum);}
// TileRenderer::tesselateCactusInWorld: flat-lit cube whose side faces are pulled in by 1/16
U0 MC035_TessCactus(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z){TileRenderer *t=&s->tiler;F32 l;F32 o=0.0625;
 if(MC028_FaceVisible(s,v,x,y-1,z,0)){l=MC028_Brightness(s,x,y-1,z)*0.5;MC027_Color(t,l,l,l);TileRenderer_renderFaceDown(t,v,x,y,z,&v->uv[0]);}
 if(MC028_FaceVisible(s,v,x,y+1,z,1)){l=MC028_Brightness(s,x,y+1,z);MC027_Color(t,l,l,l);TileRenderer_renderFaceUp(t,v,x,y,z,&v->uv[1]);}
 if(MC028_FaceVisible(s,v,x,y,z-1,2)){l=MC028_Brightness(s,x,y,z-1)*0.8;MC027_Color(t,l,l,l);TileRenderer_renderNorth(t,v,x,y,z+o,&v->uv[2]);}
 if(MC028_FaceVisible(s,v,x,y,z+1,3)){l=MC028_Brightness(s,x,y,z+1)*0.8;MC027_Color(t,l,l,l);TileRenderer_renderSouth(t,v,x,y,z-o,&v->uv[3]);}
 if(MC028_FaceVisible(s,v,x-1,y,z,4)){l=MC028_Brightness(s,x-1,y,z)*0.6;MC027_Color(t,l,l,l);TileRenderer_renderWest(t,v,x+o,y,z,&v->uv[4]);}
 if(MC028_FaceVisible(s,v,x+1,y,z,5)){l=MC028_Brightness(s,x+1,y,z)*0.6;MC027_Color(t,l,l,l);TileRenderer_renderEast(t,v,x-o,y,z,&v->uv[5]);}}
// FireTile has no getTexture override, so every face uses variant 0.
// TileRenderer::tesselateFireInWorld: tall slanted flame planes (on the ground) or flames clinging to burnable neighbours
Bool MC35_FireBurn(MCApp028 *s,I32 x,I32 y,I32 z){return FireTile_canBurn(&s->fire,&s->level,x,y,z);}
U0 MC035_TessFire(MCApp028 *s,I32 x,I32 y,I32 z){TileRenderer *t=&s->tiler;TextureUVCoordinateSet a,c;MC028_UV(&a,142,0);c=a;MC027_Color(t,1,1,1);
 F32 u0=a.minX,v0=a.minY,u1=a.maxX,v1=a.maxY,fx=x,fy=y,fz=z;I32 bid=Level_getTile(&s->level,x,y-1,z);MCTileDef023 *bd=&s->catalog.registry.tiles[bid];
 if((bid && bd->cube && bd->solid && bd->opacity==255) || MC35_FireBurn(s,x,y-1,z)){
  F32 zc=fz+0.5,xc=fx+0.5,z1=fz+1,z0=fz,top=fy+1.4,bot=fy,x1=fx+1,x0=fx;F32 cu0=c.minX,cv0=c.minY,cu1=c.maxX,cv1=c.maxY;
  MC027_Vertex(t,xc-0.3,top,z1,u1,v0);MC027_Vertex(t,xc+0.2,bot,z1,u1,v1);MC027_Vertex(t,xc+0.2,bot,z0,u0,v1);MC027_Vertex(t,xc-0.3,top,z0,u0,v0);
  MC027_Vertex(t,xc+0.3,top,z0,u1,v0);MC027_Vertex(t,xc-0.2,bot,z0,u1,v1);MC027_Vertex(t,xc-0.2,bot,z1,u0,v1);MC027_Vertex(t,xc+0.3,top,z1,u0,v0);
  MC027_Vertex(t,x1,top,zc+0.3,cu1,cv0);MC027_Vertex(t,x1,bot,zc-0.2,cu1,cv1);MC027_Vertex(t,x0,bot,zc-0.2,cu0,cv1);MC027_Vertex(t,x0,top,zc+0.3,cu0,cv0);
  MC027_Vertex(t,x0,top,zc-0.3,cu1,cv0);MC027_Vertex(t,x0,bot,zc+0.2,cu1,cv1);MC027_Vertex(t,x1,bot,zc+0.2,cu0,cv1);MC027_Vertex(t,x1,top,zc-0.3,cu0,cv0);
  MC027_Vertex(t,xc-0.4,top,z0,cu0,cv0);MC027_Vertex(t,xc-0.5,bot,z0,cu0,cv1);MC027_Vertex(t,xc-0.5,bot,z1,cu1,cv1);MC027_Vertex(t,xc-0.4,top,z1,cu1,cv0);
  MC027_Vertex(t,xc+0.4,top,z1,cu0,cv0);MC027_Vertex(t,xc+0.5,bot,z1,cu0,cv1);MC027_Vertex(t,xc+0.5,bot,z0,cu1,cv1);MC027_Vertex(t,xc+0.4,top,z0,cu1,cv0);
  MC027_Vertex(t,x0,top,zc+0.4,u0,v0);MC027_Vertex(t,x0,bot,zc+0.5,u0,v1);MC027_Vertex(t,x1,bot,zc+0.5,u1,v1);MC027_Vertex(t,x1,top,zc+0.4,u1,v0);
  MC027_Vertex(t,x1,top,zc-0.4,u0,v0);MC027_Vertex(t,x1,bot,zc-0.5,u0,v1);MC027_Vertex(t,x0,bot,zc-0.5,u1,v1);MC027_Vertex(t,x0,top,zc-0.4,u1,v0);return;}
 if((x+y+z)&1){u0=c.minX;v0=c.minY;u1=c.maxX;v1=c.maxY;}
 if((y/2+x/2+z/2)&1){F32 sw=u0;u0=u1;u1=sw;}
 F32 hi=fy+1.4+0.0625,lo=fy+0.0625;
 if(MC35_FireBurn(s,x-1,y,z)){MC027_Vertex(t,fx+0.2,hi,fz+1,u1,v0);MC027_Vertex(t,fx,lo,fz+1,u1,v1);MC027_Vertex(t,fx,lo,fz,u0,v1);MC027_Vertex(t,fx+0.2,hi,fz,u0,v0);
  MC027_Vertex(t,fx+0.2,hi,fz,u0,v0);MC027_Vertex(t,fx,lo,fz,u0,v1);MC027_Vertex(t,fx,lo,fz+1,u1,v1);MC027_Vertex(t,fx+0.2,hi,fz+1,u1,v0);}
 if(MC35_FireBurn(s,x+1,y,z)){F32 xr=fx+1;MC027_Vertex(t,xr-0.2,hi,fz,u0,v0);MC027_Vertex(t,xr,lo,fz,u0,v1);MC027_Vertex(t,xr,lo,fz+1,u1,v1);MC027_Vertex(t,xr-0.2,hi,fz+1,u1,v0);
  MC027_Vertex(t,xr-0.2,hi,fz+1,u1,v0);MC027_Vertex(t,xr,lo,fz+1,u1,v1);MC027_Vertex(t,xr,lo,fz,u0,v1);MC027_Vertex(t,xr-0.2,hi,fz,u0,v0);}
 if(MC35_FireBurn(s,x,y,z-1)){MC027_Vertex(t,fx,hi,fz+0.2,u1,v0);MC027_Vertex(t,fx,lo,fz,u1,v1);MC027_Vertex(t,fx+1,lo,fz,u0,v1);MC027_Vertex(t,fx+1,hi,fz+0.2,u0,v0);
  MC027_Vertex(t,fx+1,hi,fz+0.2,u0,v0);MC027_Vertex(t,fx+1,lo,fz,u0,v1);MC027_Vertex(t,fx,lo,fz,u1,v1);MC027_Vertex(t,fx,hi,fz+0.2,u1,v0);}
 if(MC35_FireBurn(s,x,y,z+1)){F32 zr=fz+1;MC027_Vertex(t,fx+1,hi,zr-0.2,u0,v0);MC027_Vertex(t,fx+1,lo,zr,u0,v1);MC027_Vertex(t,fx,lo,zr,u1,v1);MC027_Vertex(t,fx,hi,zr-0.2,u1,v0);
  MC027_Vertex(t,fx,hi,zr-0.2,u1,v0);MC027_Vertex(t,fx,lo,zr,u1,v1);MC027_Vertex(t,fx+1,lo,zr,u0,v1);MC027_Vertex(t,fx+1,hi,zr-0.2,u0,v0);}
 if(MC35_FireBurn(s,x,y+1,z)){I32 y1=y+1;F32 fy1=y1,au0=a.minX,av0=a.minY,au1=a.maxX,av1=a.maxY,bu0=c.minX,bv0=c.minY,bu1=c.maxX,bv1=c.maxY;
  if((x+y1+z)&1){F32 zc=fz+0.5,l2=fy1-0.2;
   MC027_Vertex(t,fx,l2,zc+0.5,au1,av0);MC027_Vertex(t,fx,fy1,zc-0.5,au1,av1);MC027_Vertex(t,fx+1,fy1,zc-0.5,au0,av1);MC027_Vertex(t,fx+1,l2,zc+0.5,au0,av0);
   MC027_Vertex(t,fx+1,l2,zc-0.5,bu1,bv0);MC027_Vertex(t,fx+1,fy1,zc+0.5,bu1,bv1);MC027_Vertex(t,fx,fy1,zc+0.5,bu0,bv1);MC027_Vertex(t,fx,l2,zc-0.5,bu0,bv0);}
  else{F32 xa=fx,xb=fx+1;
   MC027_Vertex(t,xa,fy1-0.2,fz,au1,av0);MC027_Vertex(t,xb,fy1,fz,au1,av1);MC027_Vertex(t,xb,fy1,fz+1,au0,av1);MC027_Vertex(t,xa,fy1-0.2,fz+1,au0,av0);
   MC027_Vertex(t,xb,fy1-0.2,fz+1,bu1,bv0);MC027_Vertex(t,xa,fy1,fz+1,bu1,bv1);MC027_Vertex(t,xa,fy1,fz,bu0,bv1);MC027_Vertex(t,xb,fy1-0.2,fz,bu0,bv0);}}}
// FireTexture (DynamicTexture on fire variant 0): 16x20 heat field rising from a random bottom row
F32 g35_fCur[320],g35_fNext[320];U8 g35_fPix[1024];U32 g35_fRand=0x1234567;
U32 MC35_FRand(){g35_fRand^=g35_fRand<<13;g35_fRand^=g35_fRand>>17;g35_fRand^=g35_fRand<<5;return g35_fRand;}
U0 MC35_FireTexTick(){I32 row,col,i,j;for(row=0;row<20;row++)for(col=0;col<16;col++){F32 v=g35_fCur[((row+1)%20)*16+col]*18.0;
  for(i=0;i<2;i++)for(j=0;j<3;j++){I32 c=col-1+j;if(c!=-1 && c!=16 && i+row!=20)v+=g35_fCur[(row+i)*16+c];}
  g35_fNext[row*16+col]=v/25.2;
  if(row==19){U32 r=MC35_FRand();g35_fNext[row*16+col]=((r>>24)&255)*0.0039062*0.1+(r&255)*0.0039062*(((r>>8)&255)*0.0039062)*(((r>>16)&255)*0.0039062)*4.0+0.2;}}
 for(i=0;i<320;i++){F32 t=g35_fCur[i];g35_fCur[i]=g35_fNext[i];g35_fNext[i]=t;}
 for(i=0;i<256;i++){F32 f=g35_fCur[i]*1.8;if(f>1)f=1;else if(f<0)f=0;F32 f2=f*f;g35_fPix[i*4]=f*155+100;g35_fPix[i*4+1]=f2*255;g35_fPix[i*4+2]=f2*f2*f2*f2*f2*255;g35_fPix[i*4+3]=0;if(f>=0.5)g35_fPix[i*4+3]=255;}}
U0 MC35_FireTexUpload(MCApp028 *s){TextureUVCoordinateSet uv;MC028_UV(&uv,142,0);G35_TexSubImage2D(0xDE1,0,uv.minX*uv.width+0.5,uv.minY*uv.height+0.5,16,16,0x1908,0x1401,g35_fPix);}
