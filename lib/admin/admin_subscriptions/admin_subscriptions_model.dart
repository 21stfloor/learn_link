import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/admin_subscriptions_payment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_subscriptions_widget.dart' show AdminSubscriptionsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSubscriptionsModel
    extends FlutterFlowModel<AdminSubscriptionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // Model for adminSubscriptionsPayment component.
  late AdminSubscriptionsPaymentModel adminSubscriptionsPaymentModel1;
  // Model for adminSubscriptionsPayment component.
  late AdminSubscriptionsPaymentModel adminSubscriptionsPaymentModel2;
  // Model for adminSidebar component.
  late AdminSidebarModel adminSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    adminSubscriptionsPaymentModel1 =
        createModel(context, () => AdminSubscriptionsPaymentModel());
    adminSubscriptionsPaymentModel2 =
        createModel(context, () => AdminSubscriptionsPaymentModel());
    adminSidebarModel = createModel(context, () => AdminSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    adminSubscriptionsPaymentModel1.dispose();
    adminSubscriptionsPaymentModel2.dispose();
    adminSidebarModel.dispose();
  }
}
