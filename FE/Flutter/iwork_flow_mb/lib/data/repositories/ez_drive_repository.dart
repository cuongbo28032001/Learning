import 'package:iwork_flow_mb/data/services/ez_drive_service.dart';
import 'package:iwork_flow_mb/stores/models/response/base_response/respone_page_model.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';

class EzDriveRepository {
  final EzDriveService _ezDriveService = EzDriveService();

  Future<List<SpaceResponse>> getListSpacesModelRepository() async {
    BaseResponsePaging responsePaging =
        await _ezDriveService.getListSpaceService();
    if (responsePaging.content != null) {
      List<SpaceResponse> listSpaceResponse = responsePaging.content!
          .map((item) => SpaceResponse.fromJson(item))
          .toList();
      return listSpaceResponse;
    }
    return [];
  }

  Future updateSpaceRepository(SpaceResponse spaceResponse) async {
    var response = await _ezDriveService.updateSpaceService(spaceResponse);
    return response;
  }
}
