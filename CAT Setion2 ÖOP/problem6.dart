import 'dart:io';

// ===================== Enums =====================
enum Size { Small, Medium, Large }

// ===================== Abstract Pizza Class =====================
abstract class Pizza {
  String name;
  Size size;
  double price;
  List<String> toppings;

  Pizza(this.name, this.size, this.price, [this.toppings = const []]);

  double calculatePrice(); // Abstract method

  @override
  String toString() {
    return 'Pizza: $name, Size: $size, Toppings: ${toppings.isEmpty ? 'None' : toppings.join(', ')}, Price: \$${calculatePrice().toStringAsFixed(2)}';
  }
}

// ===================== Child Pizza Classes =====================
class MargheritaPizza extends Pizza {
  MargheritaPizza(Size size) : super('Margherita', size, 5.0);

  @override
  double calculatePrice() {
    switch (size) {
      case Size.Small:
        return price;
      case Size.Medium:
        return price + 2;
      case Size.Large:
        return price + 4;
    }
  }
}

class PepperoniPizza extends Pizza {
  PepperoniPizza(Size size) : super('Pepperoni', size, 6.0);

  @override
  double calculatePrice() {
    double extra = 2.0; // extra for pepperoni
    switch (size) {
      case Size.Small:
        return price + extra;
      case Size.Medium:
        return price + extra + 2;
      case Size.Large:
        return price + extra + 4;
    }
  }
}

class VeggiePizza extends Pizza {
  VeggiePizza(Size size, List<String> toppings)
      : super('Veggie', size, 5.5, toppings);

  @override
  double calculatePrice() {
    double toppingCost = toppings.length * 1.5;
    switch (size) {
      case Size.Small:
        return price + toppingCost;
      case Size.Medium:
        return price + 2 + toppingCost;
      case Size.Large:
        return price + 4 + toppingCost;
    }
  }
}

// ===================== Order Class =====================
class Order {
  String orderId;
  String customerId;
  Pizza pizza;
  double totalPrice = 0.0;

  Order(this.orderId, this.customerId, this.pizza);

  void confirmOrder() {
    totalPrice = pizza.calculatePrice();
    print('\nOrder confirmed!');
  }

  void payOrder(double amount) {
    if (amount >= totalPrice) {
      print(
          'Payment successful. Change: \$${(amount - totalPrice).toStringAsFixed(2)}\n');
    } else {
      print('Insufficient payment. Order not completed.\n');
    }
  }

  @override
  String toString() {
    return 'Order ID: $orderId\nCustomer ID: $customerId\n${pizza.toString()}\nTotal: \$${totalPrice.toStringAsFixed(2)}';
  }
}

// ===================== Main Program =====================
void main() {
  print('🍕 Welcome to the Pizza Ordering System 🍕\n');

  while (true) {
    print('1. Order a Pizza\n2. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    if (choice == '2') break;

    // Pizza selection
    print('\nChoose pizza type:\n1. Margherita\n2. Pepperoni\n3. Veggie');
    stdout.write('Enter choice: ');
    String? typeChoice = stdin.readLineSync();

    print('\nChoose size:\n1. Small\n2. Medium\n3. Large');
    stdout.write('Enter size: ');
    String? sizeInput = stdin.readLineSync();
    Size size = Size.values[int.parse(sizeInput!) - 1];

    Pizza pizza;

    if (typeChoice == '1') pizza = MargheritaPizza(size);
    else if (typeChoice == '2') pizza = PepperoniPizza(size);
    else {
      // Veggie pizza with extra toppings
      print('Enter toppings separated by comma (e.g., Tomato,Mushroom): ');
      String? toppingsInput = stdin.readLineSync();
      List<String> toppings =
          toppingsInput!.split(',').map((e) => e.trim()).toList();
      pizza = VeggiePizza(size, toppings);
    }

    stdout.write('\nEnter customer ID: ');
    String? customerId = stdin.readLineSync();
    var order = Order('ORD001', customerId!, pizza);

    order.confirmOrder();

    stdout.write('Enter payment amount: ');
    double payment = double.parse(stdin.readLineSync()!);
    order.payOrder(payment);

    print('Final Order Details:\n${order.toString()}');
    print('-----------------------------\n');
  }

  print('Thank you for using the Pizza Ordering System!');
}