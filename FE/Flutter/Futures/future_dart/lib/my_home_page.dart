import 'package:flutter/material.dart';
import 'package:future_dart/futures/future.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  dynamic text = 'default text';

  //future có thể trả ra nhiều kiểu dữ liệu bao gồm cả exception
  //lấy ra data của future
  //cách 1
  // onPressed() async {
  //   try {
  //     text = await asyncFunc(0);
  //     setState(() {});
  //   } catch (e) {
  //     setState(() {
  //       text = e.toString();
  //     });
  //   }
  // }

  // Cách 2: Sử dụng then
  onPressed() async {
    asyncFunc(0)
        .then((value) => setState(() {
              text = value;
            }))
        .catchError((onError) {
      setState(() {
        text = onError.toString();
      });
    });
  }

  //cách 3: Gọi FutureBuilder trong widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Future"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              // Lấy qua FutureBuilder
              // child: FutureBuilder(
              //   future: asyncFunc(2),
              //   builder: (context, snapshot) {
              //     Widget? text;
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       text = const CircularProgressIndicator();
              //     }
              //     if (snapshot.hasData) {
              //       text = Text(snapshot.data.toString());
              //     }
              //     if (snapshot.hasError) {
              //       text = Text(snapshot.error.toString());
              //     }
              //     return text!;
              //   },
              // ),

              //Lấy qua việc setState
              child: Text(
            text,
            style: const TextStyle(fontSize: 30),
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: onPressed, child: const Text('Click here')),
            ),
          )
        ],
      ),
    );
  }
}
