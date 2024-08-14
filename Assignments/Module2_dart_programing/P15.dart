/*
* 16. Write a program user enter the 5 subjects mark. You have to make a
* total and find the percentage. percentage > 75 you have to print
* “Distinction” percentage > 60 and percentage <= 75 you have to
* print “First class” percentage >50 and percentage <= 60 you have to print
* “Second class” percentage > 35 and percentage <= 50 you have to
* print “Pass class” Otherwise print “Fail”
* */
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
  
  if(percentage>75) {
    print('Total Marks:$sum        Percentage:$percentage%');
    print('Result:Distinction');
    if (percentage > 60 && percentage <= 75) {
      print('Total Marks:$sum        Percentage:$percentage%');
      print('Result:First Class');
    }
    if (percentage > 50 && percentage <= 60) {
      print('Total Marks:$sum        Percentage:$percentage%');
      print('Result:Second Class');
    }
    if (percentage > 35 && percentage <= 50) {
      print('Total Marks:$sum        Percentage:$percentage%');
      print('Result:Pass');
    }
   }else{
    print('Total Marks:$sum        Percentage:$percentage%');
      print('Result:Fail');
    }

}
