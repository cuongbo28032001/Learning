// ignore_for_file: avoid_print

import 'package:dart_oop_base/models/home.dart';
import 'package:dart_oop_base/models/person.dart';
import 'package:dart_oop_base/models/student.dart';

void main(List<String> args) {
  //default constructor
  var person = Person("An", 20);
  print(person.name);

  // gọi biến _age qua phương thứ getter, setter
  // person.setAge = 20;
  // int? age = person.getAge;
  // print(age);

  person.age = 20;
  person.name = "Cường";

  //named constructor
  var personNamed = Person.VietNam();
  print(personNamed.name);

  //factory
  var personfactory = Person.option(2);
  print(personfactory.name);

  //bool session option constructor
  // var personBoolSession = Person('An');
  // print(personBoolSession.name);

  //named option constructor
  // var personNamedOption = Person(name: 'An', age: 20);
  // print(personNamedOption.age);

  //Function static
  Person.talk();

  //Function default
  // var personAge = Person(age: 20);
  // personAge.read();

  //Kế thừa
  var home = Home();
  home.nameHome = "Home";
  print(home.nameHome);
  var student = Student('Cường', 23, id: '1', className: '12A1');
  student.nameHome = home.nameHome;
  student.read();
  student.showInfoStudent();
  student.homeWork();
}
