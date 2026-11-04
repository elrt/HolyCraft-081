// Batch035: TileRenderer::tesselateBlockInWorldWithAmbienceOcclusion (0.8.1 renders every plain cube this way;
// tesselateBlockInWorld(tile,x,y,z) always forwards here). Per-vertex colours go through the already ported
// renderFace*/renderNorth.. enableAO branches (XeYs,XsYs,XsYe,XeYe order).
Bool g35_transOk;Bool g35_trans[256];
U0 MC35_TransInit(MCApp028 *s){I32 i;for(i=0;i<256;i++){Material *m=s->catalog.tiles[i].material;if(i==0 || m==NULL)g35_trans[i]=i==0;else g35_trans[i]=!Material_blocksLight(m);}g35_transOk=TRUE;}
I32 MC35_RawLight(MCApp028 *s,I32 x,I32 y,I32 z,Bool complex){
 if(complex){I32 id=Level_getTile(&s->level,x,y,z);if(id==44 || id==60 || id==158){I32 a=MC35_RawLight(s,x,y+1,z,FALSE),b=MC35_RawLight(s,x+1,y,z,FALSE),c=MC35_RawLight(s,x-1,y,z,FALSE),d=MC35_RawLight(s,x,y,z+1,FALSE),e=MC35_RawLight(s,x,y,z-1,FALSE);
   if(b>a)a=b;if(c>a)a=c;if(d>a)a=d;if(e>a)a=e;return a;}}
 if(y<0)return 0;I32 top=15-g33_skyDarken;if(top<0)top=0;if(y>127)return top;
 LevelChunk *c=Level_getChunk(&s->level,x>>4,z>>4,FALSE);if(!c)return top;I32 sky=DataLayer_get(&c->skyLight,x&15,y,z&15)-g33_skyDarken,bl=DataLayer_get(&c->blockLight,x&15,y,z&15);if(sky>bl)bl=sky;if(bl<0)bl=0;if(bl>15)bl=15;return bl;}
