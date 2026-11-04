// Port batch 001. Upstream: minecraftpe/headers/tile/material/DecorationMaterial.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_TILE_MATERIAL_DECORATIONMATERIAL_HPP
#define MCPE_HEADERS_TILE_MATERIAL_DECORATIONMATERIAL_HPP
class DecorationMaterial : Material {};
U0 DecorationMaterial_Init(DecorationMaterial *object) {
 Material *self=object; Material_Init(self); self->solidFn=&Material_False; self->lightFn=&Material_False; self->motionFn=&Material_False;
}
#endif

