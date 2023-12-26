part of 'ez_drive_cubit.dart';

@immutable
sealed class EzDriveState {}

final class EzDriveLoaded extends EzDriveState {
  final List<SpaceResponse> listSpacesResponse;
  EzDriveLoaded({required this.listSpacesResponse});
}

final class EzDriveDetail extends EzDriveState {
  final SpaceResponse spaceResponse;
  EzDriveDetail({required this.spaceResponse});
}

final class EzDriveUpdate extends EzDriveState {
  final SpaceResponse spacesModel;
  EzDriveUpdate({required this.spacesModel});
}

final class EzDriveInitial extends EzDriveState {}
