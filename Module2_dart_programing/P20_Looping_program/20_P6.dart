//6.Write a program you have to print the table of given number
import 'dart:io';

void main(){
    stdout.write('Enter a Number:');
    int num=int.parse(stdin.readLineSync()!);
    print('Table of $num');

    for(int i=1;i<=10;i++){
       int table = num*i;
       stdout.write('$i*$num:$table\n');

    }
    
}