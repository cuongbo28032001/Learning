// ignore_for_file: constant_identifier_names

enum EnumValidate {
  NOTNULL(1),
  USERNAME(2),
  PASSWORD(3),
  EMAIL(4),
  PHONE(5);

  const EnumValidate(this.value);
  final int value;
}
