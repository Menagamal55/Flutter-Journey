import 'dart:io';

void main() {
  print('Enter Num 1 :');
  int num1 = int.parse(stdin.readLineSync() ?? '0');
  print('Enter Num 2 :');
  int num2 = int.parse(stdin.readLineSync() ?? '0');
  Calcaulator calc = Calcaulator();
  print('Result of Sum = ${calc.sum(num1, num2)}');
  print('Result of subtraction = ${calc.subtraction(num1, num2)}');
  print('Result of multiplication = ${calc.multiplication(num1, num2)}');
  print('Result of division = ${calc.division(num1, num2)}');
}

class Calcaulator {
  int sum(int num1, int num2) {
    return num1 + num2;
  }

  int subtraction(int num1, int num2) {
    return num1 - num2;
  }

  int multiplication(int num1, int num2) {
    return num1 * num2;
  }

  double division(int num1, int num2) {
    return num1 / num2;
  }
}