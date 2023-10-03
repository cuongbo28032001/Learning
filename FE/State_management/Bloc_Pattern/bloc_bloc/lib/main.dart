import 'package:bloc_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_bloc/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_bloc/data/networks/network_service.dart';
import 'package:bloc_bloc/data/repository.dart';
import 'package:bloc_bloc/views/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository(API());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(repository: repository),
        ),
      ], child: const UserListScreen()),
    );
  }
}
