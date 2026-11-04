// Batch 002. Source: minecraftpe/headers/input/IInputHolder.hpp
#ifndef MCPE_HEADERS_INPUT_IINPUTHOLDER_HPP
#define MCPE_HEADERS_INPUT_IINPUTHOLDER_HPP
class IInputHolder : IConfigListener {
 F32 mouseX,mouseY,field_C;
 IMoveInput *(*moveFn)(IInputHolder *self); ITurnInput *(*turnFn)(IInputHolder *self); IBuildInput *(*buildFn)(IInputHolder *self);
 U0 (*renderFn)(IInputHolder *self,F32 delta); Bool (*allowFn)(IInputHolder *self);
};
U0 IInputHolder_Config(IConfigListener *base,U0 *config) {
 IInputHolder *self=base;
 IConfigListener_onConfigChanged(self->turnFn(self),config); IConfigListener_onConfigChanged(self->turnFn(self),config); IConfigListener_onConfigChanged(self->buildFn(self),config);
}
U0 IInputHolder_DefaultRender(IInputHolder *self,F32 delta) {}
Bool IInputHolder_DefaultAllow(IInputHolder *self) { self->mouseX=Mouse_getX(); self->mouseY=Mouse_getY(); return Mouse_getButtonState(1)==1; }
U0 IInputHolder_Init(IInputHolder *self,IMoveInput *(*move)(IInputHolder *self),ITurnInput *(*turn)(IInputHolder *self),IBuildInput *(*build)(IInputHolder *self)) {
 IConfigListener_Init(self,&IInputHolder_Config,NULL); self->moveFn=move; self->turnFn=turn; self->buildFn=build; self->renderFn=&IInputHolder_DefaultRender; self->allowFn=&IInputHolder_DefaultAllow;
}
IMoveInput *IInputHolder_getMoveInput(IInputHolder *self) { return self->moveFn(self); }
ITurnInput *IInputHolder_getTurnInput(IInputHolder *self) { return self->turnFn(self); }
IBuildInput *IInputHolder_getBuildInput(IInputHolder *self) { return self->buildFn(self); }
U0 IInputHolder_render(IInputHolder *self,F32 delta) { self->renderFn(self,delta); }
Bool IInputHolder_allowPicking(IInputHolder *self) { return self->allowFn(self); }

#endif

