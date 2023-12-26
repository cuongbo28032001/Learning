import 'package:bloc/bloc.dart';
import 'package:iwork_flow_mb/data/repositories/ez_drive_repository.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';
import 'package:meta/meta.dart';

part 'ez_drive_state.dart';

class EzDriveCubit extends Cubit<EzDriveState> {
  final EzDriveRepository ezDriveRepository;
  EzDriveCubit({required this.ezDriveRepository}) : super(EzDriveInitial()) {
    getData();
  }

  getData() async {
    List<SpaceResponse> listSpacesResponse =
        await ezDriveRepository.getListSpacesModelRepository();
    emit(EzDriveLoaded(listSpacesResponse: listSpacesResponse));
  }

  getDetail(SpaceResponse spaceResponse) async {
    emit(EzDriveDetail(spaceResponse: spaceResponse));
  }

  updateData(SpaceResponse spaceResponse) async {
    getData();
  }
}
