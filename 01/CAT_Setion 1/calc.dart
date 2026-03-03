import 'dart:io';

void main() {
  while (true) {
    stdout.write("Enter first number (or 'exit' to quit): ");
    String? input1 = stdin.readLineSync();
    if (input1 == "exit") {
      print("Program ended.");
      break;
    }

    stdout.write("Enter second number: ");
    String? input2 = stdin.readLineSync();

    stdout.write("Enter operation (+, -, *, /): ");
    String? op = stdin.readLineSync();

    double num1 = double.parse(input1!);
    double num2 = double.parse(input2!);
    double result;

    switch (op) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        print("Invalid operation!");
        continue;
    }

    print("Result: $result\n");
  }
}