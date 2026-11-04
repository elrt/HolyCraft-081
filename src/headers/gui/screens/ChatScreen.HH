// Batch026 partial source API; not original C++ ABI.
class ChatScreen {MCMenu026 menu;Gui *gui;TextBox input;MCVector history,snapshot;I32 historyIndex,messageCount;Bool keyboardVisible,online;};
Bool ChatScreen_sendChatMessage(ChatScreen *s);
U0 ChatScreen_setHistory(ChatScreen *s,I32 delta);
Bool ChatScreen_guiMessagesUpdated(ChatScreen *s);
U0 ChatScreen_action(MCMenu026 *m,I32 id);
U0 ChatScreen_draw(MCMenu026 *m);
U0 ChatScreen_Init(ChatScreen *s,MCUIHost026 *h,MCUI025 *ui,Bool online);
U0 ChatScreen_Destroy(ChatScreen *s);
