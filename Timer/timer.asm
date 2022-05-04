
_main:

;timer.c,9 :: 		void main() {
;timer.c,10 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;timer.c,11 :: 		TRISA = 0x60; //  0110 0000
	MOVLW      96
	MOVWF      TRISA+0
;timer.c,12 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;timer.c,13 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;timer.c,14 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;timer.c,17 :: 		T1CON.T1CKPS1 = 1; // Set PRESCALERS
	BSF        T1CON+0, 5
;timer.c,18 :: 		T1CON.T1CKPS0 = 0; // Set PRESCALERS
	BCF        T1CON+0, 4
;timer.c,19 :: 		T1CON.TMR1CS = 0;  // TODO TIMER use internal clock
	BCF        T1CON+0, 1
;timer.c,20 :: 		TMR1H = 0x85;      // TODO TIMER1 Counter TMR1H:TMR1L
	MOVLW      133
	MOVWF      TMR1H+0
;timer.c,21 :: 		TMR1L = 0xEE;      // TODO TIMER1 Counter TMR1H:TMR1L
	MOVLW      238
	MOVWF      TMR1L+0
;timer.c,22 :: 		T1CON.TMR1ON = 1;  // TODO set TIMER1 on
	BSF        T1CON+0, 0
;timer.c,25 :: 		INTCON.GIE = 1; // TURN on global interruts enable
	BSF        INTCON+0, 7
;timer.c,26 :: 		PIE1.TMR1IE = 1; // TURN on timer 1 interrupt
	BSF        PIE1+0, 0
;timer.c,27 :: 		INTCON.PEIE = 1; // TURN on peripheral interrupt enable
	BSF        INTCON+0, 6
;timer.c,29 :: 		while(1) {
L_main0:
;timer.c,30 :: 		if(buttonP == 0 && RA5_bit == 1){
	MOVF       _buttonP+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BTFSS      RA5_bit+0, BitPos(RA5_bit+0)
	GOTO       L_main4
L__main10:
;timer.c,31 :: 		state = state == 9 ? 0 : state + 1;
	MOVF       _state+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	CLRF       ?FLOC___mainT20+0
	CLRF       ?FLOC___mainT20+1
	GOTO       L_main6
L_main5:
	MOVF       _state+0, 0
	ADDLW      1
	MOVWF      ?FLOC___mainT20+0
	MOVLW      0
	MOVWF      ?FLOC___mainT20+1
L_main6:
	MOVF       ?FLOC___mainT20+0, 0
	MOVWF      _state+0
;timer.c,32 :: 		}
L_main4:
;timer.c,33 :: 		if(RA6_bit == 1)
	BTFSS      RA6_bit+0, BitPos(RA6_bit+0)
	GOTO       L_main7
;timer.c,34 :: 		state = 0;
	CLRF       _state+0
L_main7:
;timer.c,35 :: 		buttonP = RA5_bit;
	MOVLW      0
	BTFSC      RA5_bit+0, BitPos(RA5_bit+0)
	MOVLW      1
	MOVWF      _buttonP+0
;timer.c,36 :: 		display(number2,number1,state);
	MOVF       _number2+0, 0
	MOVWF      FARG_display+0
	MOVF       _number1+0, 0
	MOVWF      FARG_display+0
	MOVF       _state+0, 0
	MOVWF      FARG_display+0
	CALL       _display+0
;timer.c,37 :: 		}
	GOTO       L_main0
;timer.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_increment:

;timer.c,40 :: 		void increment() {
;timer.c,41 :: 		number1 = number1 + 1;
	INCF       _number1+0, 1
;timer.c,42 :: 		if(number1 == 10) {
	MOVF       _number1+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_increment8
;timer.c,43 :: 		number1 = 0;
	CLRF       _number1+0
;timer.c,44 :: 		number2++;
	INCF       _number2+0, 1
;timer.c,45 :: 		if( number2 == 10) {
	MOVF       _number2+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_increment9
;timer.c,46 :: 		number2 = 0;
	CLRF       _number2+0
;timer.c,47 :: 		}
L_increment9:
;timer.c,48 :: 		}
L_increment8:
;timer.c,49 :: 		}
L_end_increment:
	RETURN
; end of _increment

_display:

;timer.c,51 :: 		void display(unsigned char num1, unsigned char num2,unsigned char num3){
;timer.c,52 :: 		PORTB = (num3<<4) + num2;
	MOVF       FARG_display_num3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       FARG_display_num2+0, 0
	ADDWF      R0+0, 0
	MOVWF      PORTB+0
;timer.c,53 :: 		PORTA = num1;
	MOVF       FARG_display_num1+0, 0
	MOVWF      PORTA+0
;timer.c,54 :: 		}
L_end_display:
	RETURN
; end of _display

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;timer.c,56 :: 		void interrupt() {
;timer.c,57 :: 		increment();
	CALL       _increment+0
;timer.c,59 :: 		TMR1H = 0x85;
	MOVLW      133
	MOVWF      TMR1H+0
;timer.c,60 :: 		TMR1L = 0xEE;
	MOVLW      238
	MOVWF      TMR1L+0
;timer.c,62 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;timer.c,63 :: 		}
L_end_interrupt:
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
