// Batch 002. Source: minecraftpe/impl/input/Keyboard.cpp
I32 Keyboard_states[256]; MCVector Keyboard_inputs={NULL,0,0,0},Keyboard_inputText={NULL,0,0,0}; I32 Keyboard_index=-1,Keyboard_textIndex=-1;
U0 Keyboard_RuntimeInit() { MCVector_Init(&Keyboard_inputs,sizeof(KeyboardAction)); MCVector_Init(&Keyboard_inputText,sizeof(KeyboardTextInput)); }
U0 Keyboard_feed(U8 key,I32 state) { KeyboardAction action; KeyboardAction_Init(&action,state,key); MCVector_Push(&Keyboard_inputs,&action); Keyboard_states[key]=state; }
U0 Keyboard_feedText(MCString *text,Bool flag) { KeyboardTextInput input; MCString_CopyInit(&input.field_0,text); input.field_4=flag; MCVector_Push(&Keyboard_inputText,&input); }
U0 Keyboard_reset() {
 I64 i; for(i=0;i<Keyboard_inputText.size;i++) { KeyboardTextInput *value=MCVector_At(&Keyboard_inputText,i); KeyboardTextInput_Destroy(value); }
 Keyboard_inputs.size=0; Keyboard_inputText.size=0; Keyboard_index=-1; Keyboard_textIndex=-1;
}
U0 Keyboard_Destroy() { Keyboard_reset(); MCVector_Destroy(&Keyboard_inputs); MCVector_Destroy(&Keyboard_inputText); }

