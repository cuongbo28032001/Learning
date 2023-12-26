//async sử dụng cho Future
//async* sử dụng cho Stream

// ignore_for_file: avoid_print

Stream<int> countStream(int value) async* {
  for (int i = 0; i <= value; i++) {
    yield i; // trả về nhiều dữ liệu
  }
}

Future<int> sumCount(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}

main() async {
  //Periodic: dữ liệu theo 1 khoảng thời gian nhất định
  //asBroadcastStream: cho phép lắng nghe nhiều lần

  Stream<int> streamPeriodic =
      Stream.periodic(const Duration(seconds: 2), (value) {
    return value;
  }).asBroadcastStream();
  print('\nPeriodic');

  //asBroadcastStream
  // streamPeriodic.listen((event) {
  //   print(event.toString());
  // });
  // streamPeriodic.listen((event) {
  //   print(event.toString());
  // });

  await for (int value in streamPeriodic) {
    print(value.toString());
    if (value == 5) break;
  }
  //in ra danh sách từ 0 đến value
  var dataIterible = Iterable.generate(4, (value) {
    return value;
  });

  Stream<int> streamIterible = Stream.fromIterable(dataIterible);

  await for (int value in streamIterible) {
    print(value.toString());
  }

  // sử dụng Future tạo dữ liệu đầu vào cho Stream
  var dataFurure = Future.delayed(const Duration(seconds: 2), () {
    return 4;
  });

  Stream<int> stream = Stream.fromFuture(dataFurure);
  stream.listen((value) {
    print('\nSử dụng Future tạo dữ liệu đầu vào cho Stream ');
    print(value.toString());
  });

  // Sử dụng Future xử lý dữ liệu từ Stream
  print('\nSử dụng Future xử lý dữ liệu từ Stream');
  print(await sumCount(countStream(4)));

  // Lấy ra dữ liệu bằng await for (cần async main)
  // Chờ thực hiện xong await mới cho phép các hành động phía sau thực hiện
  print('\nIn ra dữ liệu từ Stream qua await for');
  await for (int value in countStream(4)) {
    print(value.toString());
  }

  // Lấy ra dữ liệu bằng listen
  // Cho phép thực hiện luôn các hành động phía sau
  print('\nIn ra dữ liệu từ Stream qua listen');
  countStream(4).listen((event) {
    print(event.toString());
  });
}
