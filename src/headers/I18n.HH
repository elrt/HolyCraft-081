// Batch 018. Source: minecraftpe/headers/I18n.hpp.
// Global map requires I18n_Init/I18n_Destroy; result strings are caller-owned.
#ifndef MCPE_I18N_HH
#define MCPE_I18N_HH
class MCI18nEntry018 { MCString key; MCString value; };
class MCI18nAssetHost018 {
 U0 *ctx;
 // On success, initialize out to a caller-owned byte string; otherwise leave it uninitialized.
 Bool (*readAsset)(U0 *ctx,MCString *path,MCString *out);
};
// Explicit projection: caller must supply the item's real description id, tile identity and aux.
class MCI18nItem018 { MCString *descriptionId; U0 *tileClass; I32 aux; };
class MCI18nTileIds018 { U0 *cloth; U0 *fenceGate; U0 *stoneSlabHalf; };
MCVector I18n_strings018;
U0 I18n_Init();
U0 I18n_Destroy();
U0 I18n_loadLanguage(MCI18nAssetHost018 *host,MCString *language);
U0 I18n_fillTranslations(MCI18nAssetHost018 *host,MCString *path,Bool ignored);
Bool I18n_getInto(MCString *key,MCString *initializedOut);
U0 I18n_get(MCString *out,MCString *key);
U0 I18n_getDescriptionString(MCString *out,MCI18nItem018 *item,MCI18nTileIds018 *tiles);
#endif
