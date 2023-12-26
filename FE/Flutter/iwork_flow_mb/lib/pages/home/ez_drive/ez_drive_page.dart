// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iwork_flow_mb/cubits/ez_drive/ez_drive_cubit.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/widgets/card_drive_widget.dart';
import 'package:iwork_flow_mb/stores/commons/constants/string.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/no_data.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';

class EzDrivePage extends StatelessWidget {
  final String title;
  const EzDrivePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EzDriveCubit, EzDriveState>(
      builder: (context, state) {
        if (state is EzDriveInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is EzDriveLoaded) {
          return state.listSpacesResponse.isNotEmpty
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      for (SpaceResponse spaceResponse
                          in state.listSpacesResponse)
                        CardSpaceWidget(
                          id: spaceResponse.id,
                          spaceResponse: spaceResponse,
                        ),
                    ],
                  ),
                )
              : const NoDataWidget(
                  imageAsset: emptyImage,
                  message: noData,
                );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
