import 'package:restful_api_bloc/models/employee/employee_model.dart';

abstract class EmployeeState {}

class EmployeeLoadingState extends EmployeeState {
  final int? id;
  EmployeeLoadingState({this.id});
}

class EmployeeErrorState extends EmployeeState {
  final String message;
  EmployeeErrorState(this.message);
}

class EmployeeLoadedState extends EmployeeState {
  final EmployeeModel employeeModel;
  EmployeeLoadedState(this.employeeModel);
}

class ListEmployeeLoadedState extends EmployeeState {
  final List<EmployeeModel> listEmployeeModel;
  ListEmployeeLoadedState(this.listEmployeeModel);
}
