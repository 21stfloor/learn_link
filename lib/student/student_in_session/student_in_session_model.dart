import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_groupwbubbles/chat_details_overlay/chat_details_overlay_widget.dart';
import '/chat_groupwbubbles/chat_thread_component/chat_thread_component_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/video_call_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'student_in_session_widget.dart' show StudentInSessionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StudentInSessionModel extends FlutterFlowModel<StudentInSessionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in studentInSession widget.
  StudentProfileRecord? existingStudentProfile;
  // Stores action output result for [Backend Call - Read Document] action in studentInSession widget.
  ChatsRecord? chatDoc;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for videoCallWidget component.
  late VideoCallWidgetModel videoCallWidgetModel;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;
  // Model for chat_ThreadComponent component.
  late ChatThreadComponentModel chatThreadComponentModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    videoCallWidgetModel = createModel(context, () => VideoCallWidgetModel());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
    chatThreadComponentModel =
        createModel(context, () => ChatThreadComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    videoCallWidgetModel.dispose();
    studentSidebarModel.dispose();
    chatThreadComponentModel.dispose();
  }
}
