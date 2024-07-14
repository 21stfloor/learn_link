import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_payment_history_widget.dart' show AdminPaymentHistoryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AdminPaymentHistoryModel
    extends FlutterFlowModel<AdminPaymentHistoryWidget> {
  ///  Local state fields for this page.

  List<PaymentsRecord> results = [];
  void addToResults(PaymentsRecord item) => results.add(item);
  void removeFromResults(PaymentsRecord item) => results.remove(item);
  void removeAtIndexFromResults(int index) => results.removeAt(index);
  void insertAtIndexInResults(int index, PaymentsRecord item) =>
      results.insert(index, item);
  void updateResultsAtIndex(int index, Function(PaymentsRecord) updateFn) =>
      results[index] = updateFn(results[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in adminPaymentHistory widget.
  List<PaymentsRecord>? allPayments;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<PaymentsRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<PaymentsRecord>? allPayments2;
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
