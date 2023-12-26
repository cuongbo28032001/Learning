import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/styles.dart';

class NoDataWidget extends StatelessWidget {
  final String imageAsset;
  final String message;
  const NoDataWidget(
      {super.key, required this.imageAsset, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  message,
                  style: StyleText().styleTextDecreption,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
