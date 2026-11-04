// Explicit Java/JNI capability boundary. No Android runtime or native registration is fabricated.
class MCAndroidHost027 {U0 *context;Bool (*init)(U0*);I32 (*call)(U0*,U8*,I32);Bool (*text)(U0*,U8*,MCString*);Bool (*asset)(U0*,MCString*,MCVector*);U0 (*keyboard)(U0*,Bool);};
class AppPlatform_android {AppPlatform base;MCAndroidHost027 *host;I32 screenWidth,screenHeight;Bool initialized;};
U32 _d65c6fb8(U32 color){return (color&0xFF00FF00) | ((color<<16)&0xFF0000) | ((color>>16)&255);}
U0 AppPlatform_android_Init(AppPlatform_android *s,MCUI025 *ui,MCAndroidHost027 *host){memset(s,0,sizeof(AppPlatform_android));AppPlatform_Init(&s->base,ui,"",1.0);s->host=host;s->screenWidth=854;s->screenHeight=480;}
I32 AppPlatform_android_init(AppPlatform_android *s){if(s->initialized || !s->host || !s->host->init)return -1;if(!s->host->init(s->host->context))return -1;s->initialized=TRUE;return 0;}
I32 AppPlatform_android_call(AppPlatform_android *s,U8 *method,I32 value){if(!s->initialized || !s->host || !s->host->call)return -1;return s->host->call(s->host->context,method,value);}
Bool AppPlatform_android_readAssetFile(AppPlatform_android *s,MCString *name,MCVector *out){if(!s->initialized || !s->host || !s->host->asset)return FALSE;return s->host->asset(s->host->context,name,out);}
Bool AppPlatform_android_getString(AppPlatform_android *s,U8 *method,MCString *out){if(!s->initialized || !s->host || !s->host->text)return FALSE;return s->host->text(s->host->context,method,out);}
U0 AppPlatform_android_showKeyboard(AppPlatform_android *s,Bool show){if(s->initialized && s->host && s->host->keyboard!=NULL)s->host->keyboard(s->host->context,show);}
U0 AppPlatform_android_Destroy(AppPlatform_android *s){AppPlatform_Destroy(&s->base);s->initialized=FALSE;}
