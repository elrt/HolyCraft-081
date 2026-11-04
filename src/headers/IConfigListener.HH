// Batch 002. Source: minecraftpe/headers/IConfigListener.hpp
#ifndef MCPE_HEADERS_ICONFIGLISTENER_HPP
#define MCPE_HEADERS_ICONFIGLISTENER_HPP
class IConfigListener {
 U0 (*configFn)(IConfigListener *self,U0 *config);
 U0 (*destroyFn)(IConfigListener *self);
};
U0 IConfigListener_onConfigChanged(IConfigListener *self,U0 *config) { self->configFn(self,config); }
U0 IConfigListener_Destroy(IConfigListener *self) { if(self->destroyFn) self->destroyFn(self); }
U0 IConfigListener_NoConfig(IConfigListener *self,U0 *config) {}
U0 IConfigListener_Init(IConfigListener *self,U0 (*config)(IConfigListener *self,U0 *config),U0 (*destroy)(IConfigListener *self)) { self->configFn=config; self->destroyFn=destroy; }

#endif

