//7.Write a program to print the number in reverse order.
void main(){
  String num='113';

  String reversed='';
  for (int i = num.length - 1; i >= 0; i--) {
    reversed += num[i];
  }

  print('Reverse Number:$reversed');  //Without using inbuilt function....
  //print('Revers Number is:${num.toString().split('').reversed.join('')}'); //with inbuilt function...
}