/*
9. Write a Program to show swap of two No's without using third variable.
 */

void main(){
  int num1=10;
  int num2=20;

  print('Before Swapping Numbers...');
  print('Number1=$num1    Number2=$num2');

  num1=num1+num2;
  num2=num1-num2;
  num1=num1-num2;

  print('\nAfter Swapping Numbers...');
  print('Number1=$num1    Number2=$num2');
}