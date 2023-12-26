import 'package:flutter/material.dart';
import 'package:stream_dart/count_stream_controller.dart';
import 'package:stream_dart/validate_value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo StreamController'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _incrementCounter() {
    countController.increase();
  }

  _decrementCounter() {
    countController.decrease();
  }

  CountController countController = CountController();
  ValidateController validateController = ValidateController();

  @override
  void dispose() {
    super.dispose();
    countController.controller.close();
    validateController.validateConteroller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: countController.stream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
                onPressed: _incrementCounter, child: const Text('UP')),
            ElevatedButton(
                onPressed: _decrementCounter, child: const Text('DOWN')),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Divider(
                thickness: 2.0,
              ),
            ),
            TextFormField(
              onChanged: (value) => validateController
                  .addValidate(validateController.validateValue(value)),
            ),
            StreamBuilder(
              stream: validateController.stream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
