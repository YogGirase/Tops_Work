/*13. Write a program to find the Max number from the given three
      number using Nested If
*/
void main(){
  int num1=1;
  int num2=2;
  int num3=3;

  if (num1 > num2) {
    if (num1 > num3) {
      print('$num1 is the max number.');
    } else {
      print('$num3 is the max number.');
    }
  } else {
    if (num2 > num3) {
      print('$num2 is the max number.');
    } else {
      print('$num3 is the max number.');
    }
  }
}