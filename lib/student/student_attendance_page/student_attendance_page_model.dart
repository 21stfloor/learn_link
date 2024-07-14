import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'student_attendance_page_widget.dart' show StudentAttendancePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentAttendancePageModel
    extends FlutterFlowModel<StudentAttendancePageWidget> {
  ///  Local state fields for this page.

  List<SchedulesRecord> scheduleToView = [];
  void addToScheduleToView(SchedulesRecord item) => scheduleToView.add(item);
  void removeFromScheduleToView(SchedulesRecord item) =>
      scheduleToView.remove(item);
  void removeAtIndexFromScheduleToView(int index) =>
      scheduleToView.removeAt(index);
  void insertAtIndexInScheduleToView(int index, SchedulesRecord item) =>
      scheduleToView.insert(index, item);
  void updateScheduleToViewAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      scheduleToView[index] = updateFn(scheduleToView[index]);

  SchedulesRecord? currentSchedule;

  SessionsRecord? currentSessionSelected;

  int iterator = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in studentAttendancePage widget.
  List<SessionsRecord>? mySessions;
  // Stores action output result for [Backend Call - Read Document] action in studentAttendancePage widget.
  SchedulesRecord? scheduleSingle;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  SessionsRecord? newSelectedSession;
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
