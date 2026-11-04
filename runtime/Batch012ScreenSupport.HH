#ifndef MCPE_BATCH012_SCREEN_SUPPORT
#define MCPE_BATCH012_SCREEN_SUPPORT
class MCScreenHost012 {U0 *host;Bool (*isCreative)(U0 *);U0 *(*createScreen)(U0 *,I32,I32);U0 (*setScreen)(U0 *,U0 *);U0 *(*createCraftingBase)(U0 *,I32);U0 (*destroyCraftingBase)(U0 *,U0 *);U0 (*setSingleCategory)(U0 *,U0 *,I32,I32);U0 (*screenInit)(U0 *);U0 (*screenTick)(U0 *);U0 (*setCurrentContainer)(U0 *,U0 *);Bool (*playerAlive)(U0 *);Bool (*playerDead)(U0 *);U0 (*closeContainer)(U0 *);U0 *(*createOptionsBase)(U0 *,Bool,I32,I32);U0 (*destroyOptionsBase)(U0 *,U0 *);U0 *(*createOptionsGroup)(U0 *,U8 *);U0 (*addOwnedChild)(U0 *,U0 *,U0 *);U0 (*setupOptions)(U0 *,U0 *);};
// Screen factory kinds are distinct from ScreenId where one ID has two variants.
#define MC012_START 1
#define MC012_JOIN 2
#define MC012_PAUSE 3
#define MC012_SELECT 4
#define MC012_CREATIVE_INV 5
#define MC012_TOUCH_INV 6
#define MC012_CHAT 7
#endif
