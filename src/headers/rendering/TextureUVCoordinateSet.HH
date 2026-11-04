// Port batch 001. Upstream: minecraftpe/headers/rendering/TextureUVCoordinateSet.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_RENDERING_TEXTUREUVCOORDINATESET_HPP
#define MCPE_HEADERS_RENDERING_TEXTUREUVCOORDINATESET_HPP
class TextureUVCoordinateSet { F32 minX,minY,maxX,maxY,width,height; };
U0 TextureUVCoordinateSet_Init(TextureUVCoordinateSet *self,F32 x0,F32 y0,F32 x1,F32 y1,F32 w,F32 h) {
 self->width=w; self->height=h; self->minX=x0; self->minY=y0; self->maxX=x1; self->maxY=y1;
}
U0 TextureUVCoordinateSet_DefaultInit(TextureUVCoordinateSet *self) {
 self->minX=0; self->minY=0; self->maxX=0; self->maxY=0; // Source leaves width,height unset.
}
U0 TextureUVCoordinateSet_fromOldSystem(I32 sprite,TextureUVCoordinateSet *out) {
 I32 x=sprite%16,y=sprite/16;
 TextureUVCoordinateSet_Init(out,16*x*0.0039062,16*y*0.0039062,16*(x+1)*0.0039062,16*(y+1)*0.0039062,256.0,256.0);
}
#endif

