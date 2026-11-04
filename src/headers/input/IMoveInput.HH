// Batch 002. Source: minecraftpe/headers/input/IMoveInput.hpp
#ifndef MCPE_HEADERS_INPUT_IMOVEINPUT_HPP
#define MCPE_HEADERS_INPUT_IMOVEINPUT_HPP
class IMoveInput : IConfigListener {
 F32 strafeInput,forwardInput; Bool idkWhatIsThis,jumping,sneaking,flyUpPressed,flyDownPressed,idkWhatIsThis2;
 U0 (*tickFn)(IMoveInput *self,U0 *player); U0 (*renderFn)(IMoveInput *self,F32 delta);
 U0 (*setKeyFn)(IMoveInput *self,I32 key,Bool down); U0 (*releaseFn)(IMoveInput *self);
};
U0 IMoveInput_DefaultTick(IMoveInput *self,U0 *player) {}
U0 IMoveInput_DefaultRender(IMoveInput *self,F32 delta) {}
U0 IMoveInput_DefaultKey(IMoveInput *self,I32 key,Bool down) {}
U0 IMoveInput_DefaultRelease(IMoveInput *self) {}
U0 IMoveInput_Init(IMoveInput *self) {
 IConfigListener_Init(self,&IConfigListener_NoConfig,NULL); self->tickFn=&IMoveInput_DefaultTick; self->renderFn=&IMoveInput_DefaultRender;
 self->setKeyFn=&IMoveInput_DefaultKey; self->releaseFn=&IMoveInput_DefaultRelease;
}
U0 IMoveInput_tick(IMoveInput *self,U0 *player) { self->tickFn(self,player); }
U0 IMoveInput_render(IMoveInput *self,F32 delta) { self->renderFn(self,delta); }
U0 IMoveInput_setKey(IMoveInput *self,I32 key,Bool down) { self->setKeyFn(self,key,down); }
U0 IMoveInput_releaseAllKeys(IMoveInput *self) { self->releaseFn(self); }

#endif

