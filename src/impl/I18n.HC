// Batch 018. Source: minecraftpe/impl/I18n.cpp.
U0 I18n_Init(){MCVector_Init(&I18n_strings018,sizeof(MCI18nEntry018));}
U0 I18n_Clear018(){I64 i;MCI18nEntry018 *e;for(i=0;i<I18n_strings018.size;i++){e=MCVector_At(&I18n_strings018,i);MCString_Destroy(&e->key);MCString_Destroy(&e->value);}I18n_strings018.size=0;}
U0 I18n_Destroy(){I18n_Clear018();MCVector_Destroy(&I18n_strings018);}
MCI18nEntry018 *I18n_Find018(MCString *key){I64 i;MCI18nEntry018 *e;for(i=0;i<I18n_strings018.size;i++){e=MCVector_At(&I18n_strings018,i);if(MCString_Equal(&e->key,key))return e;}return NULL;}
Bool I18n_getInto(MCString *key,MCString *initializedOut){MCI18nEntry018 *e=I18n_Find018(key);if(!e)return FALSE;MCString_Assign(initializedOut,&e->value);return TRUE;}
U0 I18n_get(MCString *out,MCString *key){MCI18nEntry018 *e=I18n_Find018(key);if(e)MCString_CopyInit(out,&e->value);else{MCString_CopyInit(out,key);MCString_AppendChar017(out,'<');}}
U0 I18n_fillTranslations(MCI18nAssetHost018 *host,MCString *path,Bool ignored){
 MCString data,line,key,val;MCI18nEntry018 e;I64 start=0,end,eq;
 if(!host->readAsset(host->ctx,path,&data))return;
 while(start<data.size){end=start;while(end<data.size && data.data[end]!='\n')end++;MCString_FromBytes(&line,data.data+start,end-start);
  eq=MCString_FindChar017(&line,'=',0);if(eq>=0){MCString sub;MCString_Sub017(&sub,&line,0,eq);Util_stringTrim(&key,&sub);MCString_Destroy(&sub);
   if(!I18n_Find018(&key)){MCString_Sub017(&sub,&line,eq+1,line.size-eq-1);Util_stringTrim(&val,&sub);MCString_Destroy(&sub);e.key=key;e.value=val;MCVector_Push(&I18n_strings018,&e);}else MCString_Destroy(&key);
  }MCString_Destroy(&line);start=end+1;
 }MCString_Destroy(&data);
}
U0 I18n_loadLanguage(MCI18nAssetHost018 *host,MCString *language){MCString path,en;I18n_Clear018();MCString_FromC(&path,"lang/en_US.lang");I18n_fillTranslations(host,&path,TRUE);MCString_Destroy(&path);MCString_FromC(&en,"en_US");if(MCString_Equal(language,&en)){MCString_FromC(&path,"lang/");MCString_AppendStr017(&path,language);MCString_AppendBytes017(&path,".lang",5);I18n_fillTranslations(host,&path,TRUE);MCString_Destroy(&path);}MCString_Destroy(&en);}
U0 I18n_GetLiteral018(MCString *out,U8 *literal){MCString k;MCString_FromC(&k,literal);I18n_get(out,&k);MCString_Destroy(&k);}
U0 I18n_getDescriptionString(MCString *out,MCI18nItem018 *item,MCI18nTileIds018 *tiles){
 MCString original,key,result,pat,repl,fallback;U8 *words[9]={"wood","iron","stone","diamond","gold","brick","emerald","lapis","cloth"};U8 *specials[6]={"tile.workbench","craftingtable","tile.quartzBlockChiseled","quartzBlockChiseled","tile.quartzBlockPillar","quartzBlockPillar"};I32 i;
 if(item->tileClass==tiles->cloth && tiles->cloth){if(item->aux)I18n_GetLiteral018(out,"desc.wool");else I18n_GetLiteral018(out,"desc.woolstring");return;}
 if(item->tileClass==tiles->fenceGate && item->tileClass){I18n_GetLiteral018(out,"desc.fence");return;}
 if(item->tileClass==tiles->stoneSlabHalf && item->tileClass){I18n_GetLiteral018(out,"desc.slab");return;}
 MCString_CopyInit(&original,item->descriptionId);Util_toLower(&key,&original);
 // std::string::operator[](size()) supplies the terminating zero for empty strings.
 if(key.size && (key.data[0]=='t' || key.data[0]=='i')){if(key.data[0]=='t')MCString_FromC(&pat,"tile.");else MCString_FromC(&pat,"item.");MCString_FromC(&repl,"desc.");Util_stringReplace(&key,&pat,&repl,-1);MCString_Destroy(&pat);MCString_Destroy(&repl);}
 MCString_FromC(&result,"");if(!I18n_getInto(&key,&result)){Util_removeAll(&key,words,9);if(!I18n_getInto(&key,&result)){for(i=0;i<6;i+=2){MCString_FromC(&pat,specials[i]);if(MCString_Equal(&original,&pat)){MCString_FromC(&fallback,"desc.");MCString_AppendBytes017(&fallback,specials[i+1],MC_StrLen(specials[i+1]));if(I18n_getInto(&fallback,&result)){MCString_Destroy(&fallback);MCString_Destroy(&pat);break;}MCString_Destroy(&fallback);}MCString_Destroy(&pat);}if(i==6){MCString_Assign(&result,&original);MCString_AppendBytes017(&result," : couldn't find desc",21);}}}
 *out=result;MCString_Destroy(&key);MCString_Destroy(&original);
}
