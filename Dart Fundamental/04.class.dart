class Person {
  String name = '';
  int age = 0;
  int result = 0;
  static const salutation = "hello , how are you?";
  Person({String name = "Abhi", int age = 0}) {
    name = name;
    this.age = age;
  }
  Person.oldPerson({this.name = ""}) {
    this.age = 80;
  }
  void _hello() {
    print('Hello Abhishek');
  }

  int get getResult {
    return result;
  }


  static String sayHi() {
    return salutation;
  }
}

void main() {
  var p1 = Person.oldPerson(name: "Abhishek Singh");
  print(p1.getResult);
  p1._hello();
}
