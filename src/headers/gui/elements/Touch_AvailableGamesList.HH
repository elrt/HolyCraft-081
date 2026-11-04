// Batch022: gui/elements/Touch_AvailableGamesList; explicit host ABI, see docs/BATCH022.md.
class MC022Server {MCString name,address;Bool badge;};
class Touch_AvailableGamesList {I32 pressed,selected,left,right;MCVector servers;MC022DrawHost *host;};
U0 Touch_AvailableGamesList_Init(Touch_AvailableGamesList*,MC022DrawHost*,I32);
U0 Touch_AvailableGamesList_Destroy(Touch_AvailableGamesList*);
U0 Touch_AvailableGamesList_selectStart(Touch_AvailableGamesList*,I32);U0 Touch_AvailableGamesList_selectCancel(Touch_AvailableGamesList*);U0 Touch_AvailableGamesList_selectItem(Touch_AvailableGamesList*,I32);
U0 Touch_AvailableGamesList_renderItem(Touch_AvailableGamesList*,I32,I32,I32,Bool);
U0 MC022_ServerListClear(MCVector*);U0 MC022_ServerListCopy(MCVector*,MCVector*);
