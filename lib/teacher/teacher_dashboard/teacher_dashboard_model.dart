import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'teacher_dashboard_widget.dart' show TeacherDashboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherDashboardModel extends FlutterFlowModel<TeacherDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in teacherDashboard widget.
  TeacherProfileRecord? existingTeacherProfile;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    tabBarController?.dispose();
    teacherSidebarModel.dispose();
  }
}
