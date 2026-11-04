// Batch036: block breaking feedback of MCPE 0.8.1.
// LevelRenderer::renderHit (destroy_stage_x crack overlay, multiplied over the block while mining),
// ParticleEngine::crack (one TerrainParticle per mining tick on the hit face, setPower(0.2)->scale(0.6))
// and ParticleEngine::destroy (3x3x3 TerrainParticles when the block breaks, from GameMode::destroyBlock).
class MC36Part {F32 x,y,z,px,py,pz,mx,my,mz,size,r,g,b,u0,v0,u1,v1;I32 age,life;};
#define MC36_MAX 1024
MC36Part g36_p[MC36_MAX];
F32 MC36_R(){return MC31_Rand();}
MC36Part *MC36_Add(MCApp028 *s,I32 id,I32 meta,F32 x,F32 y,F32 z,F32 mx,F32 my,F32 mz){
 if(id<1 || id>255 || g36_n>=MC36_MAX)return NULL;MCRenderTile027 *v=&s->catalog.views[id];if(!v->base)return NULL;MC028_View(&s->catalog,id,meta);
 MC36Part *p=&g36_p[g36_n++];memset(p,0,sizeof(MC36Part));p->x=x;p->y=y;p->z=z;p->px=x;p->py=y;p->pz=z;
 // Particle::Particle: random spread, normalised to speed (rand+rand+1)*0.15*0.4, +0.1 up
 F32 bx=mx+(MC36_R()*2-1)*0.4,by=my+(MC36_R()*2-1)*0.4,bz=mz+(MC36_R()*2-1)*0.4,sp=(MC36_R()+MC36_R()+1)*0.15,d=sqrt(bx*bx+by*by+bz*bz);if(d<1.0e-4)d=1;
 p->mx=bx/d*sp*0.4;p->my=by/d*sp*0.4+0.1;p->mz=bz/d*sp*0.4;
 p->size=0.1*(MC36_R()*0.5+0.5)*2*0.5;p->life=4/(MC36_R()*0.9+0.1);
 // TerrainParticle: rgb 0.6, tinted by the tile colour except grass; texture = bottom face, random 1/4 sub-square
 p->r=0.6;p->g=0.6;p->b=0.6;if(id!=2){p->r*=((v->color>>16)&255)/255.0;p->g*=((v->color>>8)&255)/255.0;p->b*=(v->color&255)/255.0;}
 TextureUVCoordinateSet *t=&v->uv[0];F32 du=(t->maxX-t->minX)*0.25,dv=(t->maxY-t->minY)*0.25;p->u0=t->minX+MC36_R()*3*du;p->v0=t->minY+MC36_R()*3*dv;p->u1=p->u0+du;p->v1=p->v0+dv;
 return p;}
U0 MC036_Destroy(MCApp028 *s,I32 x,I32 y,I32 z,I32 id,I32 meta){I32 i,j,k;for(i=0;i<3;i++)for(j=0;j<3;j++)for(k=0;k<3;k++){F32 xx=x+(i+0.5)/3.0,yy=y+(j+0.5)/3.0,zz=z+(k+0.5)/3.0;MC36_Add(s,id,meta,xx,yy,zz,(xx-x-0.5)*2,(yy-y-0.5)*2,(zz-z-0.5)*2);}}
U0 MC036_Crack(MCApp028 *s,I32 x,I32 y,I32 z,I32 face){I32 id=Level_getTile(&s->level,x,y,z);if(id<1)return;AABB box;if(!MC032_Box(s,id,x,y,z,FALSE,&box))Tile_getAABB(&s->catalog.tiles[id],x,y,z,&box);
 F32 xx=box.minX+0.1+MC36_R()*(box.maxX-box.minX-0.2),yy=box.minY+0.1+MC36_R()*(box.maxY-box.minY-0.2),zz=box.minZ+0.1+MC36_R()*(box.maxZ-box.minZ-0.2);
 if(face==0)yy=box.minY-0.1;if(face==1)yy=box.maxY+0.1;if(face==2)zz=box.minZ-0.1;if(face==3)zz=box.maxZ+0.1;if(face==4)xx=box.minX-0.1;if(face==5)xx=box.maxX+0.1;
 MC36Part *p=MC36_Add(s,id,Level_getData(&s->level,x,y,z),xx,yy,zz,0,0,0);if(p==NULL)return;p->mx*=0.2;p->my=(p->my-0.1)*0.2+0.1;p->mz*=0.2;p->size*=0.6;}
