#ifndef MCPE_BATCH012_RENDER_SUPPORT
#define MCPE_BATCH012_RENDER_SUPPORT
// Adapter for the as-yet-unported MobRenderer/GL integration. Ownership is explicit.
class MCMobRenderHost012 {U0 *host;U0 *(*createBase)(U0 *,U0 *,F32);U0 (*destroyBase)(U0 *,U0 *);U0 (*setModel)(U0 *,U0 *,U0 *);U0 (*setArmor)(U0 *,U0 *,U0 *);U0 *(*getArmor)(U0 *,U0 *);U0 *(*createPigArmor)(U0 *,F32);U0 *(*createSpiderEyes)(U0 *);U0 (*destroyModel)(U0 *,U0 *);U0 (*bindTexture)(U0 *,U0 *,U8 *);U0 (*rgba)(U0 *,F32,F32,F32,F32);U0 (*scale)(U0 *,F32,F32,F32);U0 (*renderBase)(U0 *,U0 *,U0 *,F32,F32,F32,F32,F32);};
#endif
