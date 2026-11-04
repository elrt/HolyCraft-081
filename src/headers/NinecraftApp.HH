// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class NinecraftApp {Minecraft minecraft;Timer timer;MCVector backEvents;MCG020 *graphics;I32 frames;Bool suspended,initialized;};

U0 NinecraftApp_initSinTable();
U0 NinecraftApp_Init(NinecraftApp *s,AppPlatform *platform,MCG020 *graphics);
U0 NinecraftApp_initGLStates(NinecraftApp *s);
Bool NinecraftApp_handleBack(NinecraftApp *s,Bool held);
U0 NinecraftApp_queueBack(NinecraftApp *s,Bool held);
U0 NinecraftApp_updateTicks(NinecraftApp *s,I32 ticks,F32 partial);
U0 NinecraftApp_update(NinecraftApp *s);
U0 NinecraftApp_onAppSuspended(NinecraftApp *s);
U0 NinecraftApp_onAppResumed(NinecraftApp *s);
U0 NinecraftApp_Destroy(NinecraftApp *s);
