import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_bloc.dart';
import 'package:restful_api_bloc/features/employee/repositories/employee_repository.dart';
import 'package:restful_api_bloc/features/employee/ui/list_employee_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<EmployeeRepository>(
            create: (context) => EmployeeRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<EmployeeBloc>(
            create: (context) => EmployeeBloc(
                RepositoryProvider.of<EmployeeRepository>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const EmployeeScreen(),
        ),
      ),
    );
  }
}
