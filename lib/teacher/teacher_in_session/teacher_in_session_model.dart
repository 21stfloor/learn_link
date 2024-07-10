import '/backend/backend.dart';
import '/chat_groupwbubbles/chat_details_overlay/chat_details_overlay_widget.dart';
import '/chat_groupwbubbles/chat_thread_component/chat_thread_component_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/common/video_call_widget/video_call_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'teacher_in_session_widget.dart' show TeacherInSessionWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TeacherInSessionModel extends FlutterFlowModel<TeacherInSessionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
