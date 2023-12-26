import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/colors.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/spacer.dart';

class TextInputBorderAroundWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? isNull;
  final int? maxLines;
  final int? minLines;
  const TextInputBorderAroundWidget(
      {super.key,
      required this.label,
      this.maxLines,
      this.minLines,
      required this.controller,
      this.isNull})
      : assert(minLines == null || maxLines == null || minLines <= maxLines);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 15, color: MyColors.secondaryTextColor),
            ),
            if (isNull != null && !isNull!)
              Text(
                "*",
                style: TextStyle(color: Colors.red.shade400),
              )
          ],
        ),
        const SpacerWidget(height: 8.0),
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Trường này là bắt buộc';
            }
            return null;
          },
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            border: OutlineInputBorder(),
          ),
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
        ),
      ],
    );
  }
}
