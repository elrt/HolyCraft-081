// Batch022: gui/screens/JoinGameScreen; explicit host ABI, see docs/BATCH022.md.
class JoinGameScreen {MC022Box join,back,header;I32 width,height;Touch_AvailableGamesList list;MC022DrawHost *host;};
U0 JoinGameScreen_Init(JoinGameScreen*,I32,I32,MC022DrawHost*);U0 JoinGameScreen_Destroy(JoinGameScreen*);U0 JoinGameScreen_setupPositions(JoinGameScreen*);
Bool JoinGameScreen_isIndexValid(JoinGameScreen*,I32);U0 JoinGameScreen_tick(JoinGameScreen*,MCVector*);U0 JoinGameScreen_buttonClicked(JoinGameScreen*,I32);Bool JoinGameScreen_handleBackEvent(JoinGameScreen*,Bool);
U0 JoinGameScreen_render(JoinGameScreen*,Bool,F64);
