#line 1 "C:/Users/ASUS/Documents/Electrical & Electronic Engineering/EE 321/Laboratory/Lab 3/EE321_Lab3.c"


int state = 0;
int onesDigit = 0;
int tensDigit = 0;
int hundredDigit = 0;
void display(int,int, int);
void main() {
 PCON.OSCF = 1;
 TRISB = 0x00;
 TRISA = 0xF0;
 PORTA = 0x00;
 PORTB = 0x00;
 while(1) {
 display(onesDigit,tensDigit, hundredDigit);
 if( RA5_bit ) {
 while( RA5_bit ){}
 state = ~state;
 delay_ms(500);
 }
 if(state) {
 onesDigit++;
 }
 if(onesDigit == 10) {
 onesDigit = 0;
 tensDigit++;
 }
 if(tensDigit == 10) {
 tensDigit = 0;
 hundredDigit++;
 }
 if(hundredDigit == 10 ||  RA6_bit ) {
 onesDigit = 0;
 tensDigit = 0;
 hundredDigit = 0;
 }
 delay_ms(100);
 }
}
void display(int a,int b, int c) {
 PORTA = a;
 PORTB = b+(c<<4);
}
