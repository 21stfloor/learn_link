import '/auth/firebase_auth/auth_util.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/common/edit_profile_auth_2/edit_profile_auth2_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'dart:math';
import 'auth2_edit_student_profile_widget.dart'
    show Auth2EditStudentProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Auth2EditStudentProfileModel
    extends FlutterFlowModel<Auth2EditStudentProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for editProfile_auth_2 component.
  late EditProfileAuth2Model editProfileAuth2Model;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    editProfileAuth2Model = createModel(context, () => EditProfileAuth2Model());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    editProfileAuth2Model.dispose();
    studentSidebarModel.dispose();
  }
}
