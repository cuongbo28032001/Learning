part of 'work_flow_list_cubit.dart';

@immutable
sealed class WorkFlowListState {}

final class WorkFlowListInitial extends WorkFlowListState {}

final class WorkFlowListLoading extends WorkFlowListState {}

final class WorkFlowListLoaded extends WorkFlowListState {
  final List<WorkFlowDefinitionResponse> listWorkFlowDefinitionResponse;
  WorkFlowListLoaded({required this.listWorkFlowDefinitionResponse});
}
