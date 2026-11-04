// Matrix algorithms from original unigl.cpp; callback loader is not a native GL backend.
U0 MultiplyMatrixByVector4by4OpenGL_FLOAT(F32* resultvector, F32* matrix, F32* pvector);
I32 glhInvertMatrixf2(F32* m, F32* out);
U0 MultiplyMatrices4by4OpenGL_FLOAT(F32* result, F32* matrix1, F32* matrix2);
I32 glhUnProjectf(F32 winx, F32 winy, F32 winz, F32 *modelview, F32 *projection, I32 *viewport, F32 *objectCoordinate)
{
	// Transformation matrices
	F32 m[16], A[16];
	F32 in[4], out[4];
	// Calculation for inverting a matrix, compute projection x modelview
	// and store in A[16]
	MultiplyMatrices4by4OpenGL_FLOAT(A, projection, modelview);
	// Now compute the inverse of matrix A
	if(glhInvertMatrixf2(A, m)==0)
		return 0;
	// Transformation of normalized coordinates between -1 and 1
	in[0]=(winx-viewport[0](F32))/viewport[2](F32)*2.0-1.0;
	in[1]=(winy-viewport[1](F32))/viewport[3](F32)*2.0-1.0;
	in[2]=2.0*winz-1.0;
	in[3]=1.0;
	// Objects coordinates
	MultiplyMatrixByVector4by4OpenGL_FLOAT(out, m, in);
	if(out[3]==0.0)
		return 0;
	out[3]=1.0/out[3];
	objectCoordinate[0]=out[0]*out[3];
	objectCoordinate[1]=out[1]*out[3];
	objectCoordinate[2]=out[2]*out[3];
	return 1;
}

U0 MultiplyMatrices4by4OpenGL_FLOAT(F32 *result, F32 *matrix1, F32 *matrix2)
{
	result[0]=matrix1[0]*matrix2[0]+
				matrix1[4]*matrix2[1]+
				matrix1[8]*matrix2[2]+
				matrix1[12]*matrix2[3];
	result[4]=matrix1[0]*matrix2[4]+
				matrix1[4]*matrix2[5]+
				matrix1[8]*matrix2[6]+
				matrix1[12]*matrix2[7];
	result[8]=matrix1[0]*matrix2[8]+
				matrix1[4]*matrix2[9]+
				matrix1[8]*matrix2[10]+
				matrix1[12]*matrix2[11];
	result[12]=matrix1[0]*matrix2[12]+
				 matrix1[4]*matrix2[13]+
				 matrix1[8]*matrix2[14]+
				 matrix1[12]*matrix2[15];
	result[1]=matrix1[1]*matrix2[0]+
				matrix1[5]*matrix2[1]+
				matrix1[9]*matrix2[2]+
				matrix1[13]*matrix2[3];
	result[5]=matrix1[1]*matrix2[4]+
				matrix1[5]*matrix2[5]+
				matrix1[9]*matrix2[6]+
				matrix1[13]*matrix2[7];
	result[9]=matrix1[1]*matrix2[8]+
				matrix1[5]*matrix2[9]+
				matrix1[9]*matrix2[10]+
				matrix1[13]*matrix2[11];
	result[13]=matrix1[1]*matrix2[12]+
				 matrix1[5]*matrix2[13]+
				 matrix1[9]*matrix2[14]+
				 matrix1[13]*matrix2[15];
	result[2]=matrix1[2]*matrix2[0]+
				matrix1[6]*matrix2[1]+
				matrix1[10]*matrix2[2]+
				matrix1[14]*matrix2[3];
	result[6]=matrix1[2]*matrix2[4]+
				matrix1[6]*matrix2[5]+
				matrix1[10]*matrix2[6]+
				matrix1[14]*matrix2[7];
	result[10]=matrix1[2]*matrix2[8]+
				 matrix1[6]*matrix2[9]+
				 matrix1[10]*matrix2[10]+
				 matrix1[14]*matrix2[11];
	result[14]=matrix1[2]*matrix2[12]+
				 matrix1[6]*matrix2[13]+
				 matrix1[10]*matrix2[14]+
				 matrix1[14]*matrix2[15];
	result[3]=matrix1[3]*matrix2[0]+
				matrix1[7]*matrix2[1]+
				matrix1[11]*matrix2[2]+
				matrix1[15]*matrix2[3];
	result[7]=matrix1[3]*matrix2[4]+
				matrix1[7]*matrix2[5]+
				matrix1[11]*matrix2[6]+
				matrix1[15]*matrix2[7];
	result[11]=matrix1[3]*matrix2[8]+
				 matrix1[7]*matrix2[9]+
				 matrix1[11]*matrix2[10]+
				 matrix1[15]*matrix2[11];
	result[15]=matrix1[3]*matrix2[12]+
				 matrix1[7]*matrix2[13]+
				 matrix1[11]*matrix2[14]+
				 matrix1[15]*matrix2[15];
}

