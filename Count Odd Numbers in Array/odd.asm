0: CPI 80 81     // tmp = *ptr;
1: NANDi 80 1    // tmp = ~(tmp & 0x01);
2: NAND 80 80    // tmp = ~tmp;
3: BZJ 12 80     // if(tmp == 0) goto JUMP;
4: ADDi 115 1    // cnt++;
5: ADDi 81 1     // ptr++;
6: ADDi 82 1     // ii++;
7: CP 80 82      // tmp = ii;
8: LT 80 90      // tmp = tmp < num;
9: BZJ 13 80     // if(tmp == 0) goto END;
10: BZJi 14 0    // goto START;
11: BZJi 13 0    // goto END;
12: 5
13: 11
14: 0

80: 0     // tmp
81: 100   // ptr
82: 0     // ii

90: 10    // SIZE

100: 200  // first element of array 
101: 7   
102: 3
103: 5
104: 14
105: 15
106: 16
107: 114
108: 115
109: 200  // last element of array

115: 0    // number of odd numbers in the array -> cnt
