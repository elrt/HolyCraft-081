// Batch 002. Source: minecraftpe/headers/input/ControllerTurnInput.hpp
#ifndef MCPE_HEADERS_INPUT_CONTROLLERTURNINPUT_HPP
#define MCPE_HEADERS_INPUT_CONTROLLERTURNINPUT_HPP
class ControllerTurnInput : ITurnInput { I32 field_10,field_14; F32 field_18,field_1C; I8 field_20,field_21,field_22,field_23; I32 field_24; };
U0 ControllerTurnInput_getTurnDelta(ITurnInput *base,Vec3 *out);
U0 ControllerTurnInput_Init(ControllerTurnInput *self) {
 IConfigListener_Init(self,&IConfigListener_NoConfig,NULL); self->turnFn=&ControllerTurnInput_getTurnDelta;
 self->curTime=-1; self->field_20=0; self->field_18=0; self->field_1C=0; self->field_10=2; self->field_14=2;
}

#endif

