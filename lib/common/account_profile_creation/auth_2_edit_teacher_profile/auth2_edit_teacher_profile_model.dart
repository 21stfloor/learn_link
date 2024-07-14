import '/auth/firebase_auth/auth_util.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/edit_profile_auth_teacher/edit_profile_auth_teacher_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'dart:math';
import 'auth2_edit_teacher_profile_widget.dart'
    show Auth2EditTeacherProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth2EditTeacherProfileModel
    extends FlutterFlowModel<Auth2EditTeacherProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for editProfile_auth_teacher component.
  late EditProfileAuthTeacherModel editProfileAuthTeacherModel;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    editProfileAuthTeacherModel =
        createModel(context, () => EditProfileAuthTeacherModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    editProfileAuthTeacherModel.dispose();
    teacherSidebarModel.dispose();
  }
}
