//11. Write a Program to check the given year is leap year or not.

void main(){
  int year = 2021;

  if(year % 400==0 || year % 100 != 0 && year % 4 == 0){
    print('Year:$year is Leap year...');
  }else{
    print('Year:$year is not leap year...');
  }
}