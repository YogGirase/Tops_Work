/*
* 1
* 10
* 101
* 1010
* 10101
* */
import 'dart:io';

void main(){
  int num=1;
  for(int i=1;i<=5;i++){
    for(int j=1;j<=i;j++){
      if(num.isEven){
        stdout.write('0 ');
      }
      else{
        stdout.write('1 ');
      }
      num++;
    }stdout.write('\n');
  }
}