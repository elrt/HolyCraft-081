// Batch022: gui/elements/Slider; explicit host ABI, see docs/BATCH022.md.
class Slider {MC022Box bounds;MCVector steps;Bool step,dragging;F32 progress,minValue,maxValue;I32 value,index;U0 *ctx;F32 (*getProgress)(U0*);I32 (*getInt)(U0*);U0 (*setProgress)(U0*,F32);U0 (*setInt)(U0*,I32);MC022DrawHost *host;};
U0 Slider_Init(Slider*,F32,F32,F32,MC022DrawHost*);U0 Slider_InitSteps(Slider*,I32*,I32,I32,MC022DrawHost*);U0 Slider_Destroy(Slider*);
U0 Slider_mouseClicked(Slider*,I32,I32);U0 Slider_mouseReleased(Slider*);U0 Slider_tick(Slider*,I32,Bool);U0 Slider_setOption(Slider*);U0 Slider_render(Slider*,I32,Bool);
