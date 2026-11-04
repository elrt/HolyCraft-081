// Batch 002. Source: minecraftpe/impl/input/KeyboardInput.cpp
U0 KeyboardInput_Init(KeyboardInput *self,U0 *options,I32 (*keyCode)(U0 *options,I32 action),U0 (*craft)(U0 *player)) {
 IMoveInput_Init(self); self->strafeInput=0; self->forwardInput=0; self->idkWhatIsThis=FALSE;
 self->jumping=FALSE; self->sneaking=FALSE; self->flyUpPressed=FALSE; self->flyDownPressed=FALSE; self->idkWhatIsThis2=FALSE;
 MemSet(self->inputs,0,10); self->options=options; self->keyCodeFn=keyCode; self->craftFn=craft;
 self->tickFn=&KeyboardInput_tick; self->setKeyFn=&KeyboardInput_setKey; self->releaseFn=&KeyboardInput_releaseAllKeys;
}
U0 KeyboardInput_tick(IMoveInput *base,U0 *player) {
 KeyboardInput *self=base; self->strafeInput=0; self->forwardInput=0;
 if(self->inputs[0]) self->forwardInput=1; if(self->inputs[1]) self->forwardInput-=1;
 if(self->inputs[2]) self->strafeInput=1; if(self->inputs[3]) self->strafeInput-=1;
 self->jumping=self->inputs[4]; self->sneaking=self->inputs[5];
 if(self->sneaking) { self->strafeInput*=0.3; self->forwardInput*=0.3; }
 if(self->inputs[6]) self->craftFn(player);
}
U0 KeyboardInput_setKey(IMoveInput *base,I32 key,Bool down) {
 KeyboardInput *self=base; I32 action,index=-1;
 for(action=0;action<7;action++) if(key==self->keyCodeFn(self->options,action)) index=action;
 if(index>=0) self->inputs[index]=down;
}
U0 KeyboardInput_releaseAllKeys(IMoveInput *base) {
 KeyboardInput *self=base; self->strafeInput=0; self->forwardInput=0; MemSet(self->inputs,0,10); self->flyDownPressed=FALSE; self->flyUpPressed=FALSE;
#ifdef MCPE_DIFFERENTTWEAKS
 self->jumping=FALSE; self->sneaking=FALSE;
#endif
}

