// Batch026 partial source API; not original C++ ABI.
class CustomInputHolder {IInputHolder base;IMoveInput *move;ITurnInput *turn;IBuildInput *build;U0 (*deleteMove)(IMoveInput*);U0 (*deleteTurn)(ITurnInput*);U0 (*deleteBuild)(IBuildInput*);};
U0 CustomInputHolder_Init(CustomInputHolder *s,IMoveInput *m,ITurnInput *t,IBuildInput *b);
U0 CustomInputHolder_Destroy(CustomInputHolder *s);
