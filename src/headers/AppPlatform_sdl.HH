// Batch026 partial source API; not original C++ ABI.
class AppPlatform_sdl {AppPlatform base;I32 screenWidth,screenHeight,lastWidth,lastHeight;Bool hasContext,fullscreen;U0 *surface,*backend;U0 *(*videoMode)(U0*,I32,I32,Bool);U0 (*destroyContext)(U0*);U0 (*key)(U0*,I32,Bool);};
U0 AppPlatform_sdl_Init(AppPlatform_sdl *s,MCUI025 *ui);
U0 AppPlatform_sdl_getImagePath(AppPlatform_sdl *s,MCString *name,Bool external,MCString *out);
Bool AppPlatform_sdl_readAssetFile(AppPlatform_sdl *s,MCString *name,MCVector *out);
Bool AppPlatform_sdl_sdlCtxInit(AppPlatform_sdl *s);
U0 AppPlatform_sdl_sdlCtxDestroy(AppPlatform_sdl *s);
Bool AppPlatform_sdl_setFullscreen(AppPlatform_sdl *s,Bool full);
Bool AppPlatform_sdl_loadPNG(AppPlatform_sdl *s,ImageData *out,MCString *path);
U0 AppPlatform_sdl_onKeyPressed(AppPlatform_sdl *s,Minecraft *mc,I32 key,Bool pressed,Bool mouseGrabbed);
U0 AppPlatform_sdl_getLoginInformation(AppPlatform_sdl *s,LoginInformation *out);
U0 AppPlatform_sdl_Destroy(AppPlatform_sdl *s);
