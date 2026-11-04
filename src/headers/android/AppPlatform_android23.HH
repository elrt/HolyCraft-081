// Batch 019. Source: minecraftpe/headers/android/AppPlatform_android23.hpp.
// Projections only: these callback signatures are not Android NDK ABI types.
#ifndef MCPE_ANDROID23_ASSET_HH
#define MCPE_ANDROID23_ASSET_HH
class MCAssetFile019 {U8 *bytes;I32 length;};
class MCAndroid23Host019 {
 U0 *ctx;
 U0 *(*activityAssetManager)(U0 *ctx,U0 *activity);
 U0 *(*open)(U0 *ctx,U0 *manager,MCString *name);
 I64 (*length)(U0 *ctx,U0 *asset);
 U8 *(*buffer)(U0 *ctx,U0 *asset);
 U0 (*close)(U0 *ctx,U0 *asset);
 U0 (*fallback)(U0 *ctx,MCString *name,MCAssetFile019 *out);
};
class AppPlatform_android23 {Bool initialized;U0 *activity,*assetManager;MCAndroid23Host019 *host;};
U0 AppPlatform_android23_Init(AppPlatform_android23 *self,MCAndroid23Host019 *host);
U0 AppPlatform_android23_initWithActivity(AppPlatform_android23 *self,U0 *activity);
U0 AppPlatform_android23_readAssetFile(AppPlatform_android23 *self,MCString *name,MCAssetFile019 *out);
#endif
