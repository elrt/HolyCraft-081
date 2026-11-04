// Batch 002. Source: minecraftpe/headers/input/IBuildInput.hpp
#ifndef MCPE_HEADERS_INPUT_IBUILDINPUT_HPP
#define MCPE_HEADERS_INPUT_IBUILDINPUT_HPP
class IBuildInput : IConfigListener { Bool (*tickBuildFn)(IBuildInput *self,U0 *player,BuildActionIntention *intent); };
Bool IBuildInput_DefaultTick(IBuildInput *self,U0 *player,BuildActionIntention *intent) { return FALSE; }
U0 IBuildInput_Init(IBuildInput *self) { IConfigListener_Init(self,&IConfigListener_NoConfig,NULL); self->tickBuildFn=&IBuildInput_DefaultTick; }
Bool IBuildInput_tickBuild(IBuildInput *self,U0 *player,BuildActionIntention *intent) { return self->tickBuildFn(self,player,intent); }

#endif

