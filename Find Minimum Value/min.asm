0: CP 200 100 // min = a
1: CP 201 101 // tmp = b
2: LT 201 100 // tmp = tmp < a
3: BZJ 6 201  // if (tmp == 0) goto END
4: CP 200 101 // min = b
5: BZJi 6 0   // END:
6: 5

100: 500 // a
101: 522 // b

200: 0 // min
201: 0 // tmp