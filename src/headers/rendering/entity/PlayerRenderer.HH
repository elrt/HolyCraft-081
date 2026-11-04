// Batch023: rendering/entity/PlayerRenderer; explicit simulation ABI, see docs/BATCH023.md.
class PlayerRenderer {MCG020 *g;U0 *model,*armorInner,*armorOuter;F32 cameraYaw,cameraPitch;};
U0 PlayerRenderer_Init(PlayerRenderer*,MCG020*,U0*,U0*,U0*);Bool PlayerRenderer_prepareArmor(PlayerRenderer*,MCItemDef023*,I32,Bool);U0 PlayerRenderer_renderName(PlayerRenderer*,MCString*,F32,F32,F32,F32,Bool);U0 PlayerRenderer_render(PlayerRenderer*,MCRenderEntity020*,F32,F32,F32,F32,F32);
