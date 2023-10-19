import 'package:restful_api_bloc/models/employee/employee_model.dart';

abstract class EmployeeEvent {}

class LoadEmployeeEvent extends EmployeeEvent {
  final int id;
  LoadEmployeeEvent(this.id);
}

class UpdateEmployeeEvent extends EmployeeEvent {
  final EmployeeModel employeeModel;
  UpdateEmployeeEvent(this.employeeModel);
}

class DeleteEmployeeEvent extends EmployeeEvent {
  final int id;
  DeleteEmployeeEvent(this.id);
}

class CreateEmployeeEvent extends EmployeeEvent {
  final EmployeeModel employeeModel;
  CreateEmployeeEvent(this.employeeModel);
}

class LoadListEmployeeEvent extends EmployeeEvent {}
