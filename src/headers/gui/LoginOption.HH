// Batch022: gui/LoginOption; explicit host ABI, see docs/BATCH022.md.
class LoginOption {MC022Box bounds,login,logout;I32 pressed;MojangConnector *connector;MC022DrawHost *host;U0 *ctx;U0 (*invalidate)(U0*,MCString*);};
U0 LoginOption_Init(LoginOption*,MojangConnector*,MC022DrawHost*);U0 LoginOption_tick(LoginOption*);U0 LoginOption_setupPositions(LoginOption*);
U0 LoginOption_mouseClicked(LoginOption*,I32,I32);U0 LoginOption_mouseReleased(LoginOption*,I32,I32);
