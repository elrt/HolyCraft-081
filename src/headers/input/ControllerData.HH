// Port batch 001. Upstream: minecraftpe/headers/input/ControllerData.hpp
// API: explicit self pointers; see docs/PORTING.md.
#ifndef MCPE_HEADERS_INPUT_CONTROLLERDATA_HPP
#define MCPE_HEADERS_INPUT_CONTROLLERDATA_HPP
class ControllerData { I32 field_0; U32 field_4; MCString field_8; };
U0 ControllerData_Init(ControllerData *self) { self->field_0=0; self->field_4=0; MCString_Init(&self->field_8); }
U0 ControllerData_Destroy(ControllerData *self) { MCString_Destroy(&self->field_8); }
#endif

