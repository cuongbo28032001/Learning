// ignore_for_file: must_be_immutable

import 'package:bloc_base/utils/enum_validate.dart';
import 'package:bloc_base/utils/validate_value.dart';
import 'package:flutter/material.dart';

class FormInputWidget extends StatefulWidget {
  final EnumValidate enumValidate;
  final TextEditingController controller;
  final String? hinText;
  late bool? obscureText;
  FormInputWidget(
      {super.key,
      required this.controller,
      required this.enumValidate,
      this.hinText,
      this.obscureText});

  @override
  State<FormInputWidget> createState() => _FormInputWidgetState();
}

class _FormInputWidgetState extends State<FormInputWidget> {
  late TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: (value) => ValidateValue(widget.enumValidate).validate(value),
      decoration: InputDecoration(
          hintText: widget.hinText,
          suffixIcon: (widget.obscureText != null)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText!;
                    });
                  },
                  child: Icon(
                    !widget.obscureText!
                        ? Icons.visibility_off
                        : Icons.visibility_outlined,
                    size: 20,
                    color: Colors.black38,
                  ),
                )
              : null),
      obscureText: widget.obscureText ?? false,
    );
  }
}
