import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_groupwbubbles/chat_details_overlay/chat_details_overlay_widget.dart';
import '/chat_groupwbubbles/chat_thread_component/chat_thread_component_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/common/video_call_widget/video_call_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/teacher_session_action_list/teacher_session_action_list_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'teacher_in_session_widget.dart' show TeacherInSessionWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherInSessionModel extends FlutterFlowModel<TeacherInSessionWidget> {
  ///  Local state fields for this page.

  SchedulesRecord? schedule;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in teacherInSession widget.
  SessionsRecord? currentSession;
  // Stores action output result for [Backend Call - Read Document] action in teacherInSession widget.
  SchedulesRecord? currentSchedule;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for videoCallWidget component.
  late VideoCallWidgetModel videoCallWidgetModel;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;
  // Model for chat_ThreadComponent component.
  late ChatThreadComponentModel chatThreadComponentModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    videoCallWidgetModel = createModel(context, () => VideoCallWidgetModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
    chatThreadComponentModel =
        createModel(context, () => ChatThreadComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    videoCallWidgetModel.dispose();
    teacherSidebarModel.dispose();
    chatThreadComponentModel.dispose();
  }
}
