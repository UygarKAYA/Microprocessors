#define startStopButton RA5_bit
#define resetButton RA6_bit
int state = 0;
int onesDigit = 0;
int tensDigit = 0;
int hundredDigit = 0;
void display(int,int, int);
void main() {
        PCON.OSCF = 1;
        TRISB = 0x00;
        TRISA = 0x60;
        PORTA = 0x00;
        PORTB = 0x00;
        while(1) {
                display(onesDigit,tensDigit, hundredDigit);
                if(startStopButton) {
                        while(startStopButton){}
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
                if(hundredDigit == 10 || resetButton) {
                        onesDigit = 0;
                        tensDigit = 0;
                        hundredDigit = 0;
                }
                delay_ms(250);
        }
}
void display(int a,int b, int c) {
                PORTB = c;
                PORTA = 0x03;
                delay_ms(150);
                PORTB = a;
                PORTA = 0x06;
                delay_ms(150);
                PORTB = b;
                PORTA = 0x05;
                delay_ms(150);
}