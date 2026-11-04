// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Minecraft {Level *level;LocalPlayer *player;AppPlatform *platform;Options options;Screen *currentScreen,*pendingScreen;IMoveInput *input;SurvivalMode survival;GameMode creativeMode;I32 width,height,ticks;F32 guiScale,pixelsPerMillimeter;Bool supportsNonTouchScreen,paused,inTick,hasPendingScreen,ownsPlayer;U0 *context;U0 (*frame)(U0*,F32);};

U0 Minecraft_Init(Minecraft *s,AppPlatform *platform,Bool supportNonTouch);
Bool Minecraft_useTouchscreen(Minecraft *s);
U0 Minecraft_setSize(Minecraft *s,I32 width,I32 height);
U0 Minecraft_setScreen(Minecraft *s,Screen *screen);
U0 Minecraft_setLevel(Minecraft *s,Level *level,IMoveInput *input,Bool creative);
Bool Minecraft_destroyBlock(Minecraft *s,I32 x,I32 y,I32 z,I32 side);
U0 Minecraft_tick(Minecraft *s);
U0 Minecraft_updateTicks(Minecraft *s,I32 ticks,F32 partial);
Bool Minecraft_save(Minecraft *s,ExternalFileLevelStorage *storage,I32 epoch);
U0 Minecraft_Destroy(Minecraft *s);
F32 Minecraft_refreshDestroyProgress(Minecraft *s,I32 x,I32 y,I32 z);
U0 Minecraft_startDestroyBlock(Minecraft *s,I32 x,I32 y,I32 z,I32 face);
U0 Minecraft_continueDestroyBlock(Minecraft *s,I32 x,I32 y,I32 z,I32 face);
