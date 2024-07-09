import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/session_entry_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'teacher_my_sessions_page_widget.dart' show TeacherMySessionsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TeacherMySessionsPageModel
    extends FlutterFlowModel<TeacherMySessionsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in teacherMySessionsPage widget.
  TeacherProfileRecord? existingTeacherProfile;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for sessionEntry dynamic component.
  late FlutterFlowDynamicModels<SessionEntryModel> sessionEntryModels;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    sessionEntryModels = FlutterFlowDynamicModels(() => SessionEntryModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    tabBarController?.dispose();
    sessionEntryModels.dispose();
    teacherSidebarModel.dispose();
  }
}
