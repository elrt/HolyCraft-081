// The source .cpp only includes the header; inline getItem is implemented here.
MCRecipeItem *CraftingContainer_getItem(CraftingContainer *self,I32 x,I32 y) { if(x<0 || x>=self->width)return NULL;if(!self->getSlot) { printf("Missing crafting container backend\n");exit(90); }return self->getSlot(self->context,y*self->width+x); }
