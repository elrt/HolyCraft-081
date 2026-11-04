// Inline original cave source translation. Valid range>=2, fresh 32768-byte block buffer required.
U0 LargeCaveFeature_addFeature(LargeCaveFeature *s,Level *level,I32 a3,I32 a4,I32 a5,I32 a6,U8 *blocks,I32 a8){
		Random* p_random; 
		I32 v12;	  
		I32 v13;	  
		I32 v14;	  
		I32 v15;	  
		I32 v16;	  
		I32 i;		  
		F32 v18;		  
		I32 v19;	  
		F32 v20;		  
		I32 v21;	  
		F32 f;		  
		I32 v23;	  
		I32 v24;	  
		F32 v25;		  
		F32 v26;		  
		F32 v27;		  
		F32 v28;		  
		I32 v29;	  
		I32 v30;	  

		p_random = &s->base.random;
		v12 = Random_genrand_int32(&s->base.random);
		v13 = Random_genrand_int32(p_random);
		v14 = Random_genrand_int32(p_random);
		if(Random_genrand_int32(p_random) % 0xF) {
			v15 = 0;
		} else {
			v15 = (v14(U32)) % ((v13(U32)) % ((v12(U32)) % 40 + 1) + 1);
		}
		v16 = 16 * a4;
		v30 = 16 * a3;
		for(i = 0; i < v15; ++i) {
			v18 = (((v30 + (Random_genrand_int32(p_random) & 0xF)))(I32))(F32);
			v19 = Random_genrand_int32(p_random);
			v20 = (((Random_genrand_int32(p_random) % (v19(U32) % 120 + 8)))(I32))(F32);
			v21 = (Random_genrand_int32(p_random) & 0xF) + v16;
			if((Random_genrand_int32(p_random) & 3)) {
				v23 = 1;
			} else {
				f = Random_nextFloat(p_random);
				LargeCaveFeature_addTunnel(s,a5, a6, blocks, v18, v20, (v21)(F32), ((f * 6.0))(F32) + 1.0, 0.0, 0.0, -1, -1, 0.5);
				v23 = (Random_genrand_int32(p_random) & 3) + 1;
			}
			v24 = 0;
			do {
				v29 = v23;
				++v24;
				v25 = Random_nextFloat(p_random) * 3.1416;
				v26 = Random_nextFloat(p_random);
				v27 = Random_nextFloat(p_random);
				v28 = Random_nextFloat(p_random);
				LargeCaveFeature_addTunnel(s,a5, a6, blocks, v18, v20, (v21)(F32), ((v27 + v27))(F32) + v28, v25 + v25, ((((v26 - 0.5))(F32) + ((v26 - 0.5))(F32)))(F32) * 0.125, 0, 0, 1.0);
				v23 = v29;
			} while(v24 < v29);
		}
	}
