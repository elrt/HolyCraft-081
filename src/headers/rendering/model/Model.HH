// Batch 005. Source: minecraftpe/headers/rendering/model/Model.hpp
#ifndef MCPE_HEADERS_RENDERING_MODEL_MODEL_HPP
#define MCPE_HEADERS_RENDERING_MODEL_MODEL_HPP
class ModelPart;
class Model { F32 field_0; I8 field_4,field_5,field_6,field_7; MCPtrVector parts; I8 field_14,field_15,field_16,field_17;
U0 (*renderFn)(Model *self,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8);
U0 (*simpleFn)(Model *self);
U0 (*animFn)(Model *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
U0 (*horribleFn)(Model *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7);
U0 (*prepareFn)(Model *self,MCModelEntity *entity,F32 a3,F32 a4,F32 a5);
};
U0 Model_Init(Model *self) { memset(self,0,sizeof(Model));MCPtrVector_Init(&self->parts);self->field_14=1;if(!MC_modelPlatform.add || !MC_modelPlatform.remove)MCModelMissing();MC_modelPlatform.add(self,1.0); }
U0 Model_Destroy(Model *self) { if(!MC_modelPlatform.remove)MCModelMissing();MC_modelPlatform.remove(self);MCPtrVector_Destroy(&self->parts); }
U0 Model_clear(Model *self);
U0 Model_onAppSuspended(Model *self) { Model_clear(self); }
U0 Model_renderSimple(Model *self) { if(self->simpleFn)self->simpleFn(self); }
U0 Model_render(Model *self,MCModelEntity *entity,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7,F32 a8) { if(self->renderFn)self->renderFn(self,entity,a3,a4,a5,a6,a7,a8);else Model_renderSimple(self); }
U0 Model_setupAnim(Model *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) { if(self->animFn)self->animFn(self,a2,a3,a4,a5,a6,a7); }
U0 Model_renderHorrible(Model *self,F32 a2,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7) { if(self->horribleFn)self->horribleFn(self,a2,a3,a4,a5,a6,a7); }
U0 Model_prepareMobModel(Model *self,MCModelEntity *entity,F32 a3,F32 a4,F32 a5) { if(self->prepareFn)self->prepareFn(self,entity,a3,a4,a5); }

#endif

