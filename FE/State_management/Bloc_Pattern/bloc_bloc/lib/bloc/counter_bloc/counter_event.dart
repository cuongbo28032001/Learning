part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class IncreaseEvent extends CounterEvent {}

final class DecreaseEvent extends CounterEvent {}
