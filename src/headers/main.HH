// main.hpp platform state and explicit bootstrap contract.
class MCNative027 {Bool contextWasLost;I32 width,height;MCString nativeUtf8Input;U0 *context;U0 (*event)(U0*,I32,I32,I32,I32,I32);};
class MCBoot027 {U0 *context;Bool (*init)(U0*);Bool (*tick)(U0*);U0 (*render)(U0*);U0 (*shutdown)(U0*);};
U0 MCNative027_Init(MCNative027*);U0 MCNative027_Destroy(MCNative027*);Bool MCNative027_Text(MCNative027*,U8*);U0 MCNative027_Resize(MCNative027*,I32,I32);U0 MCNative027_Input(MCNative027*,I32,I32,I32,I32,I32);Bool MCMain027_Run(MCBoot027*,I32);
