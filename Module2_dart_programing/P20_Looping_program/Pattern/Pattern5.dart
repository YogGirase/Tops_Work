/*
*       1
*      21
*     321
*    4321
*   54321
* */
import 'dart:io';

void main(){
  for(int i=1;i<=5;i++){
    for(int j=1;j<=5-i;j++){
      stdout.write(' ');
    }for(int k=i;k>=1;k--){
      stdout.write('$k');
    }
    stdout.write('\n');
  }
}
