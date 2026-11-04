// Port batch 001. Upstream: minecraftpe/headers/tile/material/WebMaterial.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_TILE_MATERIAL_WEBMATERIAL_HPP
#define MCPE_HEADERS_TILE_MATERIAL_WEBMATERIAL_HPP
class WebMaterial : Material {};
U0 WebMaterial_Init(WebMaterial *object) {
 Material *self=object; Material_Init(self); self->alwaysDestroyable=FALSE; self->motionFn=&Material_False;
}
#endif

