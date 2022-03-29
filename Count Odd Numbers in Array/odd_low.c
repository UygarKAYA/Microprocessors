num = 10;
array[10] = {200, 7, 3, 5, 14, 15, 16, 114, 115, 200};

START: 
  tmp = *ptr;
  tmp = ~(tmp & 0x01);
  tmp = ~tmp;
  if(tmp == 0) goto JUMP;
  cnt++;
JUMP: 
  ptr++;
  ii++;
  tmp = ii;
  tmp = tmp < num;
  if(tmp == 0) goto END;
    goto START;
END: 
  goto END;