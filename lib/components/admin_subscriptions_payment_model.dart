import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_subscriptions_payment_widget.dart'
    show AdminSubscriptionsPaymentWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AdminSubscriptionsPaymentModel
    extends FlutterFlowModel<AdminSubscriptionsPaymentWidget> {
  ///  Local state fields for this component.

  List<SubscriptionsRecord> results = [];
  void addToResults(SubscriptionsRecord item) => results.add(item);
  void removeFromResults(SubscriptionsRecord item) => results.remove(item);
  void removeAtIndexFromResults(int index) => results.removeAt(index);
  void insertAtIndexInResults(int index, SubscriptionsRecord item) =>
      results.insert(index, item);
  void updateResultsAtIndex(
          int index, Function(SubscriptionsRecord) updateFn) =>
      results[index] = updateFn(results[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in adminSubscriptionsPayment widget.
  List<SubscriptionsRecord>? allSubs;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SubscriptionsRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<SubscriptionsRecord>? allSubs2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
