// Port batch 001. Upstream: minecraftpe/headers/math/Vec3.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_MATH_VEC3_HPP
#define MCPE_HEADERS_MATH_VEC3_HPP
#define MINCLIPVAL 0.0000001
class Vec3 { F32 x,y,z; };
U0 Vec3_Init(Vec3 *self,F32 x=0,F32 y=0,F32 z=0) {
 if(x==0) x=0; if(y==0) y=0; if(z==0) z=0;
 self->x=x; self->y=y; self->z=z;
}
U0 Vec3_Copy(Vec3 *self,Vec3 *v) { self->x=v->x; self->y=v->y; self->z=v->z; }
F32 Vec3_distanceToSqr(Vec3 *self,Vec3 *v) {
 F32 dx=v->x-self->x,dy=v->y-self->y,dz=v->z-self->z; return dx*dx+dy*dy+dz*dz;
}
F32 Vec3_distanceTo(Vec3 *self,Vec3 *v) { return sqrt(Vec3_distanceToSqr(self,v)); }
Bool Vec3_clipX(Vec3 *self,Vec3 *v,F32 plane,Vec3 *out) {
 F32 dx=v->x-self->x,t; if(dx*dx<MINCLIPVAL) return FALSE;
 t=(plane-self->x)/dx; if(t<0 || t>1) return FALSE;
 out->x=self->x+dx*t; out->y=self->y+(v->y-self->y)*t; out->z=self->z+(v->z-self->z)*t; return TRUE;
}
Bool Vec3_clipY(Vec3 *self,Vec3 *v,F32 plane,Vec3 *out) {
 F32 dy=v->y-self->y,t; if(dy*dy<MINCLIPVAL) return FALSE;
 t=(plane-self->y)/dy; if(t<0 || t>1) return FALSE;
 out->y=self->y+dy*t; out->x=self->x+(v->x-self->x)*t; out->z=self->z+(v->z-self->z)*t; return TRUE;
}
Bool Vec3_clipZ(Vec3 *self,Vec3 *v,F32 plane,Vec3 *out) {
 F32 dz=v->z-self->z,t; if(dz*dz<MINCLIPVAL) return FALSE;
 t=(plane-self->z)/dz; if(t<0 || t>1) return FALSE;
 out->z=self->z+dz*t; out->x=self->x+(v->x-self->x)*t; out->y=self->y+(v->y-self->y)*t; return TRUE;
}
U0 Vec3_yRot(Vec3 *self,F32 angle) {
 F32 c=cos(angle),s=sin(angle),x=self->x,z=self->z;
 self->x=z*s+x*c; self->z=z*c+x*s; // Deliberately preserves upstream signs.
}
U0 Vec3_xRot(Vec3 *self,F32 angle) {
 F32 c=cos(angle),s=sin(angle),y=self->y,z=self->z;
 self->y=z*s+y*c; self->z=z*c+y*s;
}
U0 Vec3_normalized(Vec3 *self,Vec3 *out) {
 F32 len=sqrt(self->x*self->x+self->y*self->y+self->z*self->z);
 if(len>=0.0001) Vec3_Init(out,self->x/len,self->y/len,self->z/len); else Vec3_Init(out);
}
U0 Vec3_add(Vec3 *self,Vec3 *v,Vec3 *out) { Vec3_Init(out,self->x+v->x,self->y+v->y,self->z+v->z); }
U0 Vec3_sub(Vec3 *self,Vec3 *v,Vec3 *out) { Vec3_Init(out,self->x-v->x,self->y-v->y,self->z-v->z); }
U0 Vec3_mul(Vec3 *self,F32 f,Vec3 *out) { Vec3_Init(out,self->x*f,self->y*f,self->z*f); }

#endif

