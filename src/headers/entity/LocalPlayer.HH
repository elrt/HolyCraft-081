// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class LocalPlayer {Player player;IMoveInput *input;I32 flyToggleCounter,lastSelectedId,lastSelectedMeta;F32 lastX,lastY,lastZ,lastYaw,lastPitch;Bool previousJump,allowAutojump;};

U0 LocalPlayer_Init(LocalPlayer *s,Level *level,U8 *name,Bool creative,IMoveInput *input);
U0 LocalPlayer_Destroy(LocalPlayer *s);
U0 LocalPlayer_releaseAllKeys(LocalPlayer *s);
U0 LocalPlayer_setKey(LocalPlayer *s,I32 key,Bool down);
Bool LocalPlayer_positionChanged(LocalPlayer *s);
U0 LocalPlayer_markPositionSent(LocalPlayer *s);
U0 LocalPlayer_tick(LocalPlayer *s);

U0 LocalPlayer_aiStep(LocalPlayer *s);
