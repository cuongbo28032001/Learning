part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UserInitialEvent extends UserEvent {}

final class UserLoadedEvent extends UserEvent {}

final class UserErrorEvent extends UserEvent {}

final class UserDeleteEvent extends UserEvent {}

final class UserCreatedEvent extends UserEvent {}
