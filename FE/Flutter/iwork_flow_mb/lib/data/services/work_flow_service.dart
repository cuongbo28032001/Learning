import 'package:iwork_flow_mb/data/networks/api.dart';
import 'package:iwork_flow_mb/stores/models/response/base_response/respone_page_model.dart';

class WorkFlowService {
  Future getListWorkFlowDefinition() async {
    var response = await Api.httpGet('workflow-definitions', {});
    return BaseResponsePaging.fromJson(response);
  }
}
