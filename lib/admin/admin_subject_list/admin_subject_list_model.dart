import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/admin/subject_edit_dialog/subject_edit_dialog_widget.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_subject_list_widget.dart' show AdminSubjectListWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSubjectListModel extends FlutterFlowModel<AdminSubjectListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
