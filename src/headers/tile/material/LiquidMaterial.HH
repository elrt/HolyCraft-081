// Port batch 001. Upstream: minecraftpe/headers/tile/material/LiquidMaterial.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_TILE_MATERIAL_LIQUIDMATERIAL_HPP
#define MCPE_HEADERS_TILE_MATERIAL_LIQUIDMATERIAL_HPP
class LiquidMaterial : Material {};
U0 LiquidMaterial_Init(LiquidMaterial *object) {
 Material *self=object; Material_Init(self); self->liquidFn=&Material_True; self->solidFn=&Material_False; self->motionFn=&Material_False;
}
#endif

