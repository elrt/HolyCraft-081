// Port batch 001. Upstream: minecraftpe/headers/input/KeyboardAction.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_INPUT_KEYBOARDACTION_HPP
#define MCPE_HEADERS_INPUT_KEYBOARDACTION_HPP
class KeyboardAction { I32 field_0; U8 field_4; };
U0 KeyboardAction_Init(KeyboardAction *self, I32 a, U8 b) { self->field_0=a; self->field_4=b; }
U0 KeyboardAction_MoveInit(KeyboardAction *self, KeyboardAction *other) { self->field_0=other->field_0; self->field_4=other->field_4; }
#endif

