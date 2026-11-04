U0 User_Init(User *s,U8 *name,U8 *extra){MCString_FromC(&s->username,name);MCString_FromC(&s->str2,extra);}U0 User_Destroy(User *s){MCString_Destroy(&s->username);MCString_Destroy(&s->str2);}
