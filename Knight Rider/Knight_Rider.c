unsigned char value = 0x01;
int i;
void main() {

     PCON.OSCF = 1;
     CMCON = 0x07;
     
     TRISA = 0xFF;
     TRISB = 0x00;
     
     while(1)
     {
             if(RA0_bit == 1)
             {

                    PORTB = value;
                    value = value << 1;
                    delay_ms(250);
                     
                     if(RB7_bit == 1)
                     {
                            value = 0x40;
                            for (i=0; i<6; i++) {
                                PORTB = value;
                                value = value >> 1;
                                delay_ms(250);
                            }
                     }
             }
     }
}