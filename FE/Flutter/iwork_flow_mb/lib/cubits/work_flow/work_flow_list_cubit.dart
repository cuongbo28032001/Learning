import 'package:bloc/bloc.dart';
import 'package:iwork_flow_mb/data/repositories/work_flow_repository.dart';
import 'package:iwork_flow_mb/stores/models/response/work_flow_definition_response/work_flow_definition_response.dart';
import 'package:meta/meta.dart';

part 'work_flow_list_state.dart';

class WorkFlowListCubit extends Cubit<WorkFlowListState> {
  final WorkFlowRepository repository;
  WorkFlowListCubit({required this.repository}) : super(WorkFlowListInitial()) {
    getData();
  }

  void getData() async {
    List<WorkFlowDefinitionResponse> listWorkFlowDefinitionResponse =
        await repository.getListWorkFlowDefinition();
    emit(WorkFlowListLoaded(
        listWorkFlowDefinitionResponse: listWorkFlowDefinitionResponse));
  }
}
