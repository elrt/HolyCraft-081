// Batch026 partial source API; not original C++ ABI.
class App {Bool initialized,wantsToQuit;AppContext context;I32 width,height;MCAppListener025 listener;U0 *derived;U0 (*init)(App*);U0 (*suspended)(App*);};
U0 App_suspendDispatch(U0 *object);
U0 App_Init(App *s);
Bool App_initContext(App *s,AppContext *context);
U0 App_quit(App *s);
Bool App_wantToQuit(App *s);
U0 App_Destroy(App *s);
