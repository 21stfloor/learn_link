import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/rate_teacher_now_widget.dart';
import '/components/refund_reason_dialog_widget.dart';
import '/components/subscription_payment_select_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/book_session/book_session_widget.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'student_my_sessions_widget.dart' show StudentMySessionsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentMySessionsModel extends FlutterFlowModel<StudentMySessionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in studentMySessions widget.
  StudentProfileRecord? existingStudentProfile;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SessionsRecord? session;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SchedulesRecord? schedule;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? existingChatRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChatRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  PaymentsRecord? existingPayment;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SessionsRecord? sched;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? tutor;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    studentSidebarModel.dispose();
  }
}
