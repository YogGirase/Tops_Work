//Write a program make a summation of given number(E.g. 1523 ans :-11)
import 'dart:io';

int digitSum(int num) {
  int sum = 0;
  while (num != 0) {
    sum += num % 10;
    num ~/= 10;
  }
  return sum;
}

void main() {
  stdout.write("Enter a Number: ");
  int num = int.parse(stdin.readLineSync()!);

  int sum = digitSum(num);
  print("Summation of given number: $sum");   
}