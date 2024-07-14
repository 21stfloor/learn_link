import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/no_skill_survey_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'dart:math';
import 'auth2_profile_widget.dart' show Auth2ProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Auth2ProfileModel extends FlutterFlowModel<Auth2ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    teacherSidebarModel.dispose();
    studentSidebarModel.dispose();
  }
}
