//Hex Converter

#include <stdio.h>

int main()
{
  int dec, i = 0;
  char hex[10];
  char neg = 0;

  printf("Enter an integer:");
  scanf("%d", &dec);

  //set neg flag and change to positive dec
  if(dec < 0)
  {
    neg = 1;
    dec *= -1;
  }

  //convert decimal to hex
  do
  {
    int part = dec % 16;
    dec /= 16;
    if(part < 10){
      hex[i] = part + 48;
    }
    else
    {
      hex[i] = part + 55;
    }
    printf("hex: %c\n",hex[i]);
    i++;
  }  while(dec > 0);

  //add Sign
  if(neg == 1)
  {
    hex[i] = '-';
  }
  else
  {
    hex[i] = '+';
  }

  //denote end of string
  hex[i+1] = 0;

  //reverse order to properly display hex
  int l = 0;
  while(l<i)
  {
    char temp = hex[l];
    hex[l] = hex[i];
    hex[i] = temp;
    i--;
    l++;
  }

  printf("Hexadecimal: %s", hex);
}
