// Port batch 001. Upstream: minecraftpe/headers/KeyMapping.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_KEYMAPPING_HPP
#define MCPE_HEADERS_KEYMAPPING_HPP
class KeyMapping { MCString name; I32 keyCode; };
U0 KeyMapping_Init(KeyMapping *self) { MCString_Init(&self->name); self->keyCode=0; }
U0 KeyMapping_InitNamed(KeyMapping *self, MCString *name, I32 code) {
 MCString_CopyInit(&self->name,name); self->keyCode=code;
}
U0 KeyMapping_Assign(KeyMapping *self, KeyMapping *other) {
 MCString_Assign(&self->name,&other->name); self->keyCode=other->keyCode;
}
U0 KeyMapping_Destroy(KeyMapping *self) { MCString_Destroy(&self->name); }
#endif

