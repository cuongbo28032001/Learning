import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iwork_flow_mb/cubits/work_flow/work_flow_list_cubit.dart';
import 'package:iwork_flow_mb/pages/home/workflows/widgets/card_workflow_widget.dart';
import 'package:iwork_flow_mb/stores/commons/constants/string.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_image_local.dart';
import 'package:iwork_flow_mb/stores/commons/widgets/no_data.dart';
import 'package:iwork_flow_mb/stores/models/response/work_flow_definition_response/work_flow_definition_response.dart';
// import 'package:iwork_flow_mb/pages/home/workflows/widgets/card_workflow_widget.dart';

class WorkflowsPage extends StatelessWidget {
  const WorkflowsPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WorkFlowListCubit, WorkFlowListState>(
        builder: ((context, state) {
          if (state is WorkFlowListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WorkFlowListLoaded) {
            return state.listWorkFlowDefinitionResponse.isNotEmpty
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        for (WorkFlowDefinitionResponse item
                            in state.listWorkFlowDefinitionResponse)
                          CardWorkFlowWidget(workFlowDefinitionResponse: item)
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
        }),
      ),
    );
  }
}
