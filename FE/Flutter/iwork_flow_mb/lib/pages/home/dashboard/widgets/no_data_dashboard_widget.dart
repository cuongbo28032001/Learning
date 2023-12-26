import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/stores/commons/constants/styles.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';

class NoDataDasboardWidget extends StatelessWidget {
  const NoDataDasboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            girlTickedImage,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: 150,
              child: Text(
                "Không có công việc nào đến hạn trong hôm nay.",
                style: StyleText().styleTextDecreption,
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}
