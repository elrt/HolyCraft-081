// Port batch 001. Upstream: minecraftpe/headers/tile/material/Material.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_TILE_MATERIAL_MATERIAL_HPP
#define MCPE_HEADERS_TILE_MATERIAL_MATERIAL_HPP
class Material {
 Bool flammable,translucent,alwaysDestroyable,replaceable;
 Bool (*liquidFn)(Material *self); Bool (*solidFn)(Material *self);
 Bool (*lightFn)(Material *self); Bool (*motionFn)(Material *self);
};
Bool Material_True(Material *self) { return TRUE; }
Bool Material_False(Material *self) { return FALSE; }
U0 Material_Init(Material *self) {
 self->alwaysDestroyable=TRUE; self->flammable=FALSE; self->translucent=FALSE; self->replaceable=FALSE;
 self->liquidFn=&Material_False; self->solidFn=&Material_True; self->lightFn=&Material_True; self->motionFn=&Material_True;
}
Bool Material_isLiquid(Material *self) { return self->liquidFn(self); }
Bool Material_isSolid(Material *self) { return self->solidFn(self); }
Bool Material_blocksLight(Material *self) { return self->lightFn(self); }
Bool Material_blocksMotion(Material *self) { return self->motionFn(self); }
Bool Material_letsWaterThrough(Material *self) { if(Material_isLiquid(self)) return FALSE; return !Material_isSolid(self); }
Bool Material_isSolidBlocking(Material *self) { if(self->translucent) return FALSE; return Material_blocksMotion(self); }
Bool Material_isAlwaysDestroyable(Material *self) { return self->alwaysDestroyable; }
Bool Material_isFlammable(Material *self) { return self->flammable; }
Bool Material_isReplaceable(Material *self) { return self->replaceable; }
U0 Material_Destroy(Material *self) {} // All five source destructors are empty.
U0 Material_initMaterials();
U0 Material_teardownMaterials();

#endif

