// Batch022: gui/screens/PauseScreen; explicit host ABI, see docs/BATCH022.md.
class MC022Player {U0 *identity;MCString name;};
class PauseScreen {MC022Box back,quit,copy,options,label,playersBox;I32 ticks;Bool copyMap;MCVector players;MC022DrawHost *host;};
U0 PauseScreen_Init(PauseScreen*,Bool,MC022DrawHost*);U0 PauseScreen_Destroy(PauseScreen*);U0 PauseScreen_setupPositions(PauseScreen*,I32,I32,I32);
Bool PauseScreen_playerListChanged(PauseScreen*,MCVector*);U0 PauseScreen_rebuildPlayerList(PauseScreen*,MCVector*);U0 PauseScreen_tick(PauseScreen*,MCVector*);U0 PauseScreen_buttonClicked(PauseScreen*,I32);U0 PauseScreen_renderPlayers(PauseScreen*,MCString*);
