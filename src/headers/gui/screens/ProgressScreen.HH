// Batch022: gui/screens/ProgressScreen; explicit host ABI, see docs/BATCH022.md.
class ProgressScreen {I32 ticks,width,height;MC022Box cancel;MC022DrawHost *host;};
U0 ProgressScreen_Init(ProgressScreen*,I32,I32,MC022DrawHost*);U0 ProgressScreen_tick(ProgressScreen*,I32);Bool ProgressScreen_handleBackEvent(ProgressScreen*,Bool,I32);U0 ProgressScreen_buttonClicked(ProgressScreen*,I32,I32);
U0 ProgressScreen_render(ProgressScreen*,I32,Bool,I32,I32,U8*,F64);
