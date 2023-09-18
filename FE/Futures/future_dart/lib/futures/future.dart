// ignore_for_file: void_checks

// Ví dụ về việc trả ra cả exception
// check = 1 return data, check = 2 return exception

//Cách 1: return data trực tiếp
import 'dart:async';

Future<dynamic> asyncFunc(int check) {
  if (check == 1) {
    return Future.delayed(const Duration(seconds: 2), () {
      return "this is Future";
    });
  } else {
    return Future.delayed(
        const Duration(seconds: 2), () => throw Exception('Error exception'));
  }
}

//Cách 2: return data thông qua Completer
Future<String> asyncFuncCompleter(int check) {
  var value = Completer<String>();

  if (check == 1) {
    Future.delayed(const Duration(seconds: 2),
        (() => value.complete('this is Future with completer')));
  } else {
    return Future.delayed(const Duration(seconds: 2),
        throw Exception(() => value.complete('this is Future with completer')));
  }
  return value.future;
}
