// Batch 002. Source: minecraftpe/headers/input/KeyboardInput.hpp
#ifndef MCPE_HEADERS_INPUT_KEYBOARDINPUT_HPP
#define MCPE_HEADERS_INPUT_KEYBOARDINPUT_HPP
class KeyboardInput : IMoveInput {
 Bool inputs[10]; U0 *options;
 I32 (*keyCodeFn)(U0 *options,I32 action);
 U0 (*craftFn)(U0 *player);
};
U0 KeyboardInput_tick(IMoveInput *base,U0 *player);
U0 KeyboardInput_setKey(IMoveInput *base,I32 key,Bool down);
U0 KeyboardInput_releaseAllKeys(IMoveInput *base);
U0 KeyboardInput_Init(KeyboardInput *self,U0 *options,I32 (*keyCode)(U0 *options,I32 action),U0 (*craft)(U0 *player));

#endif

