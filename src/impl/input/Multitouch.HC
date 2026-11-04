// Batch 002. Source: minecraftpe/impl/input/Multitouch.cpp
I32 Multitouch_activePointerCount=0,Multitouch_activePointerThisUpdateCount=0;
Bool Multitouch_wasPressed[12],Multitouch_wasReleased[12],Multitouch_wasPressedThisUpdate[12],Multitouch_wasReleasedThisUpdate[12];
MouseDevice Multitouch_pointers[12]; MCVector Multitouch_inputs={NULL,0,0,0}; I32 Multitouch_index=-1;
I32 Multitouch_activePointerList[12]={-1,0,0,0,0,0,0,0,0,0,0,0};
I32 Multitouch_activePointerThisUpdateList[12]={-1,0,0,0,0,0,0,0,0,0,0,0};
U0 Multitouch_RuntimeInit() { I32 i; MCVector_Init(&Multitouch_inputs,sizeof(MouseAction)); for(i=0;i<12;i++) MouseDevice_Init(&Multitouch_pointers[i]); }
U0 Multitouch_commit() {
 I32 i; Multitouch_activePointerCount=0; Multitouch_activePointerThisUpdateCount=0;
 for(i=0;i<12;i++) {
  if(MouseDevice_isButtonDown(&Multitouch_pointers[i],1)) Multitouch_activePointerList[Multitouch_activePointerCount++]=i;
  else if(!Multitouch_wasReleased[i]) continue;
  Multitouch_activePointerThisUpdateList[Multitouch_activePointerThisUpdateCount++]=i;
 }
}
U0 Multitouch_feed(I8 button,I8 state,I16 x,I16 y,I8 pointer) {
 U32 id=pointer(U8); if(id>=11) id=11;
 MouseAction event; MouseAction_Init(&event,button,state,x,y,id); MCVector_Push(&Multitouch_inputs,&event);
 MouseDevice_feed(&Multitouch_pointers[id],button,state,x,y);
 if(button) { if(state==1) { Multitouch_wasPressed[id]=TRUE; Multitouch_wasPressedThisUpdate[id]=TRUE; }
 else if(state==0) { Multitouch_wasReleased[id]=TRUE; Multitouch_wasReleasedThisUpdate[id]=TRUE; } }
}
U0 Multitouch_reset() {
 I32 i; Multitouch_inputs.size=0; Multitouch_index=-1;
 for(i=0;i<12;i++) { MouseDevice_reset(&Multitouch_pointers[i]); Multitouch_wasPressed[i]=FALSE; Multitouch_wasReleased[i]=FALSE; }
}
U0 Multitouch_resetThisUpdate() { I32 i; for(i=0;i<12;i++) { Multitouch_wasPressedThisUpdate[i]=FALSE; Multitouch_wasReleasedThisUpdate[i]=FALSE; } }
U0 Multitouch_Destroy() { I32 i; for(i=0;i<12;i++) MouseDevice_Destroy(&Multitouch_pointers[i]); MCVector_Destroy(&Multitouch_inputs); }

