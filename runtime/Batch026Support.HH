// Batch026 explicit host ABI; see docs/BATCH026.md.

extern "c" I32 sprintf(U8 *out,U8 *format,...);
class Gui;class App;class UnifiedTurnBuild;class TouchInputHolder;
#define MC026_NAVIGATE 1
#define MC026_CREATE_LOCAL 2
#define MC026_LOAD_LOCAL 3
#define MC026_CHAT_SEND 4
#define MC026_MCO_INVITE 5
#define MC026_MCO_REMOVE 6
#define MC026_MCO_UPDATE 7
#define MC026_MCO_JOIN 8
#define MC026_BUY 9
#define MC026_INVALID_LICENSE 10
class MCUIHost026 {Minecraft *minecraft;Gui *gui;U0 *context;Bool (*command)(U0*,I32,MCString*,MCString*,I64,I32);I32 (*armorSlot)(U0*,ItemInstance*);I32 (*category)(U0*,I32);I32 (*resolve)(U0*,Bool,U8*);};
class MCMenu026 {Screen screen;MCWidget025 widget;MCUIHost026 *host;Button buttons[12];I32 buttonCount;Bool closed;MCString title;U0 (*onAction)(MCMenu026*,I32);U0 (*onTick)(MCMenu026*);U0 (*draw)(MCMenu026*);};
class MCTouch026 {I32 id,x,y;Bool active,first;};
class MCTouchEvent026 {I32 x,y,id;Bool button,down;};
class MCSpawnHost026 {U0 *context;I32 (*baseType)(U0*,I32);Mob *(*create)(U0*,Level*,I32);Bool (*finalize)(U0*,Mob*,Level*);U0 (*ambient)(U0*,Mob*);U0 (*discard)(U0*,Mob*);};

I32 MC026_SplashCount=20;
U8 *MC026_Splashes[20]={"Now in HolyC!","No C inside!","Built with hcc!","Fan-made!","Unofficial!","Bring your own assets!","Also try TempleOS!","Divine intellect!","Zero lines of C++!","Ported by hand!","Pocket-sized!","F32 everywhere!","Made on Linux!","Chunks of joy!","Blocks all the way down!","Pixel perfect-ish!","Runs on x86_64!","Compiled, not interpreted!","Strong types, weak sleep!","Hello from HolyC!"};
Bool MC026_Command(MCUIHost026 *h,I32 op,MCString *a,MCString *b,I64 n,I32 flags);
U0 MC026_MenuAction(U0 *object,Button *b);
U0 MC026_MenuTick(U0 *object);
U0 MC026_MenuDraw(U0 *object,Bool modal,I32 epoch);
Bool MC026_MenuBack(U0 *object,Bool held);
U0 MC026_MenuInit(MCMenu026 *s,MCUIHost026 *h,MCUI025 *ui,U8 *title);
U0 MC026_MenuDestroy(MCMenu026 *s);
U0 MC026_Drop(Player *p,ItemInstance *item);
U0 MC026_Return(Player *p,ItemInstance *item);
I32 MC026_MaxStack(ItemInstance *s);
Bool MC026_ResourceMatches(ItemInstance *a,MCRecipeItem *b);
I32 MC026_Count(Inventory *s,MCRecipeItem *need);
Bool MC026_Remove(Inventory *s,MCRecipeItem *need);
I32 MC026_Amount(I32 count,I32 percent,I32 held);
F32 MC026_Ease(F32 t,F32 duration,F32 start,F32 target);
Bool MC026_Same(MCString *a,MCString *b);