U0 LargeCaveFeature_addTunnel(LargeCaveFeature *s,I32 a2,I32 a3,U8 *blocks,F32 a5,F32 a6,F32 a7,F32 a8,F32 a9,F32 a10,I32 a11,I32 a12,F32 a13){
		I32 v17;   
		I32 v19;   
		I32 v20;   
		I32 v21;   
		U32 v22;  
		F32 v23;	   
		F32 v24;	   
		I32 range; 
		F32 v26;	   
		F32 v27;	   
		F32 v28;	   
		F64 v29;	   
		F64 v30;	   
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
		I32 v43;   
		I32 v44;   
		I32 v45;   
		F64 v46;	   
		I32 v47;   
		I32 v48;   
		F64 v49;	   
		I32 v50;   
		F64 v51;	   
		I32 v52;   
		F64 v53;	   
		I32 v54;   
		F64 v55;	   
		I32 v56;   
		I32 v57;   
		I32 v58;   
		I32 v59;   
		Bool v60;	   
		U32 v61;  
		I32 v62;   
		I32 v63;   
		U8* v64;  
		F32 v65;	   
		F32 v66;	   
		F32 v67;	   
		I32 v68;   
		I32 v69;   
		U8* v70;  
		F32 v71;	   
		I32 v72;   
		I32 v73;   
		I32 v74;   
		I32 v75;   
		F64 v76;	   
		I32 v77;   
		I32 v82;   
		I32 v83;   
		I32 v84;   
		U32 v85;  
		U32 v86;  

		v17 = a12;
		v83 = 16 * a2;
		v19 = 16 * a3;
		v20 = a11;
		v21 = 16 * a2 + 8;
		v84 = 16 * a3;
		v22 = Random_genrand_int32(&s->base.random);
		v23 = (v21)(F32);
		v24 = ((v19 + 8))(F32);
		Random random; Random_setSeed(&random,v22 >> 1); 
		if(a12 <= 0) {
			range = s->base.range;
			v17 = 16 * (range - 1) - Random_genrand_int32(&random) % (16 * (range - 1) / 4);
		}
		if(a11 == -1) {
			v82 = 1;
			v20 = v17 / 2;
		} else {
			v82 = 0;
		}
		v26 = 0.0;
		v27 = 0.0;
		v85 = Random_genrand_int32(&random) % (v17 / 2) + v17 / 4;
		v86 = Random_genrand_int32(&random) % 6;
		while(v20 < v17) {
			v76 = sin((((((v20)(F32) * 3.1416))(F32) / (v17)(F32)))(F32));
			v28 = cos(a10);
			v29 = sin(a10);
			v30 = v28;
			a5 = a5 + cos(a9) * v30;
			v31 = v29;
			a6 = a6 + v31;
			a7 = a7 + sin(a9) * v30;
			if(v86) {
				v32 = 0.7;
			} else {
				v32 = 0.92;
			}
			a9 = a9 + ((v27 * 0.1))(F32);
			a10 = ((a10 * v32))(F32) + ((v26 * 0.1))(F32);
			v33 = Random_nextFloat(&random);
			v34 = v33 - Random_nextFloat(&random);
			v35 = v34 * Random_nextFloat(&random);
			v26 = ((v26 * 0.9))(F32) + ((v35 + v35))(F32);
			v36 = Random_nextFloat(&random);
			v37 = v36 - Random_nextFloat(&random);
			v27 = ((v27 * 0.75))(F32) + ((((v37 * Random_nextFloat(&random)))(F32) * 4.0))(F32);
			if(v82) {
				goto LABEL_73;
			}
			if(v20 == v85 && a8 > 1.0) {
				v38 = Random_nextFloat(&random);
				v39 = a10 / 3.0;
				LargeCaveFeature_addTunnel(s,a2, a3, blocks, a5, a6, a7, ((v38 * 0.5))(F32) + 0.5, a9 - ((3.1416 * 0.5))(F32), v39, v20, v17, 1.0);
				v40 = Random_nextFloat(&random);
				LargeCaveFeature_addTunnel(s,a2, a3, blocks, a5, a6, a7, ((v40 * 0.5))(F32) + 0.5, a9 + ((3.1416 * 0.5))(F32), v39, v20, v17, 1.0);
				return;
			}
			if((Random_genrand_int32(&random) & 3)) {
LABEL_73:
				if(((((((((a7 - v24))(F32) * ((a7 - v24))(F32)))(F32) + ((((a5 - v23))(F32) * ((a5 - v23))(F32)))(F32)))(F32) - ((((v17 - v20))(F32) * ((v17 - v20))(F32)))(F32)))(F32) > ((((((a8 + 2.0))(F32) + 16.0))(F32) * ((((a8 + 2.0))(F32) + 16.0))(F32)))(F32)) {
					return;
				}
				v41 = v76 * a8 + 1.5;
				v42 = v41 + v41;
				if(a5 >= ((((v23 - 16.0))(F32) - ((v41 + v41))(F32)))(F32) && a7 >= ((((v24 - 16.0))(F32) - v42))(F32) && a5 <= ((((v23 + 16.0))(F32) + v42))(F32) && a7 <= ((((v24 + 16.0))(F32) + v42))(F32)) {
					v43 = (floor(((a5 - v41))(F32)))(I32) - 16 * a2;
					v44 = (v43 - 1) & ~((v43 - 1) >> 31);
					v45 = (floor(((a5 + v41))(F32)))(I32) - 16 * a2;
					v46 = floor(((a6 - ((v41 * a13))(F32)))(F32));
					v47 = v45 + 1;
					if(v47 >= 16) {
						v47 = 16;
					}
					v48 = (v46)(I32) - 1;
					v49 = floor(((a6 + ((v41 * a13))(F32)))(F32));
					if(v48 < 1) {
						v48 = 1;
					}
					v50 = (v49)(I32) + 1;
					v51 = floor(((a7 - v41))(F32));
					if(v50 >= 120) {
						v50 = 120;
					}
					v52 = (v51)(I32) - 16 * a3;
					v53 = floor(((a7 + v41))(F32));
					v77 = v47;
					v74 = v50;
					v54 = (v52 - 1) & ~((v52 - 1) >> 31);
					v55 = v53;
					v56 = v44;
					v57 = 16 * v44;
					v58 = (v55)(I32) - 16 * a3 + 1;
					if(v58 >= 16) {
						v58 = 16;
					}
					v75 = v58;
					v73 = v48 - 1;
					while(v56 < v47) {
						v62 = (v52 - 1) & ~((v52 - 1) >> 31);
						while(v62 < v75) {
							v61 = v74 + 1;
							while((v61)(I32) >= v73) {
								if(v61 > 0x7F) {
									v60 = 0;
								} else {
									v59 = blocks[128 * (v62 + v57) + v61];
									v60 = v59 == s->water || v59 == s->calmWater;
									if(v61 != v73 && v56 != v44 && v56 != v47 - 1 && v62 != v54 && v62 != v75 - 1) {
										v61 = v48;
									}
								}
								--v61;
								if(v60) {
									goto LABEL_43;
								}
							}
							v60 = 0;
LABEL_43:
							++v62;
							if(v60) {
								goto LABEL_48;
							}
						}
						v60 = 0;
LABEL_48:
						++v56;
						v57 += 16;
						if(v60) {
							goto LABEL_15;
						}
					}
					while(v44 < v77) {
						v63 = (v52 - 1) & ~((v52 - 1) >> 31);
						v64 = &blocks[128 * (v54 + 16 * v44)];
						v65 = ((((((v44 + v83))(F32) + 0.5))(F32) - a5))(F32) / v41;
						while(v63 < v75) {
							v66 = ((((((v84 + v63))(F32) + 0.5))(F32) - a7))(F32) / v41;
							v67 = v66 * v66;
							if(((((v65 * v65))(F32) + v67))(F32) < 1.0) {
								v68 = v74 - 1;
								v69 = 0;
								v70 = &v64[v74 - 1];
								while(v68 >= v48) {
									v71 = (((((v68)(F32) + 0.5))(F32) - a6))(F32) / ((v41 * a13))(F32);
									if(v71 > -0.7 && ((((((v65 * v65))(F32) + ((v71 * v71))(F32)))(F32) + v67))(F32) < 1.0) {
										v72 = v70[1];
										if(v72 == s->grass) {
											v69 = 1;
										}
										if(v72 == s->rock || v72 == s->dirt || v72 == s->grass) {
											if(v68 > 9) {
												v70[1] = 0;
												if(v69) {
													if(v64[v68] == s->dirt) {
														v64[v68] = s->grass;
													}
												}
											} else {
												v70[1] = s->lava;
											}
										}
									}
									--v68;
									--v70;
								}
							}
							++v63;
							v64 += 128;
						}
						++v44;
					}
					if(v82) {
						return;
					}
				}
			}
LABEL_15:
			++v20;
		}
	}

U0 MC027_CaveDispatch(U0 *ctx,MCFeatureWorld *world,I32 x,I32 z,I32 cx,I32 cz,U8 *data,I32 stride){LargeCaveFeature_addFeature(ctx,NULL,x,z,cx,cz,data,stride);}
U0 LargeCaveFeature_Init(LargeCaveFeature *s,I32 water,I32 calm,I32 rock,I32 dirt,I32 grass,I32 lava){memset(s,0,sizeof(LargeCaveFeature));s->water=water;s->calmWater=calm;s->rock=rock;s->dirt=dirt;s->grass=grass;s->lava=lava;LargeFeature_Init(&s->base,s,&MC027_CaveDispatch);}
