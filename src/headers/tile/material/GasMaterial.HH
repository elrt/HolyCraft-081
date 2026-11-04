// Port batch 001. Upstream: minecraftpe/headers/tile/material/GasMaterial.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_TILE_MATERIAL_GASMATERIAL_HPP
#define MCPE_HEADERS_TILE_MATERIAL_GASMATERIAL_HPP
class GasMaterial : Material {};
U0 GasMaterial_Init(GasMaterial *object) {
 Material *self=object; Material_Init(self); self->solidFn=&Material_False; self->lightFn=&Material_False; self->motionFn=&Material_False;
}
#endif

