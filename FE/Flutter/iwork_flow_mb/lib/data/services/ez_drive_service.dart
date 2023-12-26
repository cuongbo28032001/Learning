import 'dart:convert';
import 'package:iwork_flow_mb/data/networks/api.dart';
import 'package:iwork_flow_mb/stores/models/response/base_response/respone_page_model.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';

class EzDriveService {
  Future getListSpaceService() async {
    var response = await Api.httpGet('spaces', {});
    return BaseResponsePaging.fromJson(response);
  }

  Future updateSpaceService(SpaceResponse spaceResponse) async {
    var response = await Api.httpPut(
        'spaces/${spaceResponse.id}', json.encode(spaceResponse));
    return response;
  }
}
