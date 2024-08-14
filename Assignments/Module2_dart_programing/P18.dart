/*
* 19. Write a program of to find out the Area of Triangle, Rectangle and
*     Circle using If Condition.(Must Be Menu Driven)
* */
import 'dart:io';

void main(){
  stdout.write('''  1.Area of Triangle.
  2.Area of Rectangle.
  3.Area of Circle.
  Enter your choice:''');
  int ch=int.parse(stdin.readLineSync()!);
if(ch==1||ch==2||ch==3) {
  if (ch == 1) {
    print('Your choice is:Area of Triangle...');
    int base = 10;
    int height = 10;

    double triangle = 0.5 * base * height;

    print('Area of Triangle is:$triangle');
  }
  if (ch == 2) {
    print('''Your Choice is:Area of rectangle...''');
    int length = 10;
    int width = 10;

    int rectangle = length * width;

    print('Area of Rectangle is:$rectangle');
  }
  if (ch == 3) {
    print('Your choice is:Area of Circle...');
    double pi = 3.14;
    double radius = 10;

    double circle = pi * radius * radius;

    print('Area of circle is:$circle');
  }
}else{
  print('Invalid Choice...');
}
}
