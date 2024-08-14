//Write a program to print the 100 to 81 using do while loop
import 'dart:io';

void main(){
  int num=100;
  do{
    stdout.write('$num,');
    num--;
  }while(num>=81);
}