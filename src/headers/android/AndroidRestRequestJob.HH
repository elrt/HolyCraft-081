// Batch022: android/AndroidRestRequestJob; explicit host ABI, see docs/BATCH022.md.
class AndroidRestRequestJob: RestRequestJob {};
U0 AndroidRestRequestJob_Init(RestRequestJob*,RestService*,I32,MCRestBackend022*);
U0 AndroidRestRequestJob_onRequestComplete(RestRequestJob*,I32,I32,MCString*);
U0 AndroidRestRequestJob_run(RestRequestJob*);U0 AndroidRestRequestJob_stop(RestRequestJob*);U0 AndroidRestRequestJob_finish(RestRequestJob*);
Bool AndroidRestRequestJob_isRunning(RestRequestJob*);

I32 MC022_NextId();
