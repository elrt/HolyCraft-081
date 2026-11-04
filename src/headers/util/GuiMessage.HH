// Batch 002. Source: minecraftpe/headers/util/GuiMessage.hpp
#ifndef MCPE_HEADERS_UTIL_GUIMESSAGE_HPP
#define MCPE_HEADERS_UTIL_GUIMESSAGE_HPP
class GuiMessage { I32 tickCounter,ticksShown; MCString message,author,fullMessage; };
U0 GuiMessage_Init(GuiMessage *self,MCString *author,MCString *message,I32 ticks) {
 self->tickCounter=0; self->ticksShown=ticks; MCString_CopyInit(&self->message,message); MCString_CopyInit(&self->author,author);
 if(author->size) {
  self->fullMessage.size=author->size+message->size+3; self->fullMessage.data=MC_Alloc(self->fullMessage.size+1);
  self->fullMessage.data[0]=60; memcpy(self->fullMessage.data+1,author->data,author->size);
  self->fullMessage.data[author->size+1]=62; self->fullMessage.data[author->size+2]=32;
  if(message->size) memcpy(self->fullMessage.data+author->size+3,message->data,message->size); self->fullMessage.data[self->fullMessage.size]=0;
 } else MCString_CopyInit(&self->fullMessage,message);
}
U0 GuiMessage_Destroy(GuiMessage *self) { MCString_Destroy(&self->message); MCString_Destroy(&self->author); MCString_Destroy(&self->fullMessage); }
U0 GuiMessage_CopyInit(GuiMessage *self,GuiMessage *other) {
 self->tickCounter=other->tickCounter; self->ticksShown=other->ticksShown;
 MCString_CopyInit(&self->message,&other->message); MCString_CopyInit(&self->author,&other->author); MCString_CopyInit(&self->fullMessage,&other->fullMessage);
}
U0 GuiMessage_MoveInit(GuiMessage *self,GuiMessage *other) {
 self->tickCounter=other->tickCounter; self->ticksShown=other->ticksShown;
 MCString_MoveInit(&self->message,&other->message); MCString_MoveInit(&self->author,&other->author); MCString_MoveInit(&self->fullMessage,&other->fullMessage);
}
GuiMessage *GuiMessage_Assign(GuiMessage *self,GuiMessage *other) {
 self->tickCounter=other->tickCounter; self->ticksShown=other->ticksShown;
 MCString_Assign(&self->message,&other->message); MCString_Assign(&self->author,&other->author); MCString_Assign(&self->fullMessage,&other->fullMessage); return self;
}
GuiMessage *GuiMessage_MoveAssign(GuiMessage *self,GuiMessage *other) { if(self!=other) { GuiMessage_Destroy(self); GuiMessage_MoveInit(self,other); } return self; }

#endif