U0 MC036_Tick(MCApp028 *s){I32 i,j=0;for(i=0;i<g36_n;i++){MC36Part *p=&g36_p[i];p->px=p->x;p->py=p->y;p->pz=p->z;p->age++;if(p->age>=p->life)continue;p->my-=0.04;
  F32 ny=p->y+p->my;Bool ground=FALSE;if(!MC31_Solid(MC31_Tile(floorf(p->x),floorf(ny),floorf(p->z))))p->y=ny;else {if(p->my<0)ground=TRUE;p->my=0;}
  F32 nx=p->x+p->mx;if(!MC31_Solid(MC31_Tile(floorf(nx),floorf(p->y),floorf(p->z))))p->x=nx;else p->mx=0;
  F32 nz=p->z+p->mz;if(!MC31_Solid(MC31_Tile(floorf(p->x),floorf(p->y),floorf(nz))))p->z=nz;else p->mz=0;
  p->mx*=0.98;p->my*=0.98;p->mz*=0.98;if(ground){p->mx*=0.7;p->mz*=0.7;}if(j!=i)g36_p[j]=g36_p[i];j++;}g36_n=j;}
U0 MC036_Render(MCApp028 *s,F32 pt){if(!g36_n)return;F32 *mv=s->camera.modelViewMat;F32 rx=mv[0],ry=mv[4],rz=mv[8],ux=mv[1],uy=mv[5],uz=mv[9];I32 i;
 hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,s->terrainTex);hcgl028_glDisable(0xBE2);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.1);hcgl028_glDepthMask(1);hcgl028_glBegin(7);
 for(i=0;i<g36_n;i++){MC36Part *p=&g36_p[i];F32 x=p->px+(p->x-p->px)*pt,y=p->py+(p->y-p->py)*pt,z=p->pz+(p->z-p->pz)*pt,sz=p->size,l=MC31_Bright(floorf(x),floorf(y),floorf(z));
  hcgl028_glColor4f(p->r*l,p->g*l,p->b*l,1);
  hcgl028_glTexCoord2f(p->u0,p->v1);hcgl028_glVertex3f(x-rx*sz-ux*sz,y-ry*sz-uy*sz,z-rz*sz-uz*sz);
  hcgl028_glTexCoord2f(p->u0,p->v0);hcgl028_glVertex3f(x-rx*sz+ux*sz,y-ry*sz+uy*sz,z-rz*sz+uz*sz);
  hcgl028_glTexCoord2f(p->u1,p->v0);hcgl028_glVertex3f(x+rx*sz+ux*sz,y+ry*sz+uy*sz,z+rz*sz+uz*sz);
  hcgl028_glTexCoord2f(p->u1,p->v1);hcgl028_glVertex3f(x+rx*sz-ux*sz,y+ry*sz-uy*sz,z+rz*sz-uz*sz);}
 hcgl028_glEnd();hcgl028_glColor4f(1,1,1,1);}
U0 MC36_Q(F32 ax,F32 ay,F32 az,F32 bx,F32 by,F32 bz,F32 cx,F32 cy,F32 cz,F32 dx,F32 dy,F32 dz,TextureUVCoordinateSet *t){
 hcgl028_glTexCoord2f(t->minX,t->minY);hcgl028_glVertex3f(ax,ay,az);hcgl028_glTexCoord2f(t->minX,t->maxY);hcgl028_glVertex3f(bx,by,bz);hcgl028_glTexCoord2f(t->maxX,t->maxY);hcgl028_glVertex3f(cx,cy,cz);hcgl028_glTexCoord2f(t->maxX,t->minY);hcgl028_glVertex3f(dx,dy,dz);}
