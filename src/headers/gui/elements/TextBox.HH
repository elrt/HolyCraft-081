// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class TextBox {GuiElement base;MCWidget025 widget;AppPlatform *platform;Options *options;MCUI025 *ui;MCString text,title;I32 key,maxLength,validCount,option,screenWidth,screenHeight;U8 *validChars;Bool focused,armed,editable,composing,doneArmed;U0 *owner;U0 (*updated)(U0*,I32);};

Bool TextBox_modal(U0 *object);
U0 TextBox_setText(TextBox *s,MCString *text);
U0 TextBox_setTextboxText(U0 *object,MCString *text);
U0 TextBox_setFocus(TextBox *s);
Bool TextBox_loseFocus(TextBox *s);
U0 TextBox_blur(U0 *object);
U0 TextBox_updateText(TextBox *s);
U0 TextBox_keyPressed(U0 *object,I32 key);
U0 TextBox_keyboardNewChar(U0 *object,MCString *text,Bool composing);
Bool TextBox_backPressed(U0 *object,Bool held);
U0 TextBox_tick(U0 *object);
U0 TextBox_render(U0 *object,Bool top,I32 epoch);
U0 TextBox_mouse(U0 *object,I32 x,I32 y,I32 button,Bool down,Bool modal);
U0 TextBox_Init(TextBox *s,AppPlatform *platform,MCUI025 *ui,U8 *title,I32 maxLength,U8 *validChars,I32 validCount,I32 key);
U0 TextBox_Destroy(TextBox *s);
