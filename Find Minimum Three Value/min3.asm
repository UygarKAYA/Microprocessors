0: CP 600 530 // min  = a
1: CP 601 531 // tmp1 = b
2: CP 602 532 // tmp2 = c
3: LT 601 530 // tmp1 = tmp1 < a
4: BZJ 10 601 // if(tmp1 == 0) goto change1
5: CP 600 531 // min = b
6: LT 602 600 // tmp2 = tmp2 < min
7: BZJ 11 602 // if(tmp2 == 0) goto END
8: CP 600 532 // min = c
9: BZJi 10 3  // END
10: 6
11: 9

530: 100 // a
531: 101 // b
532: 102 // c

600: 0 // min
601: 0 // tmp1
602: 0 // tmp2
