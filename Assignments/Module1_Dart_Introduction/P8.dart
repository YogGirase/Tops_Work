/*8. Write a program to calculate sum of 5 subjects & find the percentage.
     Subject marks entered by user.
 */
import 'dart:io';

void main(){


  stdout.write('Enter Math marks:');
  int sub1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter English Marks:');
  int sub2 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter Gujarati Marks:');
  int sub3= int.parse(stdin.readLineSync()!);

  stdout.write('Enter Hindi Marks:');
  int sub4=int.parse(stdin.readLineSync()!);

  stdout.write('Enter Science Marks:');
  int sub5=int.parse(stdin.readLineSync()!);

  int sum= sub1 + sub2 + sub3 + sub4 + sub5;
  double percentage= (sum / 500) * 100;

  print('Total Marks:$sum  Percentage:$percentage%');


}