// I completed the Bonus part of the homework and my Sum function starting address is beginning the 25

0: CP 42 100   // argument copy
1: CP 43 90    // argument copy
2: CP 50 35    // goto JUMP1
3: BZJi 24 0   // goto SUM function for section A
4: CP 75 44    // copy the return value for section A

5: CP 147 75   // argument copy
6: CP 148 100  // argument copy
7: CP 50 36    // goto JUMP2
8: BZJi 146 0  // goto DIVIDER function for section A
9: CP 76 149   // copy the return value for section A

10: CPi 44 0   // reset the result value
11: CPi 45 0   // reset the k value

12: CP 42 130  // argument copy
13: CP 43 91   // argument copy
14: CP 50 37   // goto JUMP3
15: BZJi 24 0  // goto SUM function for section B
16: CP 77 44   // copy the return value for section B

17: CP 147 77  // argument copy
18: CP 148 130 // argument copy
19: CP 50 38   // goto JUMP4
20: BZJi 146 0 // goto DIVIDER function for section B
21: CP 78 149  // copy the return value for section B
22: BZJi 23 0  // END_WHILE: goto END_WHILE;
23: 22

24: 25         // sum function start address, sum function
25: CP 46 45   // tmp = k;
26: LT 46 42   // tmp = tmp < sum operand 1;
27: BZJ 50 46  // if(tmp==0) goto stack pointer;
28: CP 46 43
29: ADD 46 45
30: CPI 47 46  // tmp2 = *(a+k);
31: ADD 44 47  // sum function result = sum function result + tmp2;
32: ADDi 45 1  // k = k + 1;
33: BZJi 24 0  // goto WHILE:

35: 4    // JUMP1
36: 9    // JUMP2
37: 16   // JUMP3
38: 21   // JUMP4

42: 0    // sum operand 1 -> SIZE
43: 0    // sum operand 2 -> array start index
44: 0    // sum function result
45: 0    // k
46: 0    // tmp
47: 0    // tmp2

50: 0    // stack pointer

75: 0    // sum of array 1
76: 0    // mean of array 1
77: 0    // sum of array 2
78: 0    // mean of array 2

90: 101  // array 1 start index
91: 131  // array 2 start index

100: 20  // SIZE of section A
101: 9   // first grade of Section A
102: 1   
103: 2
104: 2
105: 5
106: 7
107: 10
108: 7
109: 8
110: 6
111: 9
112: 4   
113: 2
114: 4
115: 3
116: 7
117: 10
118: 0
119: 8
120: 6   // last grade of Section A

130: 12  // SIZE of section B
131: 9   // first grade of Section B
132: 1   
133: 2
134: 4
135: 3
136: 7
137: 2
138: 0
139: 8
140: 5
141: 8
142: 1   // last grade of Section B   

146: 150 // divider start address , divider function
147: 0   // operand 1
148: 0   // operand 2
149: 0   // result
150: CPi 149 0
151: CP 173 147
152: CP 172 173
153: LT 172 148
154: LTi 172 1
155: BZJ 50 172
156: ADDi 149 1
157: CP 171 148
158: NAND 171 171
159: ADDi 171 1
160: ADD 173 171
161: BZJi 169 152  
169: 0 
170: 0 // temp
171: 0 // temp2
172: 0 // temp3
173: 0 // temp4                      , end of divider 
