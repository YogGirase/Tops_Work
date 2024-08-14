//Write a program you have to make a summation of first and last Digit.(E.g. 1234 ans:-5)
import 'dart:io';

int firstLastSum(int n) {
  int lastdigit = n % 10;

  while (n >= 10) {
    n ~/= 10;
  }
  int firstdigit = n;

  return firstdigit + lastdigit;
}

void main() {
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  int sum = firstLastSum(num);
  print("Summation of first and last digits: $sum");
}