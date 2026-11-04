// Original base methods are no-ops; null callbacks represent those defaults.
U0 LevelListener_tileBrightnessChanged(LevelListener012 *s,I32 x,I32 y,I32 z){if(s->tileChanged)s->tileChanged(s->host,x,y,z);}
