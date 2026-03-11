void main() {
  Zebra zebra = Zebra();
  zebra.set_value("Marty", 5);
  zebra.placeoforigin = "Africa";
  zebra.displayInfoWithZebra(); 

  print("==============================="); 


  Dolphin dolphin = Dolphin();
  dolphin.set_value("Flipper", 8);
  dolphin.placeoforigin = "Oceans worldwide";
  dolphin.displayInfoWithDolphin(); 
}

class Animal {
  String? _name;
  int? _age;
  void set_value(String name, int age) {
    this._name = name;
    this._age = age;
  }
  String? get name => _name;
  int? get age => _age;
}

class Dolphin extends Animal {
  String? placeoforigin;

  void displayInfoWithDolphin() {
    print('this is a dolphin, name is $_name,age is :$_age , place of origin that it is live in is $placeoforigin');


  }
}
class Zebra extends Animal {
  String? placeoforigin;

  void displayInfoWithZebra() {
    print('this is a Zebra, name is $_name,age is :$_age , place of origin that it is live in is $placeoforigin');

  }
}