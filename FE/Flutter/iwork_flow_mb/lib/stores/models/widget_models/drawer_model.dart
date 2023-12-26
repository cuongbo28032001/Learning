import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iwork_flow_mb/cubits/ez_drive/ez_drive_cubit.dart';
import 'package:iwork_flow_mb/cubits/work_flow/work_flow_list_cubit.dart';
import 'package:iwork_flow_mb/data/repositories/ez_drive_repository.dart';
import 'package:iwork_flow_mb/data/repositories/work_flow_repository.dart';
import 'package:iwork_flow_mb/pages/home/apps/app_page.dart';
import 'package:iwork_flow_mb/pages/home/dashboard/dashboard_page.dart';
import 'package:iwork_flow_mb/pages/home/database/database_page.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/ez_drive_page.dart';
import 'package:iwork_flow_mb/pages/home/files/file_page.dart';
import 'package:iwork_flow_mb/pages/home/forms/form_page.dart';
import 'package:iwork_flow_mb/pages/home/single-tasks/single_task_page.dart';
import 'package:iwork_flow_mb/pages/home/single_task_config/single_task_config_page.dart';
import 'package:iwork_flow_mb/pages/home/tasks/task_page.dart';
import 'package:iwork_flow_mb/pages/home/users/user_page.dart';
import 'package:iwork_flow_mb/pages/home/workflow_setup/workflow_setup_page.dart';
import 'package:iwork_flow_mb/pages/home/workflows/workflows_page.dart';
import 'package:iwork_flow_mb/stores/commons/constants/router_name.dart';
import 'package:iwork_flow_mb/stores/commons/constants/url_icon_local.dart';

class DrawerItemWidget {
  final String title;
  final String iconPath;
  final String routePath;
  final Object object;

  const DrawerItemWidget(
      {required this.title,
      required this.iconPath,
      required this.routePath,
      required this.object});
}

List<DrawerItemWidget> listDrawerItemWidget = [
  const DrawerItemWidget(
    title: 'Dashboard',
    iconPath: pulsedIconSVG,
    routePath: RouteName.dashboardPageName,
    object: DashBoardPage(title: 'Dashboard'),
  ),
  const DrawerItemWidget(
    title: 'Công việc',
    iconPath: taskIconSVG,
    routePath: RouteName.tasksPageName,
    object: TaskPage(title: 'Công việc'),
  ),
  const DrawerItemWidget(
    title: 'Nhiệm vụ',
    iconPath: shoppingBagIconSVG,
    routePath: RouteName.singleTasksPageName,
    object: SingleTaskPage(title: 'Nhiệm vụ'),
  ),
  DrawerItemWidget(
      title: 'EzDrive',
      iconPath: cubeIconSVG,
      routePath: RouteName.ezDrivePageName,
      object: MultiBlocProvider(
        providers: [
          BlocProvider<EzDriveCubit>(
            create: (BuildContext context) => EzDriveCubit(
              ezDriveRepository: EzDriveRepository(),
            ),
          ),
          // BlocProvider<EzDriveUpdateCubit>(
          //   create: (_) => EzDriveUpdateCubit(scope: ''),
          // ),
        ],
        child: const EzDrivePage(title: 'EzDrive'),
      )),
  DrawerItemWidget(
    title: 'Quy trình',
    iconPath: vectorIconsSVG,
    routePath: RouteName.workFlowPageName,
    object: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => WorkFlowListCubit(
            repository: WorkFlowRepository(),
          ),
        )
      ],
      child: const WorkflowsPage(title: 'Quy trình'),
    ),
  ),
  const DrawerItemWidget(
    title: 'Biểu mẫu',
    iconPath: toolMarqueeIconSVG,
    routePath: RouteName.formPageName,
    object: FormPage(title: 'Biểu mẫu'),
  ),
  const DrawerItemWidget(
    title: 'Files',
    iconPath: cloudUploadIconSVG,
    routePath: RouteName.filePageName,
    object: FilePage(title: 'Files'),
  ),
  const DrawerItemWidget(
    title: 'Người dùng',
    iconPath: followingIconSVG,
    routePath: RouteName.userPageName,
    object: UserPage(title: 'User'),
  ),
  const DrawerItemWidget(
    title: 'Quản lý mẫu nhiệm vụ',
    iconPath: shoppingBagAddIconSVG,
    routePath: '/single-task-config',
    object: SingleTaskConfigPage(title: 'Quản lý mẫu nhiệm vụ'),
  ),
  const DrawerItemWidget(
    title: 'Database',
    iconPath: databaseIconSVG,
    routePath: RouteName.databasePageName,
    object: DatabasePage(title: 'Database'),
  ),
  const DrawerItemWidget(
    title: 'App',
    iconPath: appIconSVG,
    routePath: RouteName.appPageName,
    object: AppPage(title: 'App'),
  ),
  const DrawerItemWidget(
    title: 'Workflow Steps',
    iconPath: starIconSVG,
    routePath: RouteName.workFlowSetupPageName,
    object: WorkFlowSetupPage(title: 'Workflow Steps'),
  )
];
