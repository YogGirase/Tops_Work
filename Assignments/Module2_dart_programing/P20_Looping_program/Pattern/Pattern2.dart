/*
* 1
* 12
* 123
* 1234
* 12345
* */

import 'dart:io';

void main(){
  for(int i=1;i<=5;i++){
    for(int j=1;j<=i;j++){
      stdout.write('$j');
    }stdout.write('\n');
  }
}
