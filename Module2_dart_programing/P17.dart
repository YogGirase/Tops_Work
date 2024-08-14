//18. Write a Program of Addition, Subtraction ,Multiplication and
// Division using Switch case.(Must Be Menu Driven)
import 'dart:io';

void main(){
  int num1=10;
  int num2=20;
  print('''Enter Your choice
  1.Addition
  2.Subtraction
  3.Multiplication
  4.Division''');

  int ch=int.parse(stdin.readLineSync()!);

  int sum=num1+num2;
  int sub=num1-num2;
  int multi=num1*num2;
  double div=num1/num2;
  switch(ch){
    case 1:print('Your choice is $ch:Addition...');
           print('Number1:$num1  Number2:$num2');
           print('Addition=$sum');
           break;
    case 2:print('Your choice is $ch:Subtraction...');
           print('Number1:$num1  Number2:$num2');
           print('Subtraction=$sub');
           break;
    case 3:print('Your choice is $ch:Multiplication...');
           print('Number1:$num1  Number2:$num2');
           print('Multiplication=$multi');
           break;
    case 4:print('Your choice is $ch:Division...');
           print('Number1:$num1  Number2:$num2');
           print('Division=$div');
           break;
    default:print('$ch:Invalid Choice');
  }
}