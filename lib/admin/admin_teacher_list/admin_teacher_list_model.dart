import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/teacher_profile_preview/teacher_profile_preview_widget.dart';
import 'admin_teacher_list_widget.dart' show AdminTeacherListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdminTeacherListModel extends FlutterFlowModel<AdminTeacherListWidget> {
  ///  Local state fields for this page.

  List<UsersRecord> teachers = [];
  void addToTeachers(UsersRecord item) => teachers.add(item);
  void removeFromTeachers(UsersRecord item) => teachers.remove(item);
  void removeAtIndexFromTeachers(int index) => teachers.removeAt(index);
  void insertAtIndexInTeachers(int index, UsersRecord item) =>
      teachers.insert(index, item);
  void updateTeachersAtIndex(int index, Function(UsersRecord) updateFn) =>
      teachers[index] = updateFn(teachers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in adminTeacherList widget.
  List<UsersRecord>? allTeachers;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Model for adminSidebar component.
  late AdminSidebarModel adminSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    adminSidebarModel = createModel(context, () => AdminSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adminSidebarModel.dispose();
  }
}
