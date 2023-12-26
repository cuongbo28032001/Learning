import 'dart:async';

class ValidateController {
  StreamController<String> validateConteroller = StreamController<String>();
  Sink get sink => validateConteroller.sink;
  Stream get stream => validateConteroller.stream;

  validateValue(String value) {
    if (value.isEmpty || value == '') {
      return 'This variable is not empty!';
    }
    return null;
  }

  addValidate(validate) {
    if (validate != null) {
      sink.add(validate);
    }
  }
}
