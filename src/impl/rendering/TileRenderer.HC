// See docs/BATCH027.md: partial original methods, not full AO/special render dispatch.
U0 TileRenderer_Init(TileRenderer *s,Level *l,Tesselator *t){memset(s,0,sizeof(TileRenderer));s->level=l;s->tess=t;}
U0 MC027_RenderView(MCRenderTile027 *v,Tile *tile,I32 kind,TextureUVCoordinateSet *uv){memset(v,0,sizeof(MCRenderTile027));v->base=tile;v->id=tile->id;v->kind=kind;v->color=0xFFFFFF;v->minX=tile->shape.x1;v->minY=tile->shape.y1;v->minZ=tile->shape.z1;v->maxX=tile->shape.x2;v->maxY=tile->shape.y2;v->maxZ=tile->shape.z2;I32 i;for(i=0;i<6;i++)v->uv[i]=uv[i];}
U0 MC027_Vertex(TileRenderer *s,F32 x,F32 y,F32 z,F32 u,F32 v){if(s->tess->vertices.size>=65532){s->overflow=TRUE;return;}Tesselator_vertexUV(s->tess,x,y,z,u,v);}
U0 MC027_Color(TileRenderer *s,F32 r,F32 g,F32 b){Tesselator_color(s->tess,r*255,g*255,b*255,255);}
U0 MC027_Normal(TileRenderer *s,F32 x,F32 y,F32 z){Tesselator_normal(s->tess,x,y,z);}
F32 MC027_Brightness(TileRenderer *s,I32 x,I32 y,I32 z){return MC025_LevelValue(s->level,MC023_LIGHT,x,y,z);}
U0 TileRenderer_renderEast(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6){
	F32 minX;	 
	F32 maxX;	 
	F32 v13;	 
	F32 maxZ;	 
	F32 minZ;	 
	F32 maxY;	 
	F32 v17;	 
	F32 minY;	 
	F32 v19;	 
	F32 v20;	 
	F32 v21;	 
	F32 v22;	 
	F32 v23;	 
	I32 v24; 
	F32 v25;	 
	F32 v26;	 
	F32 v27;	 
	F32 v28;	 
	F32 v29;	 
	F32 v30;	 
	F32 v31;	 
	F32 v32;	 
	F32 v33;	 
	F32 v34;	 
	F32 v35;	 
	F32 v36;	 
	F32 v37;	 
	F32 v38;	 
	F32 v39;	 
	F32 v40;	 
	F32 v41;	 
	F32 v42;	 
	F32 v43;	 
	F32 v44;	 
	TextureUVCoordinateSet* a6 = _a6;
	if(s->hasUVCoords) {
		a6 = &s->field_8;
	}
	minX = a6->minX;
	maxX = a6->maxX;
	v13 = maxX - a6->minX;
	maxZ = a2->maxZ;
	minZ = a2->minZ;
	maxY = a2->maxY;
	v17 = a6->maxY;
	minY = a6->minY;
	v19 = a6->minX + ((minZ * v13))(F32);
	v20 = a6->minX + ((maxZ * v13))(F32);
	v21 = a2->minY;
	if(s->field_21) {
		v22 = v19;
		v19 = v20;
		v20 = v22;
	}
	if(minZ >= 0.0f && maxZ <= 1.0f) {
		maxX = v20;
		minX = v19;
	}
	if(v21 >= 0.0f && maxY <= 1.0f) {
		v23 = v17 - minY;
		v17 = v17 - ((v21 * ((v17 - minY))(F32)))(F32);
		minY = a6->maxY - ((maxY * v23))(F32);
	}
	TileRenderer_randomize(s,a2, 5, a3, a4, a5);
	v24 = s->randomizeFace[5];
	if(v24 == 2) {
		v25 = a6->maxX - a6->minX;
		v26 = a6->maxY;
		minX = a6->minX + ((v25 * a2->minY))(F32);
		v27 = v26 - a6->minY;
		maxX = a6->minX + ((v25 * a2->maxY))(F32);
		v28 = v26 - ((v27 * a2->minZ))(F32);
		v29 = a6->maxY - ((v27 * a2->maxZ))(F32);
		v30 = maxX;
		v31 = minX;
		v17 = v28;
		minY = v29;
	} else if(v24 == 1) {
		v32 = a6->maxX;
		v33 = a6->minY;
		v34 = v32 - a6->minX;
		v35 = a6->maxY - v33;
		minY = v33 + ((v35 * a2->maxZ))(F32);
		v17 = v33 + ((v35 * a2->minZ))(F32);
		v30 = v32 - ((v34 * a2->maxY))(F32);
		v31 = v32 - ((v34 * a2->minY))(F32);
		v29 = a6->minY + ((v35 * a2->maxZ))(F32);
		v28 = v17;
		maxX = a6->maxX - ((v34 * a2->maxY))(F32);
		minX = v31;
	} else {
		if(v24 == 3) {
			v36 = a6->maxX;
			v37 = v36 - a6->minX;
			v38 = a6->minY;
			minX = v36 - ((v37 * a2->minZ))(F32);
			maxX = v36 - ((v37 * a2->maxZ))(F32);
			v39 = a6->maxY - v38;
			minY = v38 + ((v39 * a2->maxY))(F32);
			v17 = v38 + ((v39 * a2->minY))(F32);
		}
		v29 = v17;
		v28 = minY;
		v30 = minX;
		v31 = maxX;
	}
	v40 = a3 + a2->maxX;
	v41 = a4 + a2->minY;
	v42 = a5 + a2->minZ;
	v43 = a4 + a2->maxY;
	v44 = a5 + a2->maxZ;
	if(s->field_0) {
		MC027_Normal(s,1,0,0);
	}
	if (s->enableAO){
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v40, v41, v44, v30, v29);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v40, v41, v42, maxX, v17);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v40, v43, v42, v31, v28);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
	}else{
		MC027_Vertex(s,v40, v41, v44, v30, v29);
		MC027_Vertex(s,v40, v41, v42, maxX, v17);
		MC027_Vertex(s,v40, v43, v42, v31, v28);
	}
	MC027_Vertex(s,v40, v43, v44, minX, minY);
}
U0 TileRenderer_renderFaceDown(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6){
	F32 minX;	 
	F32 v12;	 
	F32 maxX;	 
	F32 v14;	 
	F32 minZ;	 
	F32 minY;	 
	F32 maxY;	 
	F32 maxZ;	 
	F32 v19;	 
	F32 v20;	 
	I32 v21; 
	F32 v22;	 
	F32 v23;	 
	F32 v24;	 
	F32 v25;	 
	F32 v26;	 
	F32 v27;	 
	F32 v28;	 
	F32 v29;	 
	F32 v30;	 
	F32 v31;	 
	F32 v32;	 
	F32 v33;	 
	F32 v34;	 
	F32 v35;	 
	F32 v36;	 
	F32 v37;	 
	F32 v38;	 
	F32 v39;	 
	F32 v40;	 
	F32 v41;	 
	TextureUVCoordinateSet* a6 = _a6;
	if(s->hasUVCoords) {
		a6 = &s->field_8;
	}
	minX = a2->minX;
	v12 = a6->minX;
	maxX = a6->maxX;
	v14 = a2->maxX;
	minZ = a2->minZ;
	minY = a6->minY;
	maxY = a6->maxY;
	maxZ = a2->maxZ;
	if(minX >= 0.0f && v14 <= 1.0f) {
		v19 = maxX - v12;
		v12 = v12 + ((minX * ((maxX - v12))(F32)))(F32);
		maxX = a6->minX + ((v14 * v19))(F32);
	}
	if(minZ >= 0.0f && maxZ <= 1.0f) {
		v20 = maxY - minY;
		minY = minY + ((minZ * ((maxY - minY))(F32)))(F32);
		maxY = a6->minY + ((maxZ * v20))(F32);
	}
	TileRenderer_randomize(s,a2, 0, a3, a4, a5);
	v21 = s->randomizeFace[0];
	if(v21 == 2) {
		v22 = a6->maxX - a6->minX;
		v23 = a6->maxY;
		v12 = a6->minX + ((v22 * a2->minZ))(F32);
		v24 = v23 - a6->minY;
		maxX = a6->minX + ((v22 * a2->maxZ))(F32);
		v25 = v23 - ((v24 * a2->maxX))(F32);
		v26 = a6->maxY - ((v24 * a2->minX))(F32);
		v27 = maxX;
		v28 = v12;
		maxY = v25;
		minY = v26;
	} else if(v21 == 1) {
		v29 = a6->maxX;
		v30 = a6->minY;
		v31 = v29 - a6->minX;
		v32 = a6->maxY - v30;
		minY = v30 + ((v32 * a2->minX))(F32);
		maxY = v30 + ((v32 * a2->maxX))(F32);
		v27 = v29 - ((v31 * a2->maxZ))(F32);
		v28 = v29 - ((v31 * a2->minZ))(F32);
		v26 = a6->minY + ((v32 * a2->minX))(F32);
		v25 = maxY;
		maxX = a6->maxX - ((v31 * a2->maxZ))(F32);
		v12 = v28;
	} else {
		if(v21 == 3) {
			v33 = a6->maxX;
			v34 = v33 - a6->minX;
			v35 = a6->maxY;
			v12 = v33 - ((v34 * a2->minX))(F32);
			maxX = v33 - ((v34 * a2->maxX))(F32);
			v36 = v35 - a6->minY;
			minY = v35 - ((v36 * a2->minZ))(F32);
			maxY = v35 - ((v36 * a2->maxZ))(F32);
		}
		v26 = maxY;
		v25 = minY;
		v27 = v12;
		v28 = maxX;
	}
	v37 = a3 + a2->minX;
	v38 = a3 + a2->maxX;
	v39 = a4 + a2->minY;
	v40 = a5 + a2->minZ;
	v41 = a5 + a2->maxZ;
	if(s->field_0) {
		MC027_Normal(s,0,-1,0);
	}
	if(s->enableAO) {
		
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v37, v39, v41, v27, v26);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v37, v39, v40, v12, minY);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v38, v39, v40, v28, v25);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
	} else {
		MC027_Vertex(s,v37, v39, v41, v27, v26);
		MC027_Vertex(s,v37, v39, v40, v12, minY);
		MC027_Vertex(s,v38, v39, v40, v28, v25);
	}
	MC027_Vertex(s,v38, v39, v41, maxX, maxY);
}
U0 TileRenderer_renderFaceUp(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6){
	F32 minX;	 
	F32 v12;	 
	F32 maxX;	 
	F32 v14;	 
	F32 minZ;	 
	F32 minY;	 
	F32 maxY;	 
	F32 maxZ;	 
	F32 v19;	 
	F32 v20;	 
	I32 v21; 
	F32 v22;	 
	F32 v23;	 
	F32 v24;	 
	F32 v25;	 
	F32 v26;	 
	F32 v27;	 
	F32 v28;	 
	F32 v29;	 
	F32 v30;	 
	F32 v31;	 
	F32 v32;	 
	F32 v33;	 
	F32 v34;	 
	F32 v35;	 
	F32 v36;	 
	F32 v37;	 
	F32 v38;	 
	F32 v39;	 
	F32 v40;	 
	F32 v41;	 
	TextureUVCoordinateSet* a6 = _a6;
	if(s->hasUVCoords) {
		a6 = &s->field_8;
	}
	minX = a2->minX;
	v12 = a6->minX;
	maxX = a6->maxX;
	v14 = a2->maxX;
	minZ = a2->minZ;
	minY = a6->minY;
	maxY = a6->maxY;
	maxZ = a2->maxZ;
	if(minX >= 0.0f && v14 <= 1.0f) {
		v19 = maxX - v12;
		v12 = v12 + ((minX * ((maxX - v12))(F32)))(F32);
		maxX = a6->minX + ((v14 * v19))(F32);
	}
	if(minZ >= 0.0f && maxZ <= 1.0f) {
		v20 = maxY - minY;
		minY = minY + ((minZ * ((maxY - minY))(F32)))(F32);
		maxY = a6->minY + ((maxZ * v20))(F32);
	}
	TileRenderer_randomize(s,a2, 1, a3, a4, a5);
	v21 = s->randomizeFace[1];
	if(v21 == 1) {
		v22 = a6->maxX - a6->minX;
		v23 = a6->maxY;
		v12 = a6->minX + ((v22 * a2->minZ))(F32);
		v24 = v23 - a6->minY;
		maxX = a6->minX + ((v22 * a2->maxZ))(F32);
		v25 = v23 - ((v24 * a2->maxX))(F32);
		v26 = a6->maxY - ((v24 * a2->minX))(F32);
		v27 = maxX;
		v28 = v12;
		maxY = v25;
		minY = v26;
	} else if(v21 == 2) {
		v29 = a6->maxX;
		v30 = a6->minY;
		v31 = v29 - a6->minX;
		v32 = a6->maxY - v30;
		minY = v30 + ((v32 * a2->minX))(F32);
		maxY = v30 + ((v32 * a2->maxX))(F32);
		v27 = v29 - ((v31 * a2->maxZ))(F32);
		v28 = v29 - ((v31 * a2->minZ))(F32);
		v26 = a6->minY + ((v32 * a2->minX))(F32);
		v25 = maxY;
		maxX = a6->maxX - ((v31 * a2->maxZ))(F32);
		v12 = v28;
	} else {
		if(v21 == 3) {
			v33 = a6->maxX;
			v34 = v33 - a6->minX;
			v35 = a6->maxY;
			v12 = v33 - ((v34 * a2->minX))(F32);
			maxX = v33 - ((v34 * a2->maxX))(F32);
			v36 = v35 - a6->minY;
			minY = v35 - ((v36 * a2->minZ))(F32);
			maxY = v35 - ((v36 * a2->maxZ))(F32);
		}
		v26 = maxY;
		v25 = minY;
		v27 = v12;
		v28 = maxX;
	}
	v37 = a3 + a2->minX;
	v38 = a4 + a2->maxY;
	v39 = a3 + a2->maxX;
	v40 = a5 + a2->minZ;
	v41 = a5 + a2->maxZ;
	if(s->field_0) {
		MC027_Normal(s,0,1,0);
	}

	if(s->enableAO) {
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v39, v38, v41, maxX, maxY);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v39, v38, v40, v28, v25);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v37, v38, v40, v12, minY);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
	} else {
		MC027_Vertex(s,v39, v38, v41, maxX, maxY);
		MC027_Vertex(s,v39, v38, v40, v28, v25);
		MC027_Vertex(s,v37, v38, v40, v12, minY);
	}
	MC027_Vertex(s,v37, v38, v41, v27, v26);
}
U0 TileRenderer_renderNorth(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6){
	F32 minX;	 
	F32 maxX;	 
	F32 v13;	 
	F32 v14;	 
	F32 v15;	 
	F32 maxY;	 
	F32 v17;	 
	F32 minY;	 
	F32 v19;	 
	F32 v20;	 
	F32 v21;	 
	F32 v22;	 
	F32 v23;	 
	I32 v24; 
	F32 v25;	 
	F32 v26;	 
	F32 v27;	 
	F32 v28;	 
	F32 v29;	 
	F32 v30;	 
	F32 v31;	 
	F32 v32;	 
	F32 v33;	 
	F32 v34;	 
	F32 v35;	 
	F32 v36;	 
	F32 v37;	 
	F32 v38;	 
	F32 v39;	 
	F32 v40;	 
	F32 v41;	 
	F32 v42;	 
	F32 v43;	 
	F32 v44;	 
	TextureUVCoordinateSet* a6 = _a6;
	if(s->hasUVCoords) {
		a6 = &s->field_8;
	}
	minX = a6->minX;
	maxX = a6->maxX;
	v13 = maxX - a6->minX;
	v14 = a2->maxX;
	v15 = a2->minX;
	maxY = a2->maxY;
	v17 = a6->maxY;
	minY = a6->minY;
	v19 = a6->minX + ((v15 * v13))(F32);
	v20 = a6->minX + ((v14 * v13))(F32);
	v21 = a2->minY;
	if(s->field_21) {
		v22 = v19;
		v19 = v20;
		v20 = v22;
	}
	if(v15 >= 0.0f && v14 <= 1.0f) {
		maxX = v20;
		minX = v19;
	}
	if(v21 >= 0.0f && maxY <= 1.0f) {
		v23 = v17 - minY;
		v17 = v17 - ((v21 * ((v17 - minY))(F32)))(F32);
		minY = a6->maxY - ((maxY * v23))(F32);
	}
	TileRenderer_randomize(s,a2, 2, a3, a4, a5);
	v24 = s->randomizeFace[2];
	if(v24 == 2) {
		v25 = a6->maxX - a6->minX;
		v26 = a6->maxY;
		minX = a6->minX + ((v25 * a2->minY))(F32);
		v27 = v26 - a6->minY;
		maxX = a6->minX + ((v25 * a2->maxY))(F32);
		v28 = v26 - ((v27 * a2->minX))(F32);
		v29 = a6->maxY - ((v27 * a2->maxX))(F32);
		v30 = maxX;
		v31 = minX;
		v17 = v28;
		minY = v29;
	} else if(v24 == 1) {
		v32 = a6->maxX;
		v33 = a6->minY;
		v34 = v32 - a6->minX;
		v35 = a6->maxY - v33;
		minY = v33 + ((v35 * a2->maxX))(F32);
		v17 = v33 + ((v35 * a2->minX))(F32);
		v30 = v32 - ((v34 * a2->maxY))(F32);
		v31 = v32 - ((v34 * a2->minY))(F32);
		v29 = a6->minY + ((v35 * a2->maxX))(F32);
		v28 = v17;
		maxX = a6->maxX - ((v34 * a2->maxY))(F32);
		minX = v31;
	} else {
		if(v24 == 3) {
			v36 = a6->maxX;
			v37 = v36 - a6->minX;
			v38 = a6->minY;
			minX = v36 - ((v37 * a2->minX))(F32);
			maxX = v36 - ((v37 * a2->maxX))(F32);
			v39 = a6->maxY - v38;
			minY = v38 + ((v39 * a2->maxY))(F32);
			v17 = v38 + ((v39 * a2->minY))(F32);
		}
		v29 = v17;
		v28 = minY;
		v30 = minX;
		v31 = maxX;
	}
	v40 = a3 + a2->minX;
	v41 = a3 + a2->maxX;
	v42 = a4 + a2->minY;
	v43 = a4 + a2->maxY;
	v44 = a5 + a2->minZ;
	if(s->field_0) {
		MC027_Normal(s,0,0,-1);
	}
	if(s->enableAO) {
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v40, v43, v44, v31, v28);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v41, v43, v44, minX, minY);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v41, v42, v44, v30, v29);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
		MC027_Vertex(s,v40, v42, v44, maxX, v17);
	} else {
		MC027_Vertex(s,v40, v43, v44, v31, v28);
		MC027_Vertex(s,v41, v43, v44, minX, minY);
		MC027_Vertex(s,v41, v42, v44, v30, v29);
		MC027_Vertex(s,v40, v42, v44, maxX, v17);
	}
}
U0 TileRenderer_renderSouth(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *a6){ 
	TextureUVCoordinateSet* v10;																		  
	F32 minX;																							  
	F32 maxX;																							  
	F32 v13;																							  
	F32 v14;																							  
	F32 v15;																							  
	F32 maxY;																							  
	F32 v17;																							  
	F32 minY;																							  
	F32 v19;																							  
	F32 v20;																							  
	F32 v21;																							  
	F32 v22;																							  
	F32 v23;																							  
	I32 v24;																						  
	F32 v25;																							  
	F32 v26;																							  
	F32 v27;																							  
	F32 v28;																							  
	F32 v29;																							  
	F32 v30;																							  
	F32 v31;																							  
	F32 v32;																							  
	F32 v33;																							  
	F32 v34;																							  
	F32 v35;																							  
	F32 v36;																							  
	F32 v37;																							  
	F32 v38;																							  
	F32 v39;																							  
	F32 v40;																							  
	F32 v41;																							  
	F32 v42;																							  
	F32 v43;																							  
	F32 v44;																							  

	if(s->hasUVCoords) {
		v10 = &s->field_8;
	} else {
		v10 = a6;
	}
	minX = v10->minX;
	maxX = v10->maxX;
	v13 = maxX - v10->minX;
	v14 = a2->maxX;
	v15 = a2->minX;
	maxY = a2->maxY;
	v17 = v10->maxY;
	minY = v10->minY;
	v19 = v10->minX + ((v15 * v13))(F32);
	v20 = v10->minX + ((v14 * v13))(F32);
	v21 = a2->minY;
	if(s->field_21) {
		v22 = v19;
		v19 = v20;
		v20 = v22;
	}
	if(v15 >= 0.0f && v14 <= 1.0f) {
		maxX = v20;
		minX = v19;
	}
	if(v21 >= 0.0f && maxY <= 1.0f) {
		v23 = v17 - minY;
		v17 = v17 - ((v21 * ((v17 - minY))(F32)))(F32);
		minY = v10->maxY - ((maxY * v23))(F32);
	}
	TileRenderer_randomize(s,a2, 3, a3, a4, a5);
	v24 = s->randomizeFace[3];
	if(v24 == 1) {
		v25 = v10->maxX - v10->minX;
		v26 = v10->maxY;
		minX = v10->minX + ((v25 * a2->minY))(F32);
		v27 = v26 - v10->minY;
		maxX = v10->minX + ((v25 * a2->maxY))(F32);
		v28 = v26 - ((v27 * a2->minX))(F32);
		v29 = v26 - ((v27 * a2->maxX))(F32);
		v30 = maxX;
		v31 = minX;
		v17 = v29;
		minY = v10->maxY - ((v27 * a2->minX))(F32);
	} else if(v24 == 2) {
		v32 = v10->maxX;
		v33 = v10->minY;
		v34 = v32 - v10->minX;
		v35 = v10->maxY - v33;
		minY = v33 + ((v35 * a2->minX))(F32);
		v17 = v33 + ((v35 * a2->maxX))(F32);
		v30 = v32 - ((v34 * a2->maxY))(F32);
		v31 = v32 - ((v34 * a2->minY))(F32);
		v28 = v10->minY + ((v35 * a2->minX))(F32);
		v29 = v17;
		maxX = v10->maxX - ((v34 * a2->maxY))(F32);
		minX = v31;
	} else {
		if(v24 == 3) {
			v36 = v10->maxX;
			v37 = v36 - v10->minX;
			v38 = v10->minY;
			minX = v36 - ((v37 * a2->minX))(F32);
			maxX = v36 - ((v37 * a2->maxX))(F32);
			v39 = v10->maxY - v38;
			minY = v38 + ((v39 * a2->maxY))(F32);
			v17 = v38 + ((v39 * a2->minY))(F32);
		}
		v28 = v17;
		v29 = minY;
		v30 = minX;
		v31 = maxX;
	}
	v40 = a3 + a2->minX;
	v41 = a3 + a2->maxX;
	v42 = a4 + a2->minY;
	v43 = a4 + a2->maxY;
	v44 = a5 + a2->maxZ;
	if(s->field_0) {
		MC027_Normal(s,0,0,1);
	}
	if(s->enableAO) {
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v40, v43, v44, minX, minY);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v40, v42, v44, v30, v28);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v41, v42, v44, maxX, v17);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
	} else {
		MC027_Vertex(s,v40, v43, v44, minX, minY);
		MC027_Vertex(s,v40, v42, v44, v30, v28);
		MC027_Vertex(s,v41, v42, v44, maxX, v17);
	}
	MC027_Vertex(s,v41, v43, v44, v31, v29);
}
U0 TileRenderer_renderWest(TileRenderer *s,MCRenderTile027 *a2,F32 a3,F32 a4,F32 a5,TextureUVCoordinateSet *_a6){
	F32 minX;	 
	F32 maxX;	 
	F32 v13;	 
	F32 maxZ;	 
	F32 minZ;	 
	F32 maxY;	 
	F32 v17;	 
	F32 minY;	 
	F32 v19;	 
	F32 v20;	 
	F32 v21;	 
	F32 v22;	 
	F32 v23;	 
	I32 v24; 
	F32 v25;	 
	F32 v26;	 
	F32 v27;	 
	F32 v28;	 
	F32 v29;	 
	F32 v30;	 
	F32 v31;	 
	F32 v32;	 
	F32 v33;	 
	F32 v34;	 
	F32 v35;	 
	F32 v36;	 
	F32 v37;	 
	F32 v38;	 
	F32 v39;	 
	F32 v40;	 
	F32 v41;	 
	F32 v42;	 
	F32 v43;	 
	F32 v44;	 
	TextureUVCoordinateSet* a6 = _a6;

	if(s->hasUVCoords) {
		a6 = &s->field_8;
	}
	minX = a6->minX;
	maxX = a6->maxX;
	v13 = maxX - a6->minX;
	maxZ = a2->maxZ;
	minZ = a2->minZ;
	maxY = a2->maxY;
	v17 = a6->maxY;
	minY = a6->minY;
	v19 = a6->minX + ((minZ * v13))(F32);
	v20 = a6->minX + ((maxZ * v13))(F32);
	v21 = a2->minY;
	if(s->field_21) {
		v22 = v19;
		v19 = v20;
		v20 = v22;
	}
	if(minZ >= 0.0f && maxZ <= 1.0f) {
		maxX = v20;
		minX = v19;
	}
	if(v21 >= 0.0f && maxY <= 1.0f) {
		v23 = v17 - minY;
		v17 = v17 - ((v21 * ((v17 - minY))(F32)))(F32);
		minY = a6->maxY - ((maxY * v23))(F32);
	}
	TileRenderer_randomize(s,a2, 4, a3, a4, a5);
	v24 = s->randomizeFace[4];
	if(v24 == 1) {
		v25 = a6->maxX - a6->minX;
		v26 = a6->maxY;
		minX = a6->minX + ((v25 * a2->minY))(F32);
		v27 = v26 - a6->minY;
		maxX = a6->minX + ((v25 * a2->maxY))(F32);
		v28 = v26 - ((v27 * a2->maxZ))(F32);
		v29 = a6->maxY - ((v27 * a2->minZ))(F32);
		v30 = maxX;
		v31 = minX;
		v17 = v28;
		minY = v29;
	} else if(v24 == 2) {
		v32 = a6->maxX;
		v33 = a6->minY;
		v34 = v32 - a6->minX;
		v35 = a6->maxY - v33;
		minY = v33 + ((v35 * a2->minZ))(F32);
		v17 = v33 + ((v35 * a2->maxZ))(F32);
		v30 = v32 - ((v34 * a2->maxY))(F32);
		v31 = v32 - ((v34 * a2->minY))(F32);
		v29 = a6->minY + ((v35 * a2->minZ))(F32);
		v28 = v17;
		maxX = a6->maxX - ((v34 * a2->maxY))(F32);
		minX = v31;
	} else {
		if(v24 == 3) {
			v36 = a6->maxX;
			v37 = v36 - a6->minX;
			v38 = a6->minY;
			minX = v36 - ((v37 * a2->minZ))(F32);
			maxX = v36 - ((v37 * a2->maxZ))(F32);
			v39 = a6->maxY - v38;
			minY = v38 + ((v39 * a2->maxY))(F32);
			v17 = v38 + ((v39 * a2->minY))(F32);
		}
		v29 = v17;
		v28 = minY;
		v30 = minX;
		v31 = maxX;
	}
	v40 = a3 + a2->minX;
	v41 = a4 + a2->minY;
	v42 = a4 + a2->maxY;
	v43 = a5 + a2->minZ;
	v44 = a5 + a2->maxZ;
	if(s->field_0) {
		MC027_Normal(s,-1,0,0);
	}
	if(s->enableAO) {
		MC027_Color(s,s->redXeYs, s->greenXeYs, s->blueXeYs);
		MC027_Vertex(s,v40, v42, v44, v31, v28);
		MC027_Color(s,s->redXsYs, s->greenXsYs, s->blueXsYs);
		MC027_Vertex(s,v40, v42, v43, minX, minY);
		MC027_Color(s,s->redXsYe, s->greenXsYe, s->blueXsYe);
		MC027_Vertex(s,v40, v41, v43, v30, v29);
		MC027_Color(s,s->redXeYe, s->greenXeYe, s->blueXeYe);
	} else {
		MC027_Vertex(s,v40, v42, v44, v31, v28);
		MC027_Vertex(s,v40, v42, v43, minX, minY);
		MC027_Vertex(s,v40, v41, v43, v30, v29);
	}
	MC027_Vertex(s,v40, v41, v44, maxX, v17);
}
U0 TileRenderer_tesselateCrossTexture(TileRenderer *s,MCRenderTile027 *tile,I32 d,F32 a4,F32 a5,F32 a6){
	TextureUVCoordinateSet* v7; 
	F32 maxX;					
	F32 minY;					
	F32 maxY;					
	F32 minX;					

	if(s->hasUVCoords) {
		v7 = &s->field_8;
	} else {
		v7 = (&tile->uv[0]);
	}
	maxX = v7->maxX;
	minY = v7->minY;
	maxY = v7->maxY;
	minX = v7->minX;
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) - 0.45f, v7->minX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) - 0.45f, minX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) + 0.45f, maxX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) + 0.45f, maxX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) + 0.45f, minX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) + 0.45f, minX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) - 0.45f, maxX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) - 0.45f, maxX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) + 0.45f, minX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) + 0.45f, minX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) - 0.45f, maxX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) - 0.45f, maxX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) - 0.45f, minX, minY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) + 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) - 0.45f, minX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 0.0f, ((a6 + 0.5f))(F32) + 0.45f, maxX, maxY);
	MC027_Vertex(s,((a4 + 0.5f))(F32) - 0.45f, a5 + 1.0f, ((a6 + 0.5f))(F32) + 0.45f, maxX, minY);
}
Bool TileRenderer_tesselateLadderInWorld(TileRenderer *s,MCRenderTile027 *tile,I32 x,I32 y,I32 z){
	TextureUVCoordinateSet* v9; 
	F32 v10;					
	F32 minX;					
	F32 maxX;					
	F32 minY;					
	F32 maxY;					
	I32 v15;				
	F32 v16;					
	F32 v17;					
	F32 v18;					
	I32 v19;				
	I32 v20;				
	F32 v21;					
	F32 v22;					
	F32 v23;					
	I32 v24;				
	I32 v25;				
	F32 v26;					
	F32 v27;					
	F32 v28;					
	F32 v30;					
	F32 v31;					

	if(s->hasUVCoords) {
		v9 = &s->field_8;
	} else {
		v9 = (&tile->uv[0]);
	}
	v10 = MC027_Brightness(s, x, y, z);
	MC027_Color(s,v10, v10, v10);
	minX = v9->minX;
	maxX = v9->maxX;
	minY = v9->minY;
	maxY = v9->maxY;
	v15 = Level_getData(s->level,x, y, z);
	switch(v15) {
		case 5:
			v16 = (x)(F32) + 0.05f;
			v17 = ((y + 1))(F32) + 0.0f;
			MC027_Vertex(s,v16, v17, ((z + 1))(F32) + 0.0f, minX, minY);
			MC027_Vertex(s,v16, (y)(F32), ((z + 1))(F32) + 0.0f, minX, maxY);
			v18 = (z)(F32);
			MC027_Vertex(s,v16, (y)(F32), (z)(F32), maxX, maxY);
			v30 = maxX;
			v31 = minY;
LABEL_8:
			v21 = v16;
			v22 = v17;
			v23 = v18;
LABEL_14:
			MC027_Vertex(s,v21, v22, v23, v30, v31);
			return 1;
		case 4:
			v16 = ((x + 1))(F32) - 0.05f;
			v19 = y;
			v20 = y + 1;
			v17 = (v19)(F32);
			MC027_Vertex(s,v16, (v19)(F32), ((z + 1))(F32) + 0.0f, maxX, maxY);
			MC027_Vertex(s,v16, (v20)(F32) + 0.0f, ((z + 1))(F32) + 0.0f, maxX, minY);
			v18 = (z)(F32);
			MC027_Vertex(s,v16, (v20)(F32) + 0.0f, (z)(F32), minX, minY);
			v30 = minX;
			v31 = maxY;
			goto LABEL_8;
		case 3:
			v24 = y;
			v25 = y + 1;
			v26 = (v24)(F32);
			v27 = (z)(F32) + 0.05f;
			MC027_Vertex(s,((x + 1))(F32) + 0.0f, (v24)(F32), v27, maxX, maxY);
			MC027_Vertex(s,((x + 1))(F32) + 0.0f, (v25)(F32) + 0.0f, v27, maxX, minY);
			v28 = (x)(F32);
			MC027_Vertex(s,(x)(F32), (v25)(F32) + 0.0f, v27, minX, minY);
			v30 = minX;
			v31 = maxY;
LABEL_13:
			v21 = v28;
			v22 = v26;
			v23 = v27;
			goto LABEL_14;
		case 2:
			v26 = ((y + 1))(F32) + 0.0f;
			v27 = ((z + 1))(F32) - 0.05f;
			MC027_Vertex(s,((x + 1))(F32) + 0.0f, v26, v27, minX, minY);
			MC027_Vertex(s,((x + 1))(F32) + 0.0f, (y)(F32), v27, minX, maxY);
			v28 = (x)(F32);
			MC027_Vertex(s,(x)(F32), (y)(F32), v27, maxX, maxY);
			v30 = maxX;
			v31 = minY;
			goto LABEL_13;
	}
	return 1;
}
U0 TileRenderer_tesselateTorch(TileRenderer *s,MCRenderTile027 *tile,F32 a3,F32 a4,F32 a5,F32 a6,F32 a7){
	TextureUVCoordinateSet* v9; 
	F32 maxY;					
	F32 minY;					
	F32 v12;					
	F32 v13;					
	F32 v14;					
	F32 v15;					
	F32 v16;					
	F32 v17;					
	F32 v18;					
	F32 v19;					
	F32 v20;					
	F32 v21;					
	F32 v22;					
	F32 v23;					
	F32 v24;					
	F32 v25;					
	F32 v26;					
	F32 v27;					
	F32 v28;					
	F32 v29;					
	F32 v30;					
	F32 v31;					

	if(s->hasUVCoords) {
		v9 = &s->field_8;
	} else {
		v9 = (&tile->uv[0]);
	}
	maxY = v9->maxY;
	minY = v9->minY;
	v12 = v9->maxX - v9->minX;
	v13 = v9->minX + ((v12 * 0.4375f))(F32);
	v14 = v9->minX + ((v12 * 0.5625f))(F32);
	v15 = maxY - minY;
	v16 = minY + ((((maxY - minY))(F32) * 0.375f))(F32);
	if(v16 != 0.0f) {
		minY = minY + ((((maxY - minY))(F32) * 0.375f))(F32);
	}
	v17 = minY + ((v15 * 0.125f))(F32);
	v18 = a3 + 0.5f;
	v19 = v18 + ((a6 * 0.38125f))(F32);
	v20 = ((a5 + 0.5f))(F32) + ((a7 * 0.38125f))(F32);
	v21 = v20 - 0.0625f;
	MC027_Vertex(s,v19 - 0.0625f, a4 + 0.61875f, v20 - 0.0625f, v13, v16);
	v22 = v20 + 0.0625f;
	MC027_Vertex(s,v19 - 0.0625f, a4 + 0.61875f, v22, v13, v17);
	v23 = v19 + 0.0625f;
	MC027_Vertex(s,v23, a4 + 0.61875f, v22, v14, v17);
	MC027_Vertex(s,v23, a4 + 0.61875f, v21, v14, v16);
	v24 = ((a5 + 0.5f))(F32) + ((((a7 * 0.61875f))(F32) * 0.61875f))(F32);
	v25 = v18 + ((((a6 * 0.61875f))(F32) * 0.61875f))(F32);
	v26 = v24 - 0.0625f;
	v27 = v24 + 0.0625f;
	v28 = v27 + ((a7 * 0.61875f))(F32);
	v29 = ((v25 + ((a6 * 0.61875f))(F32)))(F32) + 0.0625f;
	MC027_Vertex(s,v29, a4, v28, v13, maxY);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4, v28, v13, maxY);
	v30 = v26 + ((a7 * 0.61875f))(F32);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4, v30, v14, maxY);
	MC027_Vertex(s,v29, a4, v30, v14, maxY);
	MC027_Vertex(s,v25 - 0.0625f, a4 + 0.61875f, v26, v13, v16);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4 + 0.0f, v30, v13, maxY);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4 + 0.0f, v28, v14, maxY);
	MC027_Vertex(s,v25 - 0.0625f, a4 + 0.61875f, v27, v14, v16);
	MC027_Vertex(s,v25 + 0.0625f, a4 + 0.61875f, v27, v13, v16);
	MC027_Vertex(s,v29, a4 + 0.0f, v28, v13, maxY);
	MC027_Vertex(s,v29, a4 + 0.0f, v30, v14, maxY);
	MC027_Vertex(s,v25 + 0.0625f, a4 + 0.61875f, v26, v14, v16);
	MC027_Vertex(s,v25 - 0.0625f, a4 + 0.61875f, v27, v13, v16);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4 + 0.0f, v28, v13, maxY);
	v31 = ((v25 + 0.0625f))(F32) + ((a6 * 0.61875f))(F32);
	MC027_Vertex(s,v31, a4 + 0.0f, v28, v14, maxY);
	MC027_Vertex(s,v25 + 0.0625f, a4 + 0.61875f, v27, v14, v16);
	MC027_Vertex(s,v25 + 0.0625f, a4 + 0.61875f, v26, v13, v16);
	MC027_Vertex(s,v31, a4 + 0.0f, v30, v13, maxY);
	MC027_Vertex(s,((v25 - 0.0625f))(F32) + ((a6 * 0.61875f))(F32), a4 + 0.0f, v30, v14, maxY);
	MC027_Vertex(s,v25 - 0.0625f, a4 + 0.61875f, v26, v14, v16);
}
Bool TileRenderer_tesselateTorchInWorld(TileRenderer *s,MCRenderTile027 *tile,I32 x,I32 y,I32 z){
	I32 v9;		   
	F32 v10;		   
	F32 v11;		   
	F32 v12;		   
	F32 v13;		   
	TileRenderer* v14; 
	MCRenderTile027* v15;		   
	F32 v16;		   
	F32 v17;		   
	F32 v19;		   
	F32 v20;		   
	F32 v21;		   

	v9 = Level_getData(s->level,x, y, z);
	v10 = MC027_Brightness(s, x, y, z);
	if(s->level->registry->tiles[tile->id].emission > 0) {
		v10 = 1.0f;
	}
	MC027_Color(s,v10, v10, v10);
	v11 = (x)(F32);
	if(v9 != 1) {
		v12 = (z)(F32);
		v13 = (y)(F32);
		if(v9 == 2) {
			v19 = (z)(F32);
			v21 = 0.0f;
			v14 = s;
			v15 = tile;
			v20 = 0.4f;
			v11 = v11 + 0.1f;
		} else {
			if(v9 == 3) {
				v20 = 0.0f;
				v16 = -0.4f;
				v19 = v12 - 0.1f;
			} else {
				if(v9 != 4) {
					v17 = (x)(F32);
					v14 = s;
					v15 = tile;
					v19 = (z)(F32);
					v20 = 0.0f;
					v21 = 0.0f;
					goto LABEL_14;
				}
				v16 = 0.4f;
				v20 = 0.0f;
				v19 = v12 + 0.1f;
			}
			v14 = s;
			v15 = tile;
			v21 = v16;
		}
		v17 = v11;
		v13 = v13 + 0.2f;
LABEL_14:
		TileRenderer_tesselateTorch(v14,v15, v17, v13, v19, v20, v21);
		return 1;
	}
	TileRenderer_tesselateTorch(s,tile, v11 - 0.1f, (y)(F32) + 0.2f, (z)(F32), -0.4f, 0.0f);
	return 1;
}
U0 TileRenderer_randomize(TileRenderer *s,MCRenderTile027 *a2,I32 face,F32 a4,F32 a5,F32 a6){
	if(((a2->field_5C >> face) & 1) != 0) {
		if(s->randomizeFace[face] == 0) {
			I32 v7 = (a5)(I32) ^ ((a4)(I32) * 0x2FC20F) ^ ((a6)(I32) * 0x6EBFFF5);
			s->randomizeFace[face] = (((11 * v7 + 0x285B825 * v7 * v7))(U32) >> 24) & 3;
		}
	}
}

