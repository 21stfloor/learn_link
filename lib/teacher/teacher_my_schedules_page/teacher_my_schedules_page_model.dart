import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/milestone_list_widget.dart';
import '/components/subscription_payment_select_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/schedule_edit_dialog/schedule_edit_dialog_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'teacher_my_schedules_page_widget.dart'
    show TeacherMySchedulesPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherMySchedulesPageModel
    extends FlutterFlowModel<TeacherMySchedulesPageWidget> {
  ///  Local state fields for this page.

  List<SchedulesRecord> searchResult = [];
  void addToSearchResult(SchedulesRecord item) => searchResult.add(item);
  void removeFromSearchResult(SchedulesRecord item) =>
      searchResult.remove(item);
  void removeAtIndexFromSearchResult(int index) => searchResult.removeAt(index);
  void insertAtIndexInSearchResult(int index, SchedulesRecord item) =>
      searchResult.insert(index, item);
  void updateSearchResultAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      searchResult[index] = updateFn(searchResult[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in teacherMySchedulesPage widget.
  TeacherProfileRecord? existingTeacherProfile;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    teacherSidebarModel.dispose();
  }
}
