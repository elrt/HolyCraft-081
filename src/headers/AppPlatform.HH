// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class MCAppListener025 {U0 *object;F32 priority;Bool (*lowMemory)(U0*);U0 (*suspend)(U0*);U0 (*resume)(U0*);};
class AppPlatform {Bool keyboardShown;I32 width,height,textureMaxLevel,anisotropicFilter;F32 pixelsPerMillimeter,anisotropicMaxLevel;MCUI025 *ui;MCVector listeners;U0 *context;Bool (*loadImage)(U0*,MCString*,I32,Bool,ImageData*);};

U0 AppPlatform_Init(AppPlatform *s,MCUI025 *ui,U8 *extensions,F32 maxAnisotropy);
U0 AppPlatform_Destroy(AppPlatform *s);
U0 AppPlatform_showKeyboard(AppPlatform *s,MCString *text,I32 limit,Bool restricted);
U0 AppPlatform_hideKeyboard(AppPlatform *s);
U0 AppPlatform_updateTextBoxText(AppPlatform *s,MCString *text);
Bool AppPlatform_readAssetFile(AppPlatform *s,MCString *path,MCVector *out);
U0 AppPlatform_addListener(AppPlatform *s,MCAppListener025 *listener);
U0 AppPlatform_removeListener(AppPlatform *s,U0 *object);
U0 AppPlatform_fireAppSuspended(AppPlatform *s);
U0 AppPlatform_fireAppResumed(AppPlatform *s);
Bool AppPlatform_loadImage(AppPlatform *s,ImageData *out,MCString *name,Bool external);
Bool AppPlatform_loadTexture(AppPlatform *s,TextureData *out,MCString *name,Bool external);
