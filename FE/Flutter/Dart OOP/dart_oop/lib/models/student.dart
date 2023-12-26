import 'package:dart_oop_base/models/office.dart';
import 'package:dart_oop_base/models/person.dart';

import 'home.dart';

class Student extends Person with Home implements Office {
  String? id;
  String? className;

  // class Person sủ dụng kiểu paramater constructor
  Student(super.name, super.age, {this.id, this.className});

  // class Person không sử dụng kiểu paramater constructor (Không cần extends person)
  // Quan hệ kết tập
  // Person? person;
  // Student(this.person, this.id, this.className);

  showInfoStudent() {
    print(
        "id: $id - name: $name - age: $age - class: $className - home: $nameHome");
  }

  //ghi đè phương thức move của abstract class person khi move chưa được định nghĩa
  // @override
  // move() {
  //   // TODO: implement move
  //   throw UnimplementedError();
  // }

  @override
  printOffice() {
    // TODO: implement printOffice
    throw UnimplementedError();
  }
}
