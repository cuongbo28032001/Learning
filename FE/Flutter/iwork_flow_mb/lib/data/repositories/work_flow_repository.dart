import 'package:iwork_flow_mb/data/services/work_flow_service.dart';
import 'package:iwork_flow_mb/stores/models/response/base_response/respone_page_model.dart';
import 'package:iwork_flow_mb/stores/models/response/work_flow_definition_response/work_flow_definition_response.dart';

class WorkFlowRepository {
  final WorkFlowService _workFlowService = WorkFlowService();
  Future<List<WorkFlowDefinitionResponse>> getListWorkFlowDefinition() async {
    BaseResponsePaging responsePaging =
        await _workFlowService.getListWorkFlowDefinition();
    if (responsePaging.content != null) {
      List<WorkFlowDefinitionResponse> listWorkFlowDefinitionResponse =
          responsePaging.content!
              .map((item) => WorkFlowDefinitionResponse.fromJson(item))
              .toList();
      return listWorkFlowDefinitionResponse;
    }
    return [];
  }
}
