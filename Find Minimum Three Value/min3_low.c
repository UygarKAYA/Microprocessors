min  = a;
tmp1 = b;
tmp2 = c;
tmp1 = tmp1 < a;
if(tmp1 == 0) goto change1;
	min = b;

change1: tmp2 = tmp2 < min;
if(tmp2 == 0) goto END;
	min = c;
END:
	goto END;