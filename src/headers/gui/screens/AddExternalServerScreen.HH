// Batch022: gui/screens/AddExternalServerScreen; explicit host ABI, see docs/BATCH022.md.
class MC022ExternalServer {MCString name,address,port;};
class AddExternalServerScreen {I32 width,height;MC022Box back,header,add,nameLabel,nameBox,addressLabel,addressBox,portLabel,portBox,info;MC022ExternalServer server;MC022DrawHost *host;};
U0 AddExternalServerScreen_Init(AddExternalServerScreen*,I32,I32,MC022DrawHost*);U0 AddExternalServerScreen_Destroy(AddExternalServerScreen*);U0 AddExternalServerScreen_setupPositions(AddExternalServerScreen*);
Bool AddExternalServerScreen_handleBackEvent(AddExternalServerScreen*,Bool,Bool);Bool AddExternalServerScreen_buttonClicked(AddExternalServerScreen*,I32);

U0 AddExternalServerScreen_render(AddExternalServerScreen*,Bool);