U0 MultiplyMatrixByVector4by4OpenGL_FLOAT(F32 *resultvector, F32 *matrix, F32 *pvector)
{
	resultvector[0]=matrix[0]*pvector[0]+matrix[4]*pvector[1]+matrix[8]*pvector[2]+matrix[12]*pvector[3];
	resultvector[1]=matrix[1]*pvector[0]+matrix[5]*pvector[1]+matrix[9]*pvector[2]+matrix[13]*pvector[3];
	resultvector[2]=matrix[2]*pvector[0]+matrix[6]*pvector[1]+matrix[10]*pvector[2]+matrix[14]*pvector[3];
	resultvector[3]=matrix[3]*pvector[0]+matrix[7]*pvector[1]+matrix[11]*pvector[2]+matrix[15]*pvector[3];
}


	// This code comes directly from GLU except that it is for F32
I32 glhInvertMatrixf2(F32 *m, F32 *out)
{
	F32 wtmp[32];
	F32 m0, m1, m2, m3, s;
	F32 *r0, *r1, *r2, *r3;
	r0=wtmp;r1=wtmp+8;r2=wtmp+16;r3=wtmp+24;
	r0[0] = m[0], r0[1] = m[4],
		r0[2] = m[8], r0[3] = m[12],
		r0[4] = 1.0, r0[5] = r0[6] = r0[7] = 0.0,
		r1[0] = m[1], r1[1] = m[5],
		r1[2] = m[9], r1[3] = m[13],
		r1[5] = 1.0, r1[4] = r1[6] = r1[7] = 0.0,
		r2[0] = m[2], r2[1] = m[6],
		r2[2] = m[10], r2[3] = m[14],
		r2[6] = 1.0, r2[4] = r2[5] = r2[7] = 0.0,
		r3[0] = m[3], r3[1] = m[7],
		r3[2] = m[11], r3[3] = m[15],
		r3[7] = 1.0, r3[4] = r3[5] = r3[6] = 0.0;
	/* choose pivot - or die */
	if (fabsf(r3[0]) > fabsf(r2[0]))
		{F32 *tmp=r3;r3=r2;r2=tmp;}
	if (fabsf(r2[0]) > fabsf(r1[0]))
		{F32 *tmp=r2;r2=r1;r1=tmp;}
	if (fabsf(r1[0]) > fabsf(r0[0]))
		{F32 *tmp=r1;r1=r0;r0=tmp;}
	if (0.0 == r0[0])
		return 0;
	/* eliminate first variable */
	m1 = r1[0] / r0[0];
	m2 = r2[0] / r0[0];
	m3 = r3[0] / r0[0];
	s = r0[1];
	r1[1] -= m1 * s;
	r2[1] -= m2 * s;
	r3[1] -= m3 * s;
	s = r0[2];
	r1[2] -= m1 * s;
	r2[2] -= m2 * s;
	r3[2] -= m3 * s;
	s = r0[3];
	r1[3] -= m1 * s;
	r2[3] -= m2 * s;
	r3[3] -= m3 * s;
	s = r0[4];
	if (s != 0.0) {
		r1[4] -= m1 * s;
		r2[4] -= m2 * s;
		r3[4] -= m3 * s;
	}
	s = r0[5];
	if (s != 0.0) {
		r1[5] -= m1 * s;
		r2[5] -= m2 * s;
		r3[5] -= m3 * s;
	}
	s = r0[6];
	if (s != 0.0) {
		r1[6] -= m1 * s;
		r2[6] -= m2 * s;
		r3[6] -= m3 * s;
	}
	s = r0[7];
	if (s != 0.0) {
		r1[7] -= m1 * s;
		r2[7] -= m2 * s;
		r3[7] -= m3 * s;
	}
	/* choose pivot - or die */
	if (fabsf(r3[1]) > fabsf(r2[1]))
		{F32 *tmp=r3;r3=r2;r2=tmp;}
	if (fabsf(r2[1]) > fabsf(r1[1]))
		{F32 *tmp=r2;r2=r1;r1=tmp;}
	if (0.0 == r1[1])
		return 0;
	/* eliminate second variable */
	m2 = r2[1] / r1[1];
	m3 = r3[1] / r1[1];
	r2[2] -= m2 * r1[2];
	r3[2] -= m3 * r1[2];
	r2[3] -= m2 * r1[3];
	r3[3] -= m3 * r1[3];
	s = r1[4];
	if (0.0 != s) {
		r2[4] -= m2 * s;
		r3[4] -= m3 * s;
	}
	s = r1[5];
	if (0.0 != s) {
		r2[5] -= m2 * s;
		r3[5] -= m3 * s;
	}
	s = r1[6];
	if (0.0 != s) {
		r2[6] -= m2 * s;
		r3[6] -= m3 * s;
	}
	s = r1[7];
	if (0.0 != s) {
		r2[7] -= m2 * s;
		r3[7] -= m3 * s;
	}
	/* choose pivot - or die */
	if (fabsf(r3[2]) > fabsf(r2[2]))
		{F32 *tmp=r3;r3=r2;r2=tmp;}
	if (0.0 == r2[2])
		return 0;
	/* eliminate third variable */
	m3 = r3[2] / r2[2];
	r3[3] -= m3 * r2[3], r3[4] -= m3 * r2[4],
		r3[5] -= m3 * r2[5], r3[6] -= m3 * r2[6], r3[7] -= m3 * r2[7];
	/* last check */
	if (0.0 == r3[3])
		return 0;
	s = 1.0 / r3[3];		/* now back substitute row 3 */
	r3[4] *= s;
	r3[5] *= s;
	r3[6] *= s;
	r3[7] *= s;
	m2 = r2[3];			/* now back substitute row 2 */
	s = 1.0 / r2[2];
	r2[4] = s * (r2[4] - r3[4] * m2), r2[5] = s * (r2[5] - r3[5] * m2),
		r2[6] = s * (r2[6] - r3[6] * m2), r2[7] = s * (r2[7] - r3[7] * m2);
	m1 = r1[3];
	r1[4] -= r3[4] * m1, r1[5] -= r3[5] * m1,
		r1[6] -= r3[6] * m1, r1[7] -= r3[7] * m1;
	m0 = r0[3];
	r0[4] -= r3[4] * m0, r0[5] -= r3[5] * m0,
		r0[6] -= r3[6] * m0, r0[7] -= r3[7] * m0;
	m1 = r1[2];			/* now back substitute row 1 */
	s = 1.0 / r1[1];
	r1[4] = s * (r1[4] - r2[4] * m1), r1[5] = s * (r1[5] - r2[5] * m1),
		r1[6] = s * (r1[6] - r2[6] * m1), r1[7] = s * (r1[7] - r2[7] * m1);
	m0 = r0[2];
	r0[4] -= r2[4] * m0, r0[5] -= r2[5] * m0,
		r0[6] -= r2[6] * m0, r0[7] -= r2[7] * m0;
	m0 = r0[1];			/* now back substitute row 0 */
	s = 1.0 / r0[0];
	r0[4] = s * (r0[4] - r1[4] * m0), r0[5] = s * (r0[5] - r1[5] * m0),
		r0[6] = s * (r0[6] - r1[6] * m0), r0[7] = s * (r0[7] - r1[7] * m0);
	out[0] = r0[4];
	out[4] = r0[5], out[8] = r0[6];
	out[12] = r0[7], out[1] = r1[4];
	out[5] = r1[5], out[9] = r1[6];
	out[13] = r1[7], out[2] = r2[4];
	out[6] = r2[5], out[10] = r2[6];
	out[14] = r2[7], out[3] = r3[4];
	out[7] = r3[5], out[11] = r3[6];
	out[15] = r3[7];
	return 1;
}


