// Batch 003. Source: minecraftpe/headers/rendering/states/BlendFunctionState.hpp
#ifndef MCPE_HEADERS_RENDERING_STATES_BLENDFUNCTIONSTATE_HPP
#define MCPE_HEADERS_RENDERING_STATES_BLENDFUNCTIONSTATE_HPP
class BlendFunctionState { U8 reserved; };
U0 BlendFunctionState_Init(BlendFunctionState *self,U32 sf,U32 df) { glBlendFunc(sf,df); }
U0 BlendFunctionState_Destroy(BlendFunctionState *self) { glBlendFunc(0x302,0x303); }

#endif

