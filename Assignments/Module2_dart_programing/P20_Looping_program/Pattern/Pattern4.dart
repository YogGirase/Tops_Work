/*
        *
       **
      ***
     ****
    *****
*/
import 'dart:io';

void main(){


  for(int i=1;i<=5;i++){
    for(int j=1;j<=5-i;j++){
      stdout.write(' ');
    }
    for(int k=1;k<=i;k++){
      stdout.write('*');
    }
    stdout.write('\n');
  }
}