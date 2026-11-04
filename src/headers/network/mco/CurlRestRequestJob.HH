// Batch022: network/mco/CurlRestRequestJob; explicit host ABI, see docs/BATCH022.md.
class CurlRestRequestJob: RestRequestJob {};
U0 CurlRestRequestJob_Init(RestRequestJob*,RestService*,I32,MCRestBackend022*);
U0 CurlRestRequestJob_run(RestRequestJob*);U0 CurlRestRequestJob_stop(RestRequestJob*);U0 CurlRestRequestJob_finish(RestRequestJob*);
Bool CurlRestRequestJob_isRunning(RestRequestJob*);
U0 CurlRestRequestJob_onRequestComplete(RestRequestJob*,I32,MCString*);
