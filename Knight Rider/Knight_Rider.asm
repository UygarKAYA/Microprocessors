
_main:

;Knight_Rider.c,3 :: 		void main() {
;Knight_Rider.c,5 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;Knight_Rider.c,6 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Knight_Rider.c,8 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;Knight_Rider.c,9 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Knight_Rider.c,11 :: 		while(1)
L_main0:
;Knight_Rider.c,13 :: 		if(RA0_bit == 1)
	BTFSS      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
;Knight_Rider.c,16 :: 		PORTB = value;
	MOVF       _value+0, 0
	MOVWF      PORTB+0
;Knight_Rider.c,17 :: 		value = value << 1;
	RLF        _value+0, 1
	BCF        _value+0, 0
;Knight_Rider.c,18 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Knight_Rider.c,20 :: 		if(RB7_bit == 1)
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main4
;Knight_Rider.c,22 :: 		value = 0x40;
	MOVLW      64
	MOVWF      _value+0
;Knight_Rider.c,23 :: 		for (i=0; i<6; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main5:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      6
	SUBWF      _i+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Knight_Rider.c,24 :: 		PORTB = value;
	MOVF       _value+0, 0
	MOVWF      PORTB+0
;Knight_Rider.c,25 :: 		value = value >> 1;
	RRF        _value+0, 1
	BCF        _value+0, 7
;Knight_Rider.c,26 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;Knight_Rider.c,23 :: 		for (i=0; i<6; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Knight_Rider.c,27 :: 		}
	GOTO       L_main5
L_main6:
;Knight_Rider.c,28 :: 		}
L_main4:
;Knight_Rider.c,29 :: 		}
L_main2:
;Knight_Rider.c,30 :: 		}
	GOTO       L_main0
;Knight_Rider.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
