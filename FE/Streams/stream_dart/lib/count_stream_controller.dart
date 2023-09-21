import 'dart:async';

class CountController {
  StreamController controller = StreamController();
  Sink get sink => controller.sink;
  Stream get stream => controller.stream;
  int count = 0;

  increase() {
    sink.add(++count);
  }

  decrease() {
    sink.add(--count);
  }
}
