// Batch 005. Source: minecraftpe/impl/rendering/model/Model.cpp
U0 Model_clear(Model *self) { I64 i;ModelPart *part;for(i=0;i<self->parts.size;i++) { part=self->parts.data[i];MeshBuffer_reset(&part->meshBuffer); } }
