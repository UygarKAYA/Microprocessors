void main () {

     PCON.OSCF = 1;
     CMCON = 0x07;

     TRISA = 0x80; // arrenge RA7 as input and others pins of Port A as Output.
     TRISB = 0xFF; // arrange Port B as input.
     RA0_bit = 0;  // where the led is conncected is lov.

     while(1)
     {
             if(RA7_bit == 1)
             {
                        RA0_bit = 1;
                        delay_ms(1000);
                        RA0_bit = 0;
                        delay_ms(1000);
             }
             else
             {
                        RA0_bit = 0;
             }
     }
}
