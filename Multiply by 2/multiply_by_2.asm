0: CP 101 100   // tmp = k;
1: LT 101 103   // tmp = tmp < size
2: BZJ 12 101   // if(tmp = 0) goto END_WHILE;
3: CP 101 300
4: ADD 300 100
5: CPI 102 300  // tmp2 = *(a+k);
6: MULi 102 2   // tmp2 = tmp2 * 2;
7: CPIi 300 102 // *(a+k) = tmp2;
8: ADDi 100 1   // k = k + 1;
9: BZJi 10 0    // goto WHILE:
10: 0
11: BZJi 12 0   // END_WHILE: goto END_WHILE;
12: 11


100: 0 // k
101: 0 // tmp
102: 0 // tmp2
103: 2 // size

300: 400 // a

400: 137 // A[0] -> First element of an array
401: 224 // A[1] -> Second element of an array
