// Batch022: gui/OptionsGroup; explicit host ABI, see docs/BATCH022.md.
class MC022OptionRow {MC022Box box;I32 type;U0 *ctx;U0 (*layout)(U0*,MC022Box*);};
class OptionsGroup {MC022Box bounds;MCString title;MCVector rows;MC022DrawHost *host;};
U0 OptionsGroup_Init(OptionsGroup*,MCString*,MC022DrawHost*);U0 OptionsGroup_Destroy(OptionsGroup*);
Bool OptionsGroup_addOption(OptionsGroup*,I32,Bool,I32,U0*,U0(*layout)(U0*,MC022Box*));
U0 OptionsGroup_setupPositions(OptionsGroup*);U0 OptionsGroup_render(OptionsGroup*);
