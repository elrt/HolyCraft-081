// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class TextEditScreen {Screen screen;I32 x,y,z,currentLine,tickCounter;Bool opened,closed;AppPlatform *platform;Level *level;U0 *context;U0 (*changed)(U0*,SignTileEntity*);};

SignTileEntity *TextEditScreen_getSign(TextEditScreen *s);
U0 TextEditScreen_close(TextEditScreen *s);
Bool TextEditScreen_keyHook(U0 *object,I32 key);
Bool TextEditScreen_textHook(U0 *object,MCString *text,Bool composing);
Bool TextEditScreen_backHook(U0 *object,Bool held);
U0 TextEditScreen_Init(TextEditScreen *s,Level *level,SignTileEntity *sign,AppPlatform *platform,MCUI025 *ui);
Bool TextEditScreen_open(TextEditScreen *s);
U0 TextEditScreen_setTextboxText(TextEditScreen *s,MCString *text);
U0 TextEditScreen_tick(TextEditScreen *s);
U0 TextEditScreen_renderText(TextEditScreen *s);
