/*
* 10. Write a Program to check the given number is Positive, Negative.
*/
import 'dart:io';

void main(){
  stdout.write('Enter a Number:');
  int num=int.parse(stdin.readLineSync()!);

  if(num>0){
    print('Number $num is Positive...');
  }
  else{
    print('Number is Negative...');
  }
}