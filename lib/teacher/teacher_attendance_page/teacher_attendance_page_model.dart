import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/subscription_required_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/attendance_grade_sheet/attendance_grade_sheet_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'teacher_attendance_page_widget.dart' show TeacherAttendancePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class TeacherAttendancePageModel
    extends FlutterFlowModel<TeacherAttendancePageWidget> {
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

  List<UsersRecord> filteredStudentResult = [];
  void addToFilteredStudentResult(UsersRecord item) =>
      filteredStudentResult.add(item);
  void removeFromFilteredStudentResult(UsersRecord item) =>
      filteredStudentResult.remove(item);
  void removeAtIndexFromFilteredStudentResult(int index) =>
      filteredStudentResult.removeAt(index);
  void insertAtIndexInFilteredStudentResult(int index, UsersRecord item) =>
      filteredStudentResult.insert(index, item);
  void updateFilteredStudentResultAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      filteredStudentResult[index] = updateFn(filteredStudentResult[index]);

  SessionsRecord? currentSessionSelected;

  int iterator = 0;

  List<UsersRecord> tempStudentList = [];
  void addToTempStudentList(UsersRecord item) => tempStudentList.add(item);
  void removeFromTempStudentList(UsersRecord item) =>
      tempStudentList.remove(item);
  void removeAtIndexFromTempStudentList(int index) =>
      tempStudentList.removeAt(index);
  void insertAtIndexInTempStudentList(int index, UsersRecord item) =>
      tempStudentList.insert(index, item);
  void updateTempStudentListAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      tempStudentList[index] = updateFn(tempStudentList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in teacherAttendancePage widget.
  TeacherProfileRecord? existingTeacherProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in teacherAttendancePage widget.
  List<SchedulesRecord>? mySchedules;
  // Stores action output result for [Firestore Query - Query a collection] action in teacherAttendancePage widget.
  SessionsRecord? selectedSession;
  // Stores action output result for [Backend Call - Read Document] action in teacherAttendancePage widget.
  UsersRecord? student;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  SessionsRecord? newSelectedSession;
  // Stores action output result for [Backend Call - Read Document] action in Text widget.
  UsersRecord? studentOnLoad;
  // State field(s) for searchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxTextController;
  String? Function(BuildContext, String?)? searchBoxTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in searchBox widget.
  UsersRecord? studentSingle;
  List<UsersRecord> simpleSearchResults = [];
  // Model for subscriptionRequired component.
  late SubscriptionRequiredModel subscriptionRequiredModel;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    subscriptionRequiredModel =
        createModel(context, () => SubscriptionRequiredModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxTextController?.dispose();

    subscriptionRequiredModel.dispose();
    teacherSidebarModel.dispose();
  }
}
