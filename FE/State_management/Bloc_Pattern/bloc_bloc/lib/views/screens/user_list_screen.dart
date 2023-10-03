import 'package:bloc_bloc/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(UserLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("User Bloc"),
          centerTitle: true,
          backgroundColor: Colors.blue[100],
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserLoadedState) {
                    final user = state.userList;
                    return SingleChildScrollView(
                      child: Column(
                        children: user.map((e) => Text('${e.name}')).toList(),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 8.0,
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<UserBloc>().add(UserDeleteEvent());
                  },
                  child: const Text("DELETE")),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<UserBloc>().add(UserCreatedEvent());
                  },
                  child: const Text("CREATED"))
            ],
          ),
        ));
  }
}
