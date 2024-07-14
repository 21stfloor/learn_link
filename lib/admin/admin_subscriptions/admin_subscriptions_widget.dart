import '/admin/admin_sidebar/admin_sidebar_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/admin_subscriptions_payment_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_subscriptions_model.dart';
export 'admin_subscriptions_model.dart';

class AdminSubscriptionsWidget extends StatefulWidget {
  const AdminSubscriptionsWidget({super.key});

  @override
  State<AdminSubscriptionsWidget> createState() =>
      _AdminSubscriptionsWidgetState();
}

class _AdminSubscriptionsWidgetState extends State<AdminSubscriptionsWidget> {
  late AdminSubscriptionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminSubscriptionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.adminSidebarModel,
            updateCallback: () => setState(() {}),
            child: AdminSidebarWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.drawerToggleModel,
                  updateCallback: () => setState(() {}),
                  child: DrawerToggleWidget(),
                ),
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.adminSubscriptionsPaymentModel1,
                        updateCallback: () => setState(() {}),
                        child: AdminSubscriptionsPaymentWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
