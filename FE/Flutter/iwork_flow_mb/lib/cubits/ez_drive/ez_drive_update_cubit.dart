import 'package:bloc/bloc.dart';
import 'package:iwork_flow_mb/data/repositories/ez_drive_repository.dart';
import 'package:iwork_flow_mb/stores/commons/enums/space_scope.dart';
import 'package:iwork_flow_mb/stores/models/response/space_response/space_response.dart';
import 'package:meta/meta.dart';

part 'ez_drive_update_state.dart';

class EzDriveUpdateCubit extends Cubit<EzDriveUpdateState> {
  final EzDriveRepository repository = EzDriveRepository();

  final EnumSpaceScope scope;
  EzDriveUpdateCubit({required this.scope})
      : super(EzDriveUpdateInitial(scope: scope));

  void changeScope(EnumSpaceScope scope) {
    emit(EzDriveChangeScope(scope: scope));
  }

  void updatedSpace(SpaceResponse spaceResponse) async {
    await repository.updateSpaceRepository(spaceResponse).then((value) {
      if (value) {
        emit(EzDriveUpdated());
      }
    });
    close();
  }
}
