//Write a program to find out the max from given number (E.g. No: -1562) Max number is 6
import 'dart:io';

void main(){
  int digit,maxnumber=0;

  stdout.write('Enter a Number:');
  int num=int.parse(stdin.readLineSync()!);

  while (num > 0) {
    digit = num % 10;
    if (digit > maxnumber) {
      maxnumber = digit;
    }
    num ~/= 10;
  }
  print('Max number is:$maxnumber');
}
