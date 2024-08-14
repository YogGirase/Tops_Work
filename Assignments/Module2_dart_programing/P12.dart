//12. Write a Program to check the given number is prime or not prime.
void main(){
  int num=3;

  bool isPrime = true;
  if (num <= 1) {
    isPrime = false;
  } else {
    for (int i = 2; i <= num / 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
  }
  if(isPrime){
    print('$num is prime.');
  } else {
    print('$num is not prime.');
  }
}
