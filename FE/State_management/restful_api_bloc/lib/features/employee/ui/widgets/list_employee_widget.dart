import 'package:flutter/material.dart';
import 'package:restful_api_bloc/features/employee/ui/employee_detail_screen.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

class EmployeeWidget extends StatelessWidget {
  const EmployeeWidget({Key? key, required this.modelList}) : super(key: key);

  final List<EmployeeModel> modelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (EmployeeModel modelItem in modelList)
          renderItem(modelItem, context)
      ],
    );
  }

  renderItem(modelItem, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(94, 98, 109, 0.2),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EmployeeDetailScreen(id: modelItem.id)));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name: ${modelItem.name ?? 'name null'}'),
                  Text('Name: ${modelItem.email ?? 'email null'}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
