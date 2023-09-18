// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_this

class Person {
  // Khai báo thuộc tính public
  String? name;

  // Khai báo thuộc tính private (Do dart không có các khái niệm cụ thể về Access Modifier về các từ khóa như: public, private, protected)
  int? _age;

  int? age;

  // getter, setter
  set setAge(age) => this._age = age;
  int? get getAge => this._age;

  //Constructor
  // constructor default
  // Person() {
  //   print("this is default constructor");
  // }

  // paramater constructor
  Person(this.name, this.age);

  //bool session option constructor
  // Person(this.name, [this.age]);

  //named option construction
  // Person({this.name, this.age});

  //named constructor
  Person.VietNam() {
    name = "Cường";
    age = 23;
  }

  Person.England() {
    name = "John";
    age = 13;
  }

  //factory constructor
  factory Person.option(int check) {
    if (check == 1) {
      return Person.VietNam();
    } else {
      return Person.England();
    }
  }

  // Function
  // static
  static talk() {
    print("talk");
  }

  read() {
    print("read age = $age");
  }

  // khi class là 1 lớp trừu tượng asbtract có thể tạo ra 1 funtion chưa được định nghĩa
  // Các class kế thừa cần ghi đè (overide) lại phương thức này
  // move();
}
