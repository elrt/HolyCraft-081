// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class MCWidget025 {U0 *object;Bool (*modal)(U0*);U0 (*render)(U0*,Bool,I32);U0 (*key)(U0*,I32);U0 (*text)(U0*,MCString*,Bool);U0 (*setText)(U0*,MCString*);U0 (*mouse)(U0*,I32,I32,I32,Bool,Bool);Bool (*back)(U0*,Bool);U0 (*tick)(U0*);U0 (*blur)(U0*);};
class Screen {Minecraft *minecraft;MCUI025 *ui;MCPtrVector elements,buttons;I32 width,height,tab,ticks;Button *lastPressed;Bool dontPreventGameInput,pause,error,inGame,closeOnHurt;U0 *context;U0 (*buttonClicked)(U0*,Button*);U0 (*removed)(U0*);Bool (*keyHook)(U0*,I32);Bool (*textHook)(U0*,MCString*,Bool);Bool (*backHook)(U0*,Bool);};

U0 Screen_Init(Screen *s,MCUI025 *ui);
U0 Screen_Destroy(Screen *s);
U0 Screen_setSize(Screen *s,I32 w,I32 h);
U0 Screen_attach(Screen *s,Minecraft *mc,I32 w,I32 h);
Bool Screen_suppressedBySubWindow(Screen *s);
U0 Screen_toGUICoordinate(Screen *s,I32 physicalW,I32 physicalH,I32 *x,I32 *y);
U0 Screen_render(Screen *s,I32 epoch);
U0 Screen_mouse(Screen *s,I32 x,I32 y,I32 button,Bool down);
U0 Screen_keyPressed(Screen *s,I32 key,Bool touch,Options *options);
U0 Screen_keyboardNewChar(Screen *s,MCString *text,Bool composing);
U0 Screen_setTextboxText(Screen *s,MCString *text);
Bool Screen_handleBackEvent(Screen *s,Bool held);
U0 Screen_tick(Screen *s);
U0 Screen_lostFocus(Screen *s);
