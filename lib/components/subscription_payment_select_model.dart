import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/receipt_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'subscription_payment_select_widget.dart'
    show SubscriptionPaymentSelectWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscriptionPaymentSelectModel
    extends FlutterFlowModel<SubscriptionPaymentSelectWidget> {
  ///  Local state fields for this component.

  double? price = 300.0;

  String selectedType = 'Monthly';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in subscriptionPaymentSelect widget.
  PricesRecord? existingStudentPrice;
  // Stores action output result for [Firestore Query - Query a collection] action in subscriptionPaymentSelect widget.
  PricesRecord? existingTutorPrice;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Custom Action - generatePayPalReceiptNumber] action in Button widget.
  String? createdReceiptID;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SubscriptionsRecord? createdSubscription;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
