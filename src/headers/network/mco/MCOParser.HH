// Batch022: network/mco/MCOParser; explicit host ABI, see docs/BATCH022.md.
class MCOParser {I32 lastError;};
U0 MCOParser_parseErrorMessage(MCString*,MCString*,I32*);
Bool MCOParser_parseJoinWorld(MCString*,MCString*,U16*,MCString*);
U0 MCOParser_parseMCOAccountValidSessionReturnValue(MCString*,LoginInformation*);
U0 MCOParser_parseServerList(MCString*,MCVector*);
U0 MCOParser_freeServerList(MCVector*);
U0 MCOParser_parseStatus(MCString*,Bool*,Bool*,Bool*);
