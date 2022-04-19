
_main:

;EE321_Lab3.c,8 :: 		void main() {
;EE321_Lab3.c,9 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;EE321_Lab3.c,10 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;EE321_Lab3.c,11 :: 		TRISA = 0xF0;
	MOVLW      240
	MOVWF      TRISA+0
;EE321_Lab3.c,12 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;EE321_Lab3.c,13 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;EE321_Lab3.c,14 :: 		while(1) {
L_main0:
;EE321_Lab3.c,15 :: 		display(onesDigit,tensDigit, hundredDigit);
	MOVF       _onesDigit+0, 0
	MOVWF      FARG_display+0
	MOVF       _onesDigit+1, 0
	MOVWF      FARG_display+1
	MOVF       _tensDigit+0, 0
	MOVWF      FARG_display+0
	MOVF       _tensDigit+1, 0
	MOVWF      FARG_display+1
	MOVF       _hundredDigit+0, 0
	MOVWF      FARG_display+0
	MOVF       _hundredDigit+1, 0
	MOVWF      FARG_display+1
	CALL       _display+0
;EE321_Lab3.c,16 :: 		if(startStopButton) {
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main2
;EE321_Lab3.c,17 :: 		while(startStopButton){}
L_main3:
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;EE321_Lab3.c,18 :: 		state = ~state;
	COMF       _state+0, 1
	COMF       _state+1, 1
;EE321_Lab3.c,19 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;EE321_Lab3.c,20 :: 		}
L_main2:
;EE321_Lab3.c,21 :: 		if(state) {
	MOVF       _state+0, 0
	IORWF      _state+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;EE321_Lab3.c,22 :: 		onesDigit++;
	INCF       _onesDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _onesDigit+1, 1
;EE321_Lab3.c,23 :: 		}
L_main6:
;EE321_Lab3.c,24 :: 		if(onesDigit == 10) {
	MOVLW      0
	XORWF      _onesDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      10
	XORWF      _onesDigit+0, 0
L__main15:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;EE321_Lab3.c,25 :: 		onesDigit = 0;
	CLRF       _onesDigit+0
	CLRF       _onesDigit+1
;EE321_Lab3.c,26 :: 		tensDigit++;
	INCF       _tensDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tensDigit+1, 1
;EE321_Lab3.c,27 :: 		}
L_main7:
;EE321_Lab3.c,28 :: 		if(tensDigit == 10) {
	MOVLW      0
	XORWF      _tensDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      10
	XORWF      _tensDigit+0, 0
L__main16:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;EE321_Lab3.c,29 :: 		tensDigit = 0;
	CLRF       _tensDigit+0
	CLRF       _tensDigit+1
;EE321_Lab3.c,30 :: 		hundredDigit++;
	INCF       _hundredDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hundredDigit+1, 1
;EE321_Lab3.c,31 :: 		}
L_main8:
;EE321_Lab3.c,32 :: 		if(hundredDigit == 10 || resetButton) {
	MOVLW      0
	XORWF      _hundredDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      10
	XORWF      _hundredDigit+0, 0
L__main17:
	BTFSC      STATUS+0, 2
	GOTO       L__main13
	BTFSC      RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L__main13
	GOTO       L_main11
L__main13:
;EE321_Lab3.c,33 :: 		onesDigit = 0;
	CLRF       _onesDigit+0
	CLRF       _onesDigit+1
;EE321_Lab3.c,34 :: 		tensDigit = 0;
	CLRF       _tensDigit+0
	CLRF       _tensDigit+1
;EE321_Lab3.c,35 :: 		hundredDigit = 0;
	CLRF       _hundredDigit+0
	CLRF       _hundredDigit+1
;EE321_Lab3.c,36 :: 		}
L_main11:
;EE321_Lab3.c,37 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;EE321_Lab3.c,38 :: 		}
	GOTO       L_main0
;EE321_Lab3.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_display:

;EE321_Lab3.c,40 :: 		void display(int a,int b, int c) {
;EE321_Lab3.c,41 :: 		PORTA = a;
	MOVF       FARG_display_a+0, 0
	MOVWF      PORTA+0
;EE321_Lab3.c,42 :: 		PORTB = b+(c<<4);
	MOVLW      4
	MOVWF      R1+0
	MOVF       FARG_display_c+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__display19:
	BTFSC      STATUS+0, 2
	GOTO       L__display20
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__display19
L__display20:
	MOVF       R0+0, 0
	ADDWF      FARG_display_b+0, 0
	MOVWF      PORTB+0
;EE321_Lab3.c,43 :: 		}
L_end_display:
	RETURN
; end of _display