F32 MC35_B(MCApp028 *s,I32 x,I32 y,I32 z){return g33_ramp[MC35_RawLight(s,x,y,z,TRUE)];}
Bool MC35_T(MCApp028 *s,I32 x,I32 y,I32 z){return g35_trans[Level_getTile(&s->level,x,y,z)&255];}
// base[i]*corner, corners given in renderer order XeYs,XsYs,XsYe,XeYe
U0 MC35_AOSet(TileRenderer *t,F32 r,F32 g,F32 b,F32 c0,F32 c1,F32 c2,F32 c3){t->redXeYs=r*c0;t->greenXeYs=g*c0;t->blueXeYs=b*c0;t->redXsYs=r*c1;t->greenXsYs=g*c1;t->blueXsYs=b*c1;t->redXsYe=r*c2;t->greenXsYe=g*c2;t->blueXsYe=b*c2;t->redXeYe=r*c3;t->greenXeYe=g*c3;t->blueXeYe=b*c3;}
U0 MC035_TessCubeAO(MCApp028 *s,MCRenderTile027 *v,I32 x,I32 y,I32 z){if(!g35_transOk)MC35_TransInit(s);TileRenderer *t=&s->tiler;
 F32 r=((v->color>>16)&255)/255.0,g=((v->color>>8)&255)/255.0,b=(v->color&255)/255.0;Bool tint=v->id!=2;F32 br,bg,bb;
 F32 bxn,bxp,bzn,bzp,byn,byp,c1,c2,c3,c4,m,a0,a1,a2,a3;Bool xp,xn,zp,zn,yp,yn;I32 yy;
 t->enableAO=TRUE;
 if(MC028_FaceVisible(s,v,x,y-1,z,0)){yy=y-1;xp=MC35_T(s,x+1,yy,z);xn=MC35_T(s,x-1,yy,z);zp=MC35_T(s,x,yy,z+1);zn=MC35_T(s,x,yy,z-1);
  bxn=MC35_B(s,x-1,yy,z);bzn=MC35_B(s,x,yy,z-1);bzp=MC35_B(s,x,yy,z+1);bxp=MC35_B(s,x+1,yy,z);
  c1=bxn;if(zn || xn)c1=MC35_B(s,x-1,yy,z-1);c2=bxn;if(zp || xn)c2=MC35_B(s,x-1,yy,z+1);c3=bxp;if(zn || xp)c3=MC35_B(s,x+1,yy,z-1);c4=bxp;if(zp || xp)c4=MC35_B(s,x+1,yy,z+1);m=MC35_B(s,x,yy,z);
  a0=(c2+bxn+bzp+m)*0.25;a1=(bzp+m+c4+bxp)*0.25;a2=(m+bzn+bxp+c3)*0.25;a3=(bxn+c1+m+bzn)*0.25;
  br=0.5;bg=0.5;bb=0.5;if(tint){br=r*0.5;bg=g*0.5;bb=b*0.5;}MC35_AOSet(t,br,bg,bb,a0,a3,a2,a1);TileRenderer_renderFaceDown(t,v,x,y,z,&v->uv[0]);}
 if(MC028_FaceVisible(s,v,x,y+1,z,1)){yy=y+1;xp=MC35_T(s,x+1,yy,z);xn=MC35_T(s,x-1,yy,z);zp=MC35_T(s,x,yy,z+1);zn=MC35_T(s,x,yy,z-1);
  bxn=MC35_B(s,x-1,yy,z);bxp=MC35_B(s,x+1,yy,z);bzn=MC35_B(s,x,yy,z-1);bzp=MC35_B(s,x,yy,z+1);
  c1=bxn;if(zn || xn)c1=MC35_B(s,x-1,yy,z-1);c2=bxp;if(zn || xp)c2=MC35_B(s,x+1,yy,z-1);c3=bxn;if(zp || xn)c3=MC35_B(s,x-1,yy,z+1);c4=bxp;if(zp || xp)c4=MC35_B(s,x+1,yy,z+1);m=MC35_B(s,x,yy,z);
  a0=(bzp+m+c4+bxp)*0.25;a1=(bxn+c1+m+bzn)*0.25;a2=(m+bzn+bxp+c2)*0.25;a3=(c3+bxn+bzp+m)*0.25;
  MC35_AOSet(t,r,g,b,a0,a2,a1,a3);TileRenderer_renderFaceUp(t,v,x,y,z,&v->uv[1]);}
 if(MC028_FaceVisible(s,v,x,y,z-1,2)){I32 zz=z-1;xp=MC35_T(s,x+1,y,zz);xn=MC35_T(s,x-1,y,zz);yp=MC35_T(s,x,y+1,zz);yn=MC35_T(s,x,y-1,zz);
  bxn=MC35_B(s,x-1,y,zz);byn=MC35_B(s,x,y-1,zz);byp=MC35_B(s,x,y+1,zz);bxp=MC35_B(s,x+1,y,zz);
  c1=bxn;if(xn || yn)c1=MC35_B(s,x-1,y-1,zz);c2=bxn;if(xn || yp)c2=MC35_B(s,x-1,y+1,zz);c3=bxp;if(xp || yn)c3=MC35_B(s,x+1,y-1,zz);c4=bxp;if(xp || yp)c4=MC35_B(s,x+1,y+1,zz);m=MC35_B(s,x,y,zz);
  a0=(bxn+c2+m+byp)*0.25;a1=(m+byp+bxp+c4)*0.25;a2=(byn+m+c3+bxp)*0.25;a3=(c1+bxn+byn+m)*0.25;
  br=0.8;bg=0.8;bb=0.8;if(tint){br=r*0.8;bg=g*0.8;bb=b*0.8;}MC35_AOSet(t,br,bg,bb,a0,a1,a2,a3);TileRenderer_renderNorth(t,v,x,y,z,&v->uv[2]);}
 if(MC028_FaceVisible(s,v,x,y,z+1,3)){I32 zz=z+1;xp=MC35_T(s,x+1,y,zz);xn=MC35_T(s,x-1,y,zz);yp=MC35_T(s,x,y+1,zz);yn=MC35_T(s,x,y-1,zz);
  bxn=MC35_B(s,x-1,y,zz);bxp=MC35_B(s,x+1,y,zz);byn=MC35_B(s,x,y-1,zz);byp=MC35_B(s,x,y+1,zz);
  c1=bxn;if(xn || yn)c1=MC35_B(s,x-1,y-1,zz);c2=bxn;if(xn || yp)c2=MC35_B(s,x-1,y+1,zz);c3=bxp;if(xp || yn)c3=MC35_B(s,x+1,y-1,zz);c4=bxp;if(xp || yp)c4=MC35_B(s,x+1,y+1,zz);m=MC35_B(s,x,y,zz);
  a0=(bxn+c2+m+byp)*0.25;a1=(m+byp+bxp+c4)*0.25;a2=(byn+m+c3+bxp)*0.25;a3=(c1+bxn+byn+m)*0.25;
  br=0.8;bg=0.8;bb=0.8;if(tint){br=r*0.8;bg=g*0.8;bb=b*0.8;}MC35_AOSet(t,br,bg,bb,a0,a3,a2,a1);TileRenderer_renderSouth(t,v,x,y,z,&v->uv[3]);}
 if(MC028_FaceVisible(s,v,x-1,y,z,4)){I32 xx=x-1;yp=MC35_T(s,xx,y+1,z);yn=MC35_T(s,xx,y-1,z);zn=MC35_T(s,xx,y,z-1);zp=MC35_T(s,xx,y,z+1);
  byn=MC35_B(s,xx,y-1,z);bzn=MC35_B(s,xx,y,z-1);bzp=MC35_B(s,xx,y,z+1);byp=MC35_B(s,xx,y+1,z);
  c1=bzn;if(zn || yn)c1=MC35_B(s,xx,y-1,z-1);c2=bzp;if(zp || yn)c2=MC35_B(s,xx,y-1,z+1);c3=bzn;if(zn || yp)c3=MC35_B(s,xx,y+1,z-1);c4=bzp;if(zp || yp)c4=MC35_B(s,xx,y+1,z+1);m=MC35_B(s,xx,y,z);
  a0=(byn+c2+m+bzp)*0.25;a1=(m+bzp+byp+c4)*0.25;a2=(bzn+m+c3+byp)*0.25;a3=(c1+byn+bzn+m)*0.25;
  br=0.6;bg=0.6;bb=0.6;if(tint){br=r*0.6;bg=g*0.6;bb=b*0.6;}MC35_AOSet(t,br,bg,bb,a1,a2,a3,a0);TileRenderer_renderWest(t,v,x,y,z,&v->uv[4]);}
 if(MC028_FaceVisible(s,v,x+1,y,z,5)){I32 xx=x+1;yp=MC35_T(s,xx,y+1,z);yn=MC35_T(s,xx,y-1,z);zp=MC35_T(s,xx,y,z+1);zn=MC35_T(s,xx,y,z-1);
  byn=MC35_B(s,xx,y-1,z);bzn=MC35_B(s,xx,y,z-1);bzp=MC35_B(s,xx,y,z+1);byp=MC35_B(s,xx,y+1,z);
  c1=bzn;if(yn || zn)c1=MC35_B(s,xx,y-1,z-1);c2=bzp;if(yn || zp)c2=MC35_B(s,xx,y-1,z+1);c3=bzn;if(yp || zn)c3=MC35_B(s,xx,y+1,z-1);c4=bzp;if(yp || zp)c4=MC35_B(s,xx,y+1,z+1);m=MC35_B(s,xx,y,z);
  a0=(byn+c2+m+bzp)*0.25;a1=(m+bzp+byp+c4)*0.25;a2=(bzn+m+c3+byp)*0.25;a3=(c1+byn+bzn+m)*0.25;
  br=0.6;bg=0.6;bb=0.6;if(tint){br=r*0.6;bg=g*0.6;bb=b*0.6;}MC35_AOSet(t,br,bg,bb,a0,a3,a2,a1);TileRenderer_renderEast(t,v,x,y,z,&v->uv[5]);}
 t->enableAO=FALSE;}
