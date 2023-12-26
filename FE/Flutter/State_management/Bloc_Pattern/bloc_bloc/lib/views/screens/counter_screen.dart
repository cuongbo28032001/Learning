import 'package:bloc_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_bloc/views/screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter BloC'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 6,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Counter: ${state.counter}');
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 6,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncreaseEvent());
                    },
                    child: const Text('Increase')),
                const Spacer(
                  flex: 1,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecreaseEvent());
                    },
                    child: const Text('Decrease')),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
            const Spacer(
              flex: 6,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserListScreen()));
                },
                child: const Text('User list'))
          ],
        ),
      ),
    );
  }
}
