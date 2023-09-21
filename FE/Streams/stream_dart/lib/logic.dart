// ignore_for_file: avoid_print

import 'dart:async';

class Logic {
  StreamController streamController = StreamController();
  Sink get sink => streamController.sink;
  Stream get stream => streamController.stream;

  Logic(this.streamController);

  addValue(String value) {
    sink.add(value);
  }

  printValue() {
    stream.listen((event) {
      print(event.toString());
    });
  }
}

// Lấy Stream từ class khác
class Logic2 {
  Logic logic;
  Logic2(this.logic);

  addValue2(String value) {
    logic.sink.add(value);
  }

  printValue2() {
    logic.stream.listen((event) {
      print(event.toString());
    });
  }
}

main() {
  StreamController streamController = StreamController();
  Logic logic = Logic(streamController);

  //Nạp dữ liệu
  logic.addValue('value');

  //Lấy dữ liệu
  // logic.printValue();

  //Nạp 1 stream khác
  // StreamController streamController2 = StreamController();
  // streamController2.addStream(logic.stream);
  // streamController2.stream.listen((event) {
  //   print(event.toString());
  // });

  Logic2 logic2 = Logic2(logic);
  // logic2.printValue2();
  logic2.addValue2('value2');
  logic2.printValue2();

  //Note: chỉ được lắng nghe 1 lần
  streamController.close();
}
