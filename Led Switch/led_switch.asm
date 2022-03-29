
_main:

;led_switch.c,1 :: 		void main () {
;led_switch.c,3 :: 		PCON.OSCF = 1;
	BSF        PCON+0, 3
;led_switch.c,4 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;led_switch.c,6 :: 		TRISA = 0x80; // arrenge RA7 as input and others pins of Port A as Output.
	MOVLW      128
	MOVWF      TRISA+0
;led_switch.c,7 :: 		TRISB = 0xFF; // arrange Port B as input.
	MOVLW      255
	MOVWF      TRISB+0
;led_switch.c,8 :: 		RA0_bit = 0;  // where the led is conncected is lov.
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;led_switch.c,10 :: 		while(1)
L_main0:
;led_switch.c,12 :: 		if(RA7_bit == 1)
	BTFSS      RA7_bit+0, BitPos(RA7_bit+0)
	GOTO       L_main2
;led_switch.c,14 :: 		RA0_bit = 1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;led_switch.c,15 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;led_switch.c,16 :: 		RA0_bit = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;led_switch.c,17 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;led_switch.c,18 :: 		}
	GOTO       L_main5
L_main2:
;led_switch.c,21 :: 		RA0_bit = 0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;led_switch.c,22 :: 		}
L_main5:
;led_switch.c,23 :: 		}
	GOTO       L_main0
;led_switch.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
