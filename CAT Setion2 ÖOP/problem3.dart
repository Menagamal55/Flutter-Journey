void main() {
  Mother mother = Mother(
    'Doaa',
  );
  Daughtor daughtor = Daughtor('Romisaa');
  mother.displayinfo();
  print('================================');
  daughtor.displayinfo();
}

class Mother {
  String name;

  Mother(this.name);
  void displayinfo() {
    print(' Iam a :$name');
    print("This is Mum's class ");
  }
}

class Daughtor extends Mother {
  Daughtor(super.name);
  @override
  void displayinfo() {
    print(' Iam a :$name');
    print("This is the daughter's class.");
  }
}