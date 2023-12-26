import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_state.dart';
import 'package:restful_api_bloc/features/employee/repositories/employee_repository.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeeRepository employeeRepository;
  EmployeeCubit({required this.employeeRepository})
      : super(EmployeeLoadingState()) {
    getListData();
  }

  getListData() async {
    List<EmployeeModel> list = await employeeRepository.getListEmployee();
    emit(ListEmployeeLoadedState(list));
  }

  updateData(EmployeeModel spacesModel) async {
    var responeUpdate =
        await employeeRepository.updateEmployeeDetail(spacesModel);
    List<EmployeeModel> list = await employeeRepository.getListEmployee();
    if (responeUpdate != null) {
      emit(ListEmployeeLoadedState(list));
    }
  }
}
