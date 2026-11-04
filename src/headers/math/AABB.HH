// Port batch 001. Upstream: minecraftpe/headers/math/AABB.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_AABB_HPP
#define MCPE_HEADERS_MATH_AABB_HPP
class AABB { F32 minX,minY,minZ,maxX,maxY,maxZ; };
U0 AABB_Init(AABB *self,F32 x0,F32 y0,F32 z0,F32 x1,F32 y1,F32 z1) {
 self->minX=x0; self->minY=y0; self->minZ=z0; self->maxX=x1; self->maxY=y1; self->maxZ=z1;
}
U0 AABB_DefaultInit(AABB *self) {}
F32 AABB_min(F32 x,F32 y) { if(y<x) return y; return x; }
F32 AABB_max(F32 x,F32 y) { if(x<y) return y; return x; }
U0 AABB_clip(AABB *self,Vec3 *start,Vec3 *end,HitResult *out) {
 Vec3 v[6]; Bool ok[6]; I32 i,axis,side[6]={4,5,0,1,2,3},best=-1; F32 d,bestD;
 for(i=0;i<6;i++) Vec3_Init(&v[i]);
 ok[0]=Vec3_clipX(start,end,self->minX,&v[0]); ok[1]=Vec3_clipX(start,end,self->maxX,&v[1]);
 ok[2]=Vec3_clipY(start,end,self->minY,&v[2]); ok[3]=Vec3_clipY(start,end,self->maxY,&v[3]);
 ok[4]=Vec3_clipZ(start,end,self->minZ,&v[4]); ok[5]=Vec3_clipZ(start,end,self->maxZ,&v[5]);
 for(i=0;i<6;i++) {
  axis=i/2;
  if(axis==0) ok[i]=ok[i] && v[i].y>=self->minY && v[i].y<=self->maxY && v[i].z>=self->minZ && v[i].z<=self->maxZ;
  if(axis==1) ok[i]=ok[i] && v[i].x>=self->minX && v[i].x<=self->maxX && v[i].z>=self->minZ && v[i].z<=self->maxZ;
  if(axis==2) ok[i]=ok[i] && v[i].x>=self->minX && v[i].x<=self->maxX && v[i].y>=self->minY && v[i].y<=self->maxY;
  if(ok[i]) { d=Vec3_distanceToSqr(start,&v[i]); if(best<0 || d<bestD) { best=i; bestD=d; } }
 }
 if(best<0) HitResult_Init(out); else HitResult_InitBlock(out,0,0,0,side[best],&v[best]);
}
U0 AABB_expand(AABB *self,F32 x,F32 y,F32 z,AABB *out) {
 F32 x0=self->minX,y0=self->minY,z0=self->minZ,x1=self->maxX,y1=self->maxY,z1=self->maxZ;
 if(x<0) x0+=x; if(x>0) x1+=x; if(y<0) y0+=y; if(y>0) y1+=y; if(z<0) z0+=z; if(z>0) z1+=z;
 AABB_Init(out,x0,y0,z0,x1,y1,z1);
}
F32 AABB_clipXCollide(AABB *self,AABB *other,F32 delta) {
 if(other->maxY<=self->minY || other->minY>=self->maxY) return delta;
 if(other->maxZ<=self->minZ || other->minZ>=self->maxZ) return delta;
 F32 d;
 if(delta>0 && other->maxX<=self->minX) { d=self->minX-other->maxX; if(d<delta) delta=d; }
 if(delta<0 && other->minX>=self->maxX) { d=self->maxX-other->minX; if(d>delta) delta=d; }
 return delta;
}
F32 AABB_clipYCollide(AABB *self,AABB *other,F32 delta) {
 if(other->maxX<=self->minX || other->minX>=self->maxX) return delta;
 if(other->maxZ<=self->minZ || other->minZ>=self->maxZ) return delta;
 F32 d;
 if(delta>0 && other->maxY<=self->minY) { d=self->minY-other->maxY; if(d<delta) delta=d; }
 if(delta<0 && other->minY>=self->maxY) { d=self->maxY-other->minY; if(d>delta) delta=d; }
 return delta;
}
F32 AABB_clipZCollide(AABB *self,AABB *other,F32 delta) {
 if(other->maxX<=self->minX || other->minX>=self->maxX) return delta;
 if(other->maxY<=self->minY || other->minY>=self->maxY) return delta;
 F32 d;
 if(delta>0 && other->maxZ<=self->minZ) { d=self->minZ-other->maxZ; if(d<delta) delta=d; }
 if(delta<0 && other->minZ>=self->maxZ) { d=self->maxZ-other->minZ; if(d>delta) delta=d; }
 return delta;
}
AABB *AABB_move(AABB *self,F32 x,F32 y,F32 z) {
 self->minX+=x; self->minY+=y; self->minZ+=z; self->maxX+=x; self->maxY+=y; self->maxZ+=z; return self;
}
U0 AABB_merge(AABB *self,AABB *v,AABB *out) {
 AABB_Init(out,AABB_min(self->minX,v->minX),AABB_min(self->minY,v->minY),AABB_min(self->minZ,v->minZ),
 AABB_max(self->maxX,v->maxX),AABB_max(self->maxY,v->maxY),AABB_max(self->maxZ,v->maxZ));
}
U0 AABB_grow(AABB *self,F32 x,F32 y,F32 z,AABB *out) {
 AABB_Init(out,self->minX-x,self->minY-y,self->minZ-z,self->maxX+x,self->maxY+y,self->maxZ+z);
}
U0 AABB_cloneMove(AABB *self,F32 x,F32 y,F32 z,AABB *out) {
 AABB_Init(out,self->minX+x,self->minY+y,self->minZ+z,self->maxX+x,self->maxY+y,self->maxZ+z);
}
Bool AABB_contains(AABB *self,Vec3 *v) {
 return v->x>self->minX && v->x<self->maxX && v->y>self->minY && v->y<self->maxY && v->z>self->minZ && v->z<self->maxZ;
}
U0 AABB_assign(AABB *self,Vec3 *start,Vec3 *add) {
 Vec3 end; Vec3_add(start,add,&end); AABB_Init(self,start->x,start->y,start->z,end.x,end.y,end.z);
}

#endif

