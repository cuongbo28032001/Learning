import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_event.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_state.dart';
import 'package:restful_api_bloc/features/employee/repositories/employee_repository.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _repository;

  EmployeeBloc(this._repository) : super(EmployeeLoadingState()) {
    on<EmployeeEvent>((event, emit) async {
      if (event is LoadEmployeeEvent) {
        //logic trả về detail
        return _loadEmployeeEvent(emit, event.id);
      }
      if (event is LoadListEmployeeEvent) {
        // logic trả về list
        return _loadListEmployeeEvent(emit);
      }
      if (event is UpdateEmployeeEvent) {
        //logic update employee
        return _updateEmployeeEvent(emit, event.employeeModel);
      }
      if (event is DeleteEmployeeEvent) {
        //logic delete employee
        return _deleteEmployeeEvent(emit, event.id);
      }
      if (event is CreateEmployeeEvent) {
        //logic create employee
        return _createEmployeeEvent(emit, event.employeeModel);
      }
    });
  }

  //logic trả về detail
  Future _loadEmployeeEvent(Emitter emitter, int id) async {
    emitter(EmployeeLoadingState());
    try {
      EmployeeModel model = await _repository.getEmployeeDetail(id);
      emitter(EmployeeLoadedState(model));
    } catch (e) {
      emitter(EmployeeErrorState(e.toString()));
    }
  }

  // logic trả về list
  Future _loadListEmployeeEvent(Emitter emitter) async {
    emitter(EmployeeLoadingState());
    try {
      List<EmployeeModel> model = await _repository.getListEmployee();
      emitter(ListEmployeeLoadedState(model));
    } catch (e) {
      emitter(EmployeeErrorState(e.toString()));
    }
  }

  // logic update employee
  Future _updateEmployeeEvent(
      Emitter emitter, EmployeeModel employeeModel) async {
    // emitter(EmployeeLoadingState());
    try {
      EmployeeModel model =
          await _repository.updateEmployeeDetail(employeeModel);
      emitter(EmployeeUpdatedState(model));
    } catch (e) {
      emitter(EmployeeErrorState(e.toString()));
    }
  }

  // logic delete employee
  Future _deleteEmployeeEvent(Emitter emitter, int id) async {}

  // logic create employee
  Future _createEmployeeEvent(
      Emitter emitter, EmployeeModel employeeModel) async {}
}
