import 'package:flutter/material.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

class EmployeeDetailWidget extends StatefulWidget {
  final EmployeeModel employeeModel;
  final Function(EmployeeModel) onEmployeeModelChanged;
  const EmployeeDetailWidget(
      {Key? key,
      required this.employeeModel,
      required this.onEmployeeModelChanged})
      : super(key: key);

  @override
  State<EmployeeDetailWidget> createState() => _EmployeeDetailWidgetState();
}

class _EmployeeDetailWidgetState extends State<EmployeeDetailWidget> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerName.text = widget.employeeModel.name;
    controllerEmail.text = widget.employeeModel.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: controllerName,
          onChanged: (_) => _updateEmployeeModel(),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: controllerEmail,
          onChanged: (_) => _updateEmployeeModel(),
        )
      ],
    );
  }

  void _updateEmployeeModel() {
    final updatedEmployeeModel = EmployeeModel(
      widget.employeeModel.id,
      controllerName.text,
      controllerEmail.text,
    );
    widget.onEmployeeModelChanged(updatedEmployeeModel);
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerEmail.dispose();
  }
}
