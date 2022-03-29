#line 1 "C:/Users/ASUS/Documents/Electrical & Electronic Engineering/EE 321/Lab/Lab 1/microC/Rotating_LEDs.c"
unsigned char value = 0x80;
void main() {

 PCON.OSCF = 1;
 CMCON = 0x07;

 TRISA = 0xFF;
 TRISB = 0x00;

 while(1)
 {
 if (RA0_bit == 1)
 {
 PORTB = value;
 value = value << 1;
 delay_ms(250);

 if (RB7_bit == 1)
 {
 value = 0x01;
 PORTB = value;
 value = value << 1;
 delay_ms(250);
 }
 }
 else
 {
 PORTB = value;
 value = value >> 1;
 delay_ms(250);

 if (RB0_bit == 1)
 {
 value = 0x80;
 PORTB = value;
 delay_ms(250);
 }
 }
 }
}
