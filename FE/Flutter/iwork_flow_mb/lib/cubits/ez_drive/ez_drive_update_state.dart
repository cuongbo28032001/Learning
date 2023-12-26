part of 'ez_drive_update_cubit.dart';

@immutable
sealed class EzDriveUpdateState {}

final class EzDriveUpdateInitial extends EzDriveUpdateState {
  final EnumSpaceScope scope;
  EzDriveUpdateInitial({required this.scope});
}

final class EzDriveChangeScope extends EzDriveUpdateState {
  final EnumSpaceScope scope;

  EzDriveChangeScope({required this.scope});
}

final class EzDriveScopeChanged extends EzDriveUpdateState {}

final class EzDriveUpdated extends EzDriveUpdateState {}
