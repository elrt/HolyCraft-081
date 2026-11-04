// Batch026 partial source API; not original C++ ABI.
class CreateWorldScreen {SelectWorldScreen select;TextBox name,seed;I32 type;Bool creative,waiting,failed;};
I32 CreateWorldScreen_getSeed(CreateWorldScreen *s,I32 epoch);
U0 CreateWorldScreen_getLevelName(CreateWorldScreen *s,MCString *out);
U0 CreateWorldScreen_setGameType(CreateWorldScreen *s,Bool creative);
Bool CreateWorldScreen_generateLocalGame(CreateWorldScreen *s,I32 epoch);
U0 CreateWorldScreen_action(MCMenu026 *m,I32 id);
U0 CreateWorldScreen_Init(CreateWorldScreen *s,MCUIHost026 *h,MCUI025 *ui,I32 type);
U0 CreateWorldScreen_Destroy(CreateWorldScreen *s);
