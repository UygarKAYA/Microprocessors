/*
 * This program computes "cnt":
 *                number of odd numbers in the array
 */

typedef unsigned char byte;

byte num=10; // size of the array
byte array[10] = {200,2,3,5,14,15,16,114,115,200};
byte cnt=0;  // number of odd numbers in the array

main() {
  byte ii=0;
  
  loopTop:

  if((array[ii] & 0x01) == 0)
    goto loopBottom;

  cnt++;

  loopBottom:

  ii++;
  if(ii == num)
    return;

  goto loopTop;
}
