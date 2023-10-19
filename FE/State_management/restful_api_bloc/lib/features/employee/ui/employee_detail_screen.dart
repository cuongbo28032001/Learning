import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_event.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_state.dart';
import 'package:restful_api_bloc/features/employee/repositories/employee_repository.dart';
import 'package:restful_api_bloc/features/employee/ui/widgets/employee_detail_widget.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final int id;
  const EmployeeDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeeModel? editemployeeModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Employee Detail'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocProvider<EmployeeBloc>(
            create: (context) =>
                EmployeeBloc(RepositoryProvider.of<EmployeeRepository>(context))
                  ..add(LoadEmployeeEvent(id)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocConsumer<EmployeeBloc, EmployeeState>(
                    listener: (context, state) {
                      if (state is EmployeeUpdatedState) {
                        // Navigator.pop(context);
                        // context.read<EmployeeBloc>().add(LoadListEmployeeEvent());
                        print('vào tới đây');
                      }
                    },
                    listenWhen: (previous, current) => (previous != current),
                    builder: (context, state) {
                      if (state is EmployeeErrorState) {
                        return Text(
                          state.message,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.red),
                        );
                      } else if (state is EmployeeLoadedState) {
                        return EmployeeDetailWidget(
                          employeeModel: state.employeeModel,
                          onEmployeeModelChanged: (updateEmployeeModel) {
                            editemployeeModel = updateEmployeeModel;
                          },
                        );
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () async {
              if (editemployeeModel != null) {
                context
                    .read<EmployeeBloc>()
                    .add(UpdateEmployeeEvent(editemployeeModel!));
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
