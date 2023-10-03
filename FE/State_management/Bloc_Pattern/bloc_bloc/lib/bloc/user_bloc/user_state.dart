part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoadedState extends UserState {
  final List userList;
  UserLoadedState(this.userList);
}

final class UserErorState extends UserState {
  final String message;
  UserErorState(this.message);
}
