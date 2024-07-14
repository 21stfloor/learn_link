import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_settings_page_widget.dart' show AdminSettingsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSettingsPageModel extends FlutterFlowModel<AdminSettingsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in adminSettingsPage widget.
  PricesRecord? existingTutorPrice;
  // Stores action output result for [Firestore Query - Query a collection] action in adminSettingsPage widget.
  PricesRecord? existingStudentPrice;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for studentPrice widget.
  FocusNode? studentPriceFocusNode;
  TextEditingController? studentPriceTextController;
  String? Function(BuildContext, String?)? studentPriceTextControllerValidator;
  String? _studentPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for tutorPrice widget.
  FocusNode? tutorPriceFocusNode;
  TextEditingController? tutorPriceTextController;
  String? Function(BuildContext, String?)? tutorPriceTextControllerValidator;
  String? _tutorPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for adminSidebar component.
  late AdminSidebarModel adminSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    studentPriceTextControllerValidator = _studentPriceTextControllerValidator;
    tutorPriceTextControllerValidator = _tutorPriceTextControllerValidator;
    adminSidebarModel = createModel(context, () => AdminSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    studentPriceFocusNode?.dispose();
    studentPriceTextController?.dispose();

    tutorPriceFocusNode?.dispose();
    tutorPriceTextController?.dispose();

    adminSidebarModel.dispose();
  }
}
