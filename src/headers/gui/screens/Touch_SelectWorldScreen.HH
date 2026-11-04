// Batch026 partial source API; not original C++ ABI.
class TouchSelectWorldScreen {SelectWorldScreen select;TouchWorldSelectionList touch;Bool awaitingInput,generated;};
Bool TouchSelectWorldScreen_submit(TouchSelectWorldScreen *s,MCString *name,MCString *seed,MCString *mode,I32 epoch);
U0 TouchSelectWorldScreen_tick(TouchSelectWorldScreen *s,Bool down);
U0 TouchSelectWorldScreen_Init(TouchSelectWorldScreen *s,MCUIHost026 *h,MCUI025 *ui);
U0 TouchSelectWorldScreen_Destroy(TouchSelectWorldScreen *s);
