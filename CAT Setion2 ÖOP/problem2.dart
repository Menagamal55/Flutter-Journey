import 'dart:io';

void main() {
  print('Enter the width:');
  double width = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  print('Enter the height:');
  double height = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  Triangle triangle = Triangle(width, height);
  Rectangle rectangle = Rectangle(width, height);

  print(triangle.area());
  print(rectangle.area());
}

abstract class Shape {
  double width;
  double height;
  Shape(this.width, this.height);
  double area();
}

class Triangle extends Shape {
  Triangle(double width, double height) : super(width, height);

  @override
  double area() {
    return 0.5 * width * height;
  }

  @override
  String toString() => 'The Area of the triangle: ${area()}';
}

class Rectangle extends Shape {
  Rectangle(double width, double height) : super(width, height);

  @override
  double area() {
    return width * height;
  }

  @override
  String toString() => 'The Area of the rectangle: ${area()}';
}