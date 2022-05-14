
_main:

;one_7_SegDecoder.c,8 :: 		void main() {
;one_7_SegDecoder.c,9 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;one_7_SegDecoder.c,10 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;one_7_SegDecoder.c,11 :: 		TRISA = 0x60;
	MOVLW      96
	MOVWF      TRISA+0
;one_7_SegDecoder.c,12 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;one_7_SegDecoder.c,13 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;one_7_SegDecoder.c,14 :: 		while(1) {
L_main0:
;one_7_SegDecoder.c,15 :: 		display(onesDigit,tensDigit, hundredDigit);
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
;one_7_SegDecoder.c,16 :: 		if(startStopButton) {
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main2
;one_7_SegDecoder.c,17 :: 		while(startStopButton){}
L_main3:
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;one_7_SegDecoder.c,18 :: 		state = ~state;
	COMF       _state+0, 1
	COMF       _state+1, 1
;one_7_SegDecoder.c,19 :: 		delay_ms(500);
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
;one_7_SegDecoder.c,20 :: 		}
L_main2:
;one_7_SegDecoder.c,21 :: 		if(state) {
	MOVF       _state+0, 0
	IORWF      _state+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
;one_7_SegDecoder.c,22 :: 		onesDigit++;
	INCF       _onesDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _onesDigit+1, 1
;one_7_SegDecoder.c,23 :: 		}
L_main6:
;one_7_SegDecoder.c,24 :: 		if(onesDigit == 10) {
	MOVLW      0
	XORWF      _onesDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      10
	XORWF      _onesDigit+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;one_7_SegDecoder.c,25 :: 		onesDigit = 0;
	CLRF       _onesDigit+0
	CLRF       _onesDigit+1
;one_7_SegDecoder.c,26 :: 		tensDigit++;
	INCF       _tensDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tensDigit+1, 1
;one_7_SegDecoder.c,27 :: 		}
L_main7:
;one_7_SegDecoder.c,28 :: 		if(tensDigit == 10) {
	MOVLW      0
	XORWF      _tensDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      10
	XORWF      _tensDigit+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;one_7_SegDecoder.c,29 :: 		tensDigit = 0;
	CLRF       _tensDigit+0
	CLRF       _tensDigit+1
;one_7_SegDecoder.c,30 :: 		hundredDigit++;
	INCF       _hundredDigit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hundredDigit+1, 1
;one_7_SegDecoder.c,31 :: 		}
L_main8:
;one_7_SegDecoder.c,32 :: 		if(hundredDigit == 10 || resetButton) {
	MOVLW      0
	XORWF      _hundredDigit+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      10
	XORWF      _hundredDigit+0, 0
L__main20:
	BTFSC      STATUS+0, 2
	GOTO       L__main16
	BTFSC      RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L__main16
	GOTO       L_main11
L__main16:
;one_7_SegDecoder.c,33 :: 		onesDigit = 0;
	CLRF       _onesDigit+0
	CLRF       _onesDigit+1
;one_7_SegDecoder.c,34 :: 		tensDigit = 0;
	CLRF       _tensDigit+0
	CLRF       _tensDigit+1
;one_7_SegDecoder.c,35 :: 		hundredDigit = 0;
	CLRF       _hundredDigit+0
	CLRF       _hundredDigit+1
;one_7_SegDecoder.c,36 :: 		}
L_main11:
;one_7_SegDecoder.c,37 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;one_7_SegDecoder.c,38 :: 		}
	GOTO       L_main0
;one_7_SegDecoder.c,39 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_display:

;one_7_SegDecoder.c,40 :: 		void display(int a,int b, int c) {
;one_7_SegDecoder.c,41 :: 		PORTB = c;
	MOVF       FARG_display_c+0, 0
	MOVWF      PORTB+0
;one_7_SegDecoder.c,42 :: 		PORTA = 0x03;
	MOVLW      3
	MOVWF      PORTA+0
;one_7_SegDecoder.c,43 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_display13:
	DECFSZ     R13+0, 1
	GOTO       L_display13
	DECFSZ     R12+0, 1
	GOTO       L_display13
	DECFSZ     R11+0, 1
	GOTO       L_display13
;one_7_SegDecoder.c,44 :: 		PORTB = a;
	MOVF       FARG_display_a+0, 0
	MOVWF      PORTB+0
;one_7_SegDecoder.c,45 :: 		PORTA = 0x06;
	MOVLW      6
	MOVWF      PORTA+0
;one_7_SegDecoder.c,46 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_display14:
	DECFSZ     R13+0, 1
	GOTO       L_display14
	DECFSZ     R12+0, 1
	GOTO       L_display14
	DECFSZ     R11+0, 1
	GOTO       L_display14
;one_7_SegDecoder.c,47 :: 		PORTB = b;
	MOVF       FARG_display_b+0, 0
	MOVWF      PORTB+0
;one_7_SegDecoder.c,48 :: 		PORTA = 0x05;
	MOVLW      5
	MOVWF      PORTA+0
;one_7_SegDecoder.c,49 :: 		delay_ms(150);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_display15:
	DECFSZ     R13+0, 1
	GOTO       L_display15
	DECFSZ     R12+0, 1
	GOTO       L_display15
	DECFSZ     R11+0, 1
	GOTO       L_display15
;one_7_SegDecoder.c,50 :: 		}
L_end_display:
	RETURN
; end of _display
