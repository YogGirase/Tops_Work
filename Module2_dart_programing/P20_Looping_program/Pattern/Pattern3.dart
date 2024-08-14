/*
* 1
* 22
* 333
* 4444
* 55555
* */
import 'dart:io';

void main(){

  for(int i=1;i<=5;i++){
    for(int j=1;j<=i;j++){
      stdout.write('$i');
    }
    stdout.write('\n');
  }
}