import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_cubit.dart';
import 'package:restful_api_bloc/features/employee/bloc/employee_state.dart';
import 'package:restful_api_bloc/models/employee/employee_model.dart';

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
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListEmployeeLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (EmployeeModel modelItem in state.listEmployeeModel)
                  CardEmployeeWidget(
                    employeeModel: modelItem,
                  )
              ],
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class CardEmployeeWidget extends StatelessWidget {
  final EmployeeModel employeeModel;
  const CardEmployeeWidget({super.key, required this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return renderItem(employeeModel, context);
  }

  renderItem(EmployeeModel modelItem, BuildContext context) {
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
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                var offset = renderBox.localToGlobal(Offset.zero);
                showPopupMenu(context, offset, modelItem);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name: ${modelItem.name ?? 'name null'}'),
                  Text('Email: ${modelItem.email ?? 'email null'}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPopupMenu(
      BuildContext context, Offset offset, EmployeeModel modelItem) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx + 100,
        offset.dy + 165,
        offset.dx,
        offset.dy,
      ),
      color: Colors.red,
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Chi tiết'),
            onTap: () {
              Navigator.pop(context);
              showDetailsDialog(context, modelItem);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Cập nhật'),
            onTap: () {
              Navigator.pop(context);
              showUpdateDialog(context, modelItem);
            },
          ),
        ),
      ],
    );
  }

  void showUpdateDialog(BuildContext context, EmployeeModel modelItem) {
    TextEditingController nameSpace =
        TextEditingController(text: modelItem.name ?? "aaa");
    showDialog(
      context: context,
      builder: (BuildContext contextUpdate) {
        return AlertDialog(
          title: const Text('Cập nhật space'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 1.0,
              ),
              TextFormField(
                controller: nameSpace,
                decoration: const InputDecoration(
                  labelText: 'Tên space',
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                // controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả'),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(contextUpdate);
              },
              child: const Text('Đóng'),
            ),
            TextButton(
              onPressed: () {
                EmployeeModel updatedModelItem = EmployeeModel(
                  modelItem.id,
                  nameSpace.text,
                  modelItem.email,
                );
                context.read<EmployeeCubit>().updateData(updatedModelItem);
                Navigator.pop(contextUpdate);
              },
              child: const Text('Lưu lại'),
            ),
          ],
        );
      },
    );
  }

  void showDetailsDialog(BuildContext context, EmployeeModel employeeModel) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          title: Text(
            '1',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Thông tin chung",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                _renderLineInfo('Tên', '1'),
                _renderLineInfo('Mô tả', '1'),
                _renderLineInfo('Phạm vi', '1'),
                _renderLineInfo('Ngày tạo', '1'),
                _renderLineInfo('Người tạo', '1'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  _renderLineInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(color: Colors.red, fontSize: 13),
          )),
          Expanded(
              child: Text(
            value,
            style: const TextStyle(fontSize: 13),
          ))
        ],
      ),
    );
  }
}
