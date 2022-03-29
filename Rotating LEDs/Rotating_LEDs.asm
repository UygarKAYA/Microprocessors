
_main:

;Rotating_LEDs.c,2 :: 		void main() {
;Rotating_LEDs.c,4 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;Rotating_LEDs.c,5 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Rotating_LEDs.c,7 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;Rotating_LEDs.c,8 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;Rotating_LEDs.c,10 :: 		while(1)
L_main0:
;Rotating_LEDs.c,12 :: 		if (RA0_bit == 1)
	BTFSS      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
;Rotating_LEDs.c,14 :: 		PORTB = value;
	MOVF       _value+0, 0
	MOVWF      PORTB+0
;Rotating_LEDs.c,15 :: 		value = value << 1;
	RLF        _value+0, 1
	BCF        _value+0, 0
;Rotating_LEDs.c,16 :: 		delay_ms(250);
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
;Rotating_LEDs.c,18 :: 		if (RB7_bit == 1)
	BTFSS      RB7_bit+0, BitPos(RB7_bit+0)
	GOTO       L_main4
;Rotating_LEDs.c,20 :: 		value = 0x01;
	MOVLW      1
	MOVWF      _value+0
;Rotating_LEDs.c,21 :: 		PORTB = value;
	MOVLW      1
	MOVWF      PORTB+0
;Rotating_LEDs.c,22 :: 		value = value << 1;
	RLF        _value+0, 1
	BCF        _value+0, 0
;Rotating_LEDs.c,23 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;Rotating_LEDs.c,24 :: 		}
L_main4:
;Rotating_LEDs.c,25 :: 		}
	GOTO       L_main6
L_main2:
;Rotating_LEDs.c,28 :: 		PORTB = value;
	MOVF       _value+0, 0
	MOVWF      PORTB+0
;Rotating_LEDs.c,29 :: 		value = value >> 1;
	RRF        _value+0, 1
	BCF        _value+0, 7
;Rotating_LEDs.c,30 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Rotating_LEDs.c,32 :: 		if (RB0_bit == 1)
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main8
;Rotating_LEDs.c,34 :: 		value = 0x80;
	MOVLW      128
	MOVWF      _value+0
;Rotating_LEDs.c,35 :: 		PORTB = value;
	MOVLW      128
	MOVWF      PORTB+0
;Rotating_LEDs.c,36 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Rotating_LEDs.c,37 :: 		}
L_main8:
;Rotating_LEDs.c,38 :: 		}
L_main6:
;Rotating_LEDs.c,39 :: 		}
	GOTO       L_main0
;Rotating_LEDs.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
