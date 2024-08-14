/*
* 1
* 4 4
* 9 9 9
* 16 16 16 16
* 25 25 25 25 25
* */

import 'dart:io';

void main(){

  for(int i=1;i<=5;i++){
    int num= i * i;
    for(int j=1;j<=i;j++){
      stdout.write('$num ');
    }
    stdout.write('\n');
  }
}