U0 MC036_RenderCrack(MCApp028 *s,F32 pt){if(s->creative || !s->mining)return;GameMode *g=&s->minecraft.survival;if(g->progress<=0)return;F32 p=g->previousProgress+(g->progress-g->previousProgress)*pt;I32 stage=p*10;if(stage<0)stage=0;if(stage>9)stage=9;
 I32 x=s->mineX,y=s->mineY,z=s->mineZ,id=Level_getTile(&s->level,x,y,z);if(id<1)return;AABB b;if(!MC032_Box(s,id,x,y,z,FALSE,&b))Tile_getAABB(&s->catalog.tiles[id],x,y,z,&b);
 TextureUVCoordinateSet t;MC028_UV(&t,136,stage);
 hcgl028_glEnable(0xDE1);hcgl028_glBindTexture(0xDE1,s->terrainTex);hcgl028_glEnable(0xBC0);hcgl028_glAlphaFunc(0x204,0.1);hcgl028_glEnable(0xBE2);hcgl028_glBlendFunc(0x306,0);hcgl028_glDepthMask(0);hcgl028_glEnable(0x8037);G31_PolygonOffset(-3,-3);hcgl028_glColor4f(1,1,1,1);hcgl028_glBegin(7);
 MC36_Q(b.minX,b.minY,b.maxZ,b.minX,b.minY,b.minZ,b.maxX,b.minY,b.minZ,b.maxX,b.minY,b.maxZ,&t);
 MC36_Q(b.minX,b.maxY,b.minZ,b.minX,b.maxY,b.maxZ,b.maxX,b.maxY,b.maxZ,b.maxX,b.maxY,b.minZ,&t);
 MC36_Q(b.maxX,b.maxY,b.minZ,b.maxX,b.minY,b.minZ,b.minX,b.minY,b.minZ,b.minX,b.maxY,b.minZ,&t);
 MC36_Q(b.minX,b.maxY,b.maxZ,b.minX,b.minY,b.maxZ,b.maxX,b.minY,b.maxZ,b.maxX,b.maxY,b.maxZ,&t);
 MC36_Q(b.minX,b.maxY,b.minZ,b.minX,b.minY,b.minZ,b.minX,b.minY,b.maxZ,b.minX,b.maxY,b.maxZ,&t);
 MC36_Q(b.maxX,b.maxY,b.maxZ,b.maxX,b.minY,b.maxZ,b.maxX,b.minY,b.minZ,b.maxX,b.maxY,b.minZ,&t);
 hcgl028_glEnd();G31_PolygonOffset(0,0);hcgl028_glDisable(0x8037);hcgl028_glDepthMask(1);hcgl028_glBlendFunc(0x302,0x303);hcgl028_glDisable(0xBE2);}
U0 MC036_Clear(){g36_n=0;}
// ---- crash report: on SIGSEGV/SIGBUS/SIGFPE/SIGILL print RIP + the frame-pointer chain (hcc keeps rbp frames).
// Addresses resolve with `nm -n bin/mcpe-holyc` (non-PIE executable); also written to crash.log.
_extern sigaction I32 C36_sigaction(I32,U8*,U8*);
_extern _exit U0 C36_exit(I32);
_extern write I64 C36_write(I32,U8*,I64);
_extern open I32 C36_open(U8*,I32,I32);
I32 g36_crashFd=-1;
U0 MC36_Out(U8 *s){I64 n=strlen(s);C36_write(2,s,n);if(g36_crashFd>=0)C36_write(g36_crashFd,s,n);}
U0 MC36_Hex(U64 v){U8 b[24];I32 i;b[0]=' ';b[1]='0';b[2]='x';for(i=0;i<16;i++){I32 d=(v>>((15-i)*4))&15;if(d<10)b[3+i]='0'+d;else b[3+i]='a'+d-10;}b[19]='\n';b[20]=0;MC36_Out(b);}
U0 MC36_OnCrash(I32 sig,U8 *info,U8 *uc){g36_crashFd=C36_open("crash.log",0x241,0x1A4);
 MC36_Out("\n*** mcpe-holyc crashed (signal ");U8 sb[8];sb[0]='0'+sig/10;sb[1]='0'+sig%10;sb[2]=')';sb[3]=0;MC36_Out(sb);MC36_Out(". Please send this backtrace (also saved to crash.log):\n");
 U64 *g=(uc+40)(U64*);U64 rip=g[16],rbp=g[10];MC36_Hex(rip);I32 k;
 for(k=0;k<40;k++){if(rbp==0 || (rbp&7))break;U64 *fr=rbp(U64*);U64 ret=fr[1];if(ret==0)break;MC36_Hex(ret);if(fr[0]<=rbp)break;rbp=fr[0];}
 C36_exit(128+sig);}
U0 MC036_CrashHandler(){U8 sa[152];memset(sa,0,152);U0 **h=(&sa[0])(U0**);*h=&MC36_OnCrash;I32 *flags=(&sa[136])(I32*);*flags=0x80000004;I32 sigs[4]={11,7,8,4},i;for(i=0;i<4;i++)C36_sigaction(sigs[i],sa,NULL);}
