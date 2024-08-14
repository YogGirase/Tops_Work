//17. Write Program use switch statement. Display Monday to Sunday
import 'dart:io';

void main(){
  // int day=1;
  stdout.write('Enter day:');
  int day=int.parse(stdin.readLineSync()!);
  
  switch(day){
    case 1: print('$day:Monday');
    break;
    case 2:print('$day:Tuesday');
    break;
    case 3:print('$day:Wednesday');
    break;
    case 4:print('$day:Thursday');
    break;
    case 5:print('$day:Friday');
    break;
    case 6:print('$day:Saturday');
    break;
    case 7:print('$day:Sunday');
    break;
    default:print('$day:Invalid Choice');
  }
}
