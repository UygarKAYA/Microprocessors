#line 1 "C:/Users/ASUS/Documents/Electrical & Electronic Engineering/EE 321/Lab/Lab 1/led_switch.c"
void main () {

 PCON.OSCF = 1;
 CMCON = 0x07;

 TRISA = 0x80;
 TRISB = 0xFF;
 RA0_bit = 0;

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
