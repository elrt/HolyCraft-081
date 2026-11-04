// Batch025 partial source API; contracts/omissions in docs/BATCH025.md
class Options {Bool flags[23],hidden[23],supportsNonTouch,canEditName;F32 musicVolume,soundVolume,sensitivity,pixelDensity;I32 renderDistance,difficulty,guiScale,major,minor,patch,beta,keyCodes[16],saveCount;MCString username;OptionsFile file;U0 *context;U0 (*changed)(U0*,I32,I32,F32);};

U0 Options_Init(Options *s,F32 pixelsPerMm,Bool supportNonTouch);
U0 Options_Destroy(Options *s);
Bool Options_boolId(I32 id);
Bool Options_getBooleanValue(Options *s,I32 id);
F32 Options_getProgressValue(Options *s,I32 id);
I32 Options_getIntValue(Options *s,I32 id);
U0 Options_notify(Options *s,I32 id,I32 kind,F32 value);
U0 Options_setFloat(Options *s,I32 id,F32 v);
U0 Options_setInt(Options *s,I32 id,I32 v);
U0 Options_setString(Options *s,I32 id,MCString *text);
Bool Options_canModify(Options *s,I32 id);
Bool Options_hideOption(Options *s,I32 id);
Bool Options_readFloat(MCString *text,F32 *out);
Bool Options_readInt(MCString *text,I32 *out);
Bool Options_readBool(MCString *text,Bool *out);
U0 MC025_OptionLine(MCVector *out,U8 *key,U8 *value);
U0 MC025_OptionNum(MCVector *out,U8 *key,F32 value,Bool integer);
U0 Options_getSaveOutput(Options *s,MCVector *out);
U0 Options_save(Options *s);
U0 Options_toggle(Options *s,I32 id,I32 delta);
U0 Options_setKey(Options *s,I32 slot,I32 code);
Bool Options_validateVersion(Options *s);
U0 Options_updatePair(Options *s,MCString *key,MCString *v);
U0 Options_update(Options *s);
