import 'package:flutter/material.dart';
import 'package:iwork_flow_mb/pages/calender/calender_page.dart';
import 'package:iwork_flow_mb/pages/home/apps/app_page.dart';
import 'package:iwork_flow_mb/pages/home/dashboard/dashboard_page.dart';
import 'package:iwork_flow_mb/pages/home/database/database_page.dart';
import 'package:iwork_flow_mb/pages/home/ez_drive/ez_drive_page.dart';
import 'package:iwork_flow_mb/pages/home/files/file_page.dart';
import 'package:iwork_flow_mb/pages/home/forms/form_page.dart';
import 'package:iwork_flow_mb/pages/home/home_page.dart';
import 'package:iwork_flow_mb/pages/home/single-tasks/single_task_page.dart';
import 'package:iwork_flow_mb/pages/home/single_task_config/single_task_config_page.dart';
import 'package:iwork_flow_mb/pages/home/tasks/task_page.dart';
import 'package:iwork_flow_mb/pages/home/users/user_page.dart';
import 'package:iwork_flow_mb/pages/home/workflow_setup/workflow_setup_page.dart';
import 'package:iwork_flow_mb/pages/home/workflows/workflows_page.dart';
import 'package:iwork_flow_mb/pages/message/message_page.dart';
import 'package:iwork_flow_mb/pages/notification/notification_page.dart';
import 'package:iwork_flow_mb/pages/profile/profile_page.dart';
import 'package:iwork_flow_mb/stores/commons/constants/router_name.dart';
import 'package:iwork_flow_mb/pages/login/login_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteName.loginPageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginPage(),
      );
    case RouteName.homePageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage(),
      );
    case RouteName.calenderPageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CalenderPage(),
      );
    case RouteName.messagePageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MessagePage(),
      );
    case RouteName.notificationPageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NotificationPage(),
      );
    case RouteName.profilePageName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfilePage(),
      );
    case RouteName.dashboardPageName:
      final args = routeSettings.arguments as DashBoardPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DashBoardPage(title: args.title),
      );
    case RouteName.tasksPageName:
      final args = routeSettings.arguments as TaskPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => TaskPage(title: args.title),
      );
    case RouteName.singleTasksPageName:
      final args = routeSettings.arguments as SingleTaskPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SingleTaskPage(title: args.title),
      );
    case RouteName.ezDrivePageName:
      final args = routeSettings.arguments as EzDrivePage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EzDrivePage(title: args.title),
      );
    case RouteName.workFlowPageName:
      final args = routeSettings.arguments as WorkflowsPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WorkflowsPage(title: args.title),
      );

    case RouteName.formPageName:
      final args = routeSettings.arguments as FormPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FormPage(title: args.title),
      );
    case RouteName.filePageName:
      final args = routeSettings.arguments as FilePage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FilePage(title: args.title),
      );

    case RouteName.userPageName:
      final args = routeSettings.arguments as UserPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => UserPage(title: args.title),
      );
    case RouteName.singleTaskConfigPageName:
      final args = routeSettings.arguments as SingleTaskConfigPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SingleTaskConfigPage(title: args.title),
      );
    case RouteName.databasePageName:
      final args = routeSettings.arguments as DatabasePage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DatabasePage(title: args.title),
      );
    case RouteName.appPageName:
      final args = routeSettings.arguments as AppPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AppPage(title: args.title),
      );
    case RouteName.workFlowSetupPageName:
      final args = routeSettings.arguments as WorkFlowSetupPage;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WorkFlowSetupPage(title: args.title),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
