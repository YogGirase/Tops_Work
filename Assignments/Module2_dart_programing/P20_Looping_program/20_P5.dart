//5.Write a program you have to print the Fibonacci series up to user given number
import 'dart:io';

void main(){
  stdout.write('Enter a number:');
  int num=int.parse(stdin.readLineSync()!);

  int a=0;
  int b=1;
  int temp=0;

  print('Fibonacci Series to:$num');
  for(int i=0;a<=num;i++){
    stdout.write('$a,');
    temp = a+b;
    a = b;
    b=temp;
  }
}