Bool TileRenderer_canRender(I32 n){return !n || n==13 || n==10 || n==11 || n==21 || n==32 || n==22 || n==31;}
Bool MC027_Face(TileRenderer *s,MCRenderTile027 *v,I32 x,I32 y,I32 z,I32 face){if(s->disableCulling)return TRUE;return Tile_shouldRenderFace(v->base,&s->level->world,x,y,z,face);}
Bool TileRenderer_tesselateBlock(TileRenderer *s,MCRenderTile027 *v,I32 x,I32 y,I32 z,F32 r,F32 g,F32 b){I32 dx[6]={0,0,0,0,-1,1},dy[6]={-1,1,0,0,0,0},dz[6]={0,0,-1,1,0,0};F32 shade[6]={0.5,1,0.8,0.8,0.6,0.6};s->enableAO=FALSE;Bool any=FALSE;I32 face;for(face=0;face<6;face++){if(!MC027_Face(s,v,x+dx[face],y+dy[face],z+dz[face],face))continue;F32 bright=MC027_Brightness(s,x+dx[face],y+dy[face],z+dz[face]);if((face==1 && v->maxY!=1 && !v->liquid) || (face==2 && v->minZ>0) || (face==3 && v->maxZ<1) || (face==4 && v->minX>0) || (face==5 && v->maxX<1))bright=MC027_Brightness(s,x,y,z);F32 rr=r,gg=g,bb=b;if(v->grass && face!=1){rr=1;gg=1;bb=1;}MC027_Color(s,(rr*(bright*shade[face]))(F32),(gg*(bright*shade[face]))(F32),(bb*(bright*shade[face]))(F32));TextureUVCoordinateSet *uv=&v->uv[face];switch(face){case 0:TileRenderer_renderFaceDown(s,v,x,y,z,uv);break;case 1:TileRenderer_renderFaceUp(s,v,x,y,z,uv);break;case 2:TileRenderer_renderNorth(s,v,x,y,z,uv);break;case 3:TileRenderer_renderSouth(s,v,x,y,z,uv);break;case 4:TileRenderer_renderWest(s,v,x,y,z,uv);break;case 5:TileRenderer_renderEast(s,v,x,y,z,uv);break;}any=TRUE;}return any;}
F32 TileRenderer_getWaterHeight(TileRenderer *s,I32 x,I32 y,I32 z,I32 material){F32 total=0;I32 weights=0,i;for(i=0;i<4;i++){I32 xx=x-(i&1),zz=z-(i>>1),id=Level_getTile(s->level,xx,y+1,zz);if(id && s->level->registry->tiles[id].material==material)return 1;id=Level_getTile(s->level,xx,y,zz);MCTileDef023 *d=&s->level->registry->tiles[id];if(id && d->material==material){I32 data=Level_getData(s->level,xx,y,zz);if(data>7 || data==0){total+=1.1111;weights+=10;if(data>7)data=0;}total+=(data+1)/9.0;weights++;}else if(!d->solid){total+=1;weights++;}}if(!weights)return 0;return 1-total/weights;}
Bool TileRenderer_tesselateInWorld(TileRenderer *s,I32 x,I32 y,I32 z){I32 id=Level_getTile(s->level,x,y,z);MCRenderTile027 *v=s->views[id];if(!v)return FALSE;memset(s->randomizeFace,0,sizeof(s->randomizeFace));F32 bright=MC027_Brightness(s,x,y,z);if(v->kind==8)return TileRenderer_tesselateLadderInWorld(s,v,x,y,z);if(v->kind==2)return TileRenderer_tesselateTorchInWorld(s,v,x,y,z);if(v->kind==1){MC027_Color(s,bright,bright,bright);TileRenderer_tesselateCrossTexture(s,v,Level_getData(s->level,x,y,z),x,y,z);return TRUE;}if(!TileRenderer_canRender(v->kind))return FALSE;return TileRenderer_tesselateBlock(s,v,x,y,z,((v->color>>16)&255)/255.0,((v->color>>8)&255)/255.0,(v->color&255)/255.0);}
