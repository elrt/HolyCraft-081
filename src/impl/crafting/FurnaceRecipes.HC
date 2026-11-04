// Batch 007: minecraftpe/impl/crafting/FurnaceRecipes.cpp
U0 FurnaceRecipes_addFurnaceRecipe(FurnaceRecipes *self,I32 input,MCRecipeItem *output) {
 I64 i;MCFurnaceEntry *e;for(i=0;i<self->recipes.size;i++){e=MCVector_At(&self->recipes,i);if(e->input==input)return;if(e->input>input)break;}
 MCFurnaceEntry next;next.input=input;next.output=*output;MCVector_Insert(&self->recipes,i,&next);
}
U0 FurnaceRecipes_AddDefault(FurnaceRecipes *self,I32 input,I32 output,I32 aux) { MCRecipeItem it;it.id=output;it.count=1;it.aux=aux;it.damageable=FALSE;FurnaceRecipes_addFurnaceRecipe(self,input,&it); }
U0 FurnaceRecipes_Init(FurnaceRecipes *self,MCFurnaceRegistry *r) {
 if(!r) { printf("Missing furnace registry\n");exit(90); }MCVector_Init(&self->recipes,sizeof(MCFurnaceEntry));
 FurnaceRecipes_AddDefault(self,r->ironOre,r->ironIngot,0);FurnaceRecipes_AddDefault(self,r->goldOre,r->goldIngot,0);FurnaceRecipes_AddDefault(self,r->emeraldOre,r->emerald,0);FurnaceRecipes_AddDefault(self,r->sand,r->glass,0);
 FurnaceRecipes_AddDefault(self,r->porkRaw,r->porkCooked,0);FurnaceRecipes_AddDefault(self,r->beefRaw,r->beefCooked,0);FurnaceRecipes_AddDefault(self,r->chickenRaw,r->chickenCooked,0);FurnaceRecipes_AddDefault(self,r->stoneBrick,r->rock,0);
 FurnaceRecipes_AddDefault(self,r->clay,r->brick,0);FurnaceRecipes_AddDefault(self,r->cactus,r->dyePowder,2);FurnaceRecipes_AddDefault(self,r->mushroom2,r->dyePowder,1);FurnaceRecipes_AddDefault(self,r->treeTrunk,r->coal,1);FurnaceRecipes_AddDefault(self,r->netherrack,r->netherbrick,0);FurnaceRecipes_AddDefault(self,r->potato,r->potatoBaked,0);
}
U0 FurnaceRecipes_Destroy(FurnaceRecipes *self) { MCVector_Destroy(&self->recipes); }
FurnaceRecipes *FurnaceRecipes_getInstance() { if(!FurnaceRecipes_instance) { if(!MC_furnaceRegistryReady){printf("Missing furnace registry\n");exit(90);}FurnaceRecipes_instance=MC_Alloc(sizeof(FurnaceRecipes));FurnaceRecipes_Init(FurnaceRecipes_instance,&MC_furnaceRegistry); }return FurnaceRecipes_instance; }
U0 FurnaceRecipes_teardownFurnaceRecipes() { if(FurnaceRecipes_instance) { FurnaceRecipes_Destroy(FurnaceRecipes_instance);free(FurnaceRecipes_instance);FurnaceRecipes_instance=NULL; } }
U0 FurnaceRecipes_getResult(FurnaceRecipes *self,I32 input,MCRecipeItem *out) { I64 i;MCFurnaceEntry *e;for(i=0;i<self->recipes.size;i++){e=MCVector_At(&self->recipes,i);if(e->input==input){*out=e->output;return;}}memset(out,0,sizeof(MCRecipeItem)); }
Bool FurnaceRecipes_isFurnaceItem(FurnaceRecipes *self,I32 input) { I64 i;MCFurnaceEntry *e;for(i=0;i<self->recipes.size;i++){e=MCVector_At(&self->recipes,i);if(e->input==input)return TRUE;}return FALSE; }
U0 FurnaceRecipes_getRecipes(FurnaceRecipes *self) { }
