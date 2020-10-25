//Binary Converter

#include <stdio.h>

int main()
{
  int dec, i = 0;
  int decAlt = 0;
  char str[33], two[33];
  char neg = 0;

  printf("Enter an integer:");
  scanf("%d",&dec);

  //make dec positive, make addjustments and set neg flag
  if(dec < 0)
  {
    neg = 1;
    decAlt = dec * -1;
    dec = dec * -1 - 1;
  }

  //handling -1 exception
  if(neg == 1 && dec == 0)
  {
    two[0] = '1';
    str[0] = '1';
    i = 1;
  }

  //translating decimal to binary
  while(dec > 0 || decAlt > 0)
  {
    int current = dec & 1;                 //isolates a single bit
    if(neg == 1)
    {
      int currentAlt = decAlt & 1;         //islolate single bit for current alt
      two[i] = (current ^ 1)  + 48;
      str[i] = currentAlt + 48;
      decAlt = decAlt >> 1;                //line up bit for next iteration of decAlt
    }
    else
    {
      two[i] = current + 48;
      str[i] = two[i];
    }
    dec = dec >> 1;                       //lines up bit for next interation
    i++;
  }

  //adding leading modifiers.
  if(neg == 1)
  {
    two[i] = '1';
    str[i] = '-';
  }
  else
  {
    two[i] = '0';
    str[i] = '+';
  }

  //denote end of string
  two[i+1] = 0;
  str[i+1] = 0;

  //this next part reverces the string so that the binary value is in the right order
  int l = 0;
  while(l<i)
  {
    char temp = two[l];
    two[l] = two[i];
    two[i] = temp;

    temp = str[l];
    str[l] = str[i];
    str[i] = temp;
    i--;
    l++;
  }

  printf("Magnitude plus Sign: %s\nTwo's Complement: %s\n", str, two);
}
