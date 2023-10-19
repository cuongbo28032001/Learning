import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_event.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_state.dart';
import 'package:restful_api_bloc/features/employee/repositories/employee_repository.dart';
import 'package:restful_api_bloc/features/employee/ui/widgets/list_employee_widget.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Employee'),
        centerTitle: true,
      ),
      body: BlocProvider<EmployeeBloc>(
        create: (context) =>
            EmployeeBloc(RepositoryProvider.of<EmployeeRepository>(context))
              ..add(LoadListEmployeeEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<EmployeeBloc, EmployeeState>(
                builder: (context, state) {
              if (state is EmployeeErrorState) {
                return Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                );
              } else if (state is ListEmployeeLoadedState) {
                return EmployeeWidget(modelList: state.listEmployeeModel);
              }
              return const CircularProgressIndicator();
            }),
          ),
        ),
      ),
    );
  }
}