Bool initGlFuncs(MCGlLookup027 *h){if(!h || !h->lookup)return FALSE;h->deleteBuffers=h->lookup(h->context,"glDeleteBuffers");h->genBuffers=h->lookup(h->context,"glGenBuffers");h->bindBuffer=h->lookup(h->context,"glBindBuffer");h->bufferData=h->lookup(h->context,"glBufferData");return h->deleteBuffers!=NULL && h->genBuffers!=NULL && h->bindBuffer!=NULL && h->bufferData!=NULL;}
I32 MC027_BufferCounter=1;
I32 anGenBuffers(I32 count,U32 *out){I32 before=MC027_BufferCounter,i;for(i=0;i<count;i++)out[i]=MC027_BufferCounter+1;if(count>=0)MC027_BufferCounter=before+count;return MC027_BufferCounter;}
Bool gluPerspective027(MCGlLookup027 *h,F32 fovy,F32 aspect,F32 nearZ,F32 farZ){F32 m[16];F32 radians=fovy/2.0*3.1416/180.0,delta=farZ-nearZ,sine=sin(radians)(F32);if(!h || !h->multMatrix || delta==0 || sine==0 || aspect==0)return FALSE;memset(m,0,sizeof(m));F32 cot=cos(radians)/sine;m[0]=cot/aspect;m[5]=cot;m[10]=-(farZ+nearZ)/delta;m[11]=-1;m[14]=-2.0*nearZ*farZ/delta;h->multMatrix(h->context,m);return TRUE;}
