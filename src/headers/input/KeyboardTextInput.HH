// Port batch 001. Upstream: minecraftpe/headers/input/KeyboardTextInput.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_INPUT_KEYBOARDTEXTINPUT_HPP
#define MCPE_HEADERS_INPUT_KEYBOARDTEXTINPUT_HPP
class KeyboardTextInput { MCString field_0; Bool field_4; };
U0 KeyboardTextInput_Init(KeyboardTextInput *self) { MCString_Init(&self->field_0); }
U0 KeyboardTextInput_Destroy(KeyboardTextInput *self) { MCString_Destroy(&self->field_0); }
#endif

