//14. Write a program to find the Max number from the given three
// number using Ternary Operator
void main(){
  int num1=1;
  int num2=2;
  int num3=3;

  int maxNumber=(num1 > num2) ? (num1 > num3 ? num1 : num3) : (num2 >= num3 ? num2 : num3);

  print('''Num1:$num1, Num2:$num2, Num3:$num3 
  The Max Number is:$maxNumber''');

}
