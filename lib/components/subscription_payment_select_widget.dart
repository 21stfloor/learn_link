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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_payment_select_model.dart';
export 'subscription_payment_select_model.dart';

class SubscriptionPaymentSelectWidget extends StatefulWidget {
  const SubscriptionPaymentSelectWidget({
    super.key,
    required this.role,
  });

  final String? role;

  @override
  State<SubscriptionPaymentSelectWidget> createState() =>
      _SubscriptionPaymentSelectWidgetState();
}

class _SubscriptionPaymentSelectWidgetState
    extends State<SubscriptionPaymentSelectWidget> {
  late SubscriptionPaymentSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPaymentSelectModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.role, '') ==
          FFAppConstants.userTypeStudent) {
        _model.existingStudentPrice = await queryPricesRecordOnce(
          queryBuilder: (pricesRecord) => pricesRecord.where(
            'userType',
            isEqualTo: FFAppConstants.userTypeStudent,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.existingStudentPrice != null) {
          _model.price = _model.existingStudentPrice?.price;
          setState(() {});
          return;
        }
      } else {
        _model.existingTutorPrice = await queryPricesRecordOnce(
          queryBuilder: (pricesRecord) => pricesRecord.where(
            'userType',
            isEqualTo: FFAppConstants.userTypeTeacher,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.existingTutorPrice != null) {
          _model.price = _model.existingTutorPrice?.price;
          setState(() {});
          return;
        }
      }

      _model.price = FFAppConstants.defaultSubscriptionPrice;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 360.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 500.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 640.0;
        } else {
          return 360.0;
        }
      }(),
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x25090F13),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Container(
                    width: 60.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 44.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Payment',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Text(
                            'Fill in the information below to place your order.',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: double.infinity,
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              'Select duration',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<PricesRecord>>(
                              stream: queryPricesRecord(
                                queryBuilder: (pricesRecord) =>
                                    pricesRecord.where(
                                  'userType',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.role, ''),
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<PricesRecord> radioButtonPricesRecordList =
                                    snapshot.data!;

                                final radioButtonPricesRecord =
                                    radioButtonPricesRecordList.isNotEmpty
                                        ? radioButtonPricesRecordList.first
                                        : null;
                                return FlutterFlowRadioButton(
                                  options: ['Monthly', 'Annually'].toList(),
                                  onChanged: (val) async {
                                    setState(() {});
                                    if (radioButtonPricesRecord != null) {
                                      _model.price = _model.radioButtonValue ==
                                              FFAppConstants.payDurationMonth
                                          ? radioButtonPricesRecord?.price
                                          : (radioButtonPricesRecord!.price *
                                              12);
                                      setState(() {});
                                    } else {
                                      _model.price = _model.radioButtonValue ==
                                              FFAppConstants.payDurationMonth
                                          ? FFAppConstants
                                              .defaultSubscriptionPrice
                                          : (FFAppConstants
                                                  .defaultSubscriptionPrice *
                                              12);
                                      setState(() {});
                                    }
                                  },
                                  controller: _model
                                          .radioButtonValueController ??=
                                      FormFieldController<String>('Monthly'),
                                  optionHeight: 32.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  selectedTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                  buttonPosition: RadioButtonPosition.left,
                                  direction: Axis.vertical,
                                  radioButtonColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveRadioButtonColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  toggleable: false,
                                  horizontalAlignment: WrapAlignment.start,
                                  verticalAlignment: WrapCrossAlignment.start,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Price Breakdown',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 36.0,
                                      icon: Icon(
                                        Icons.info_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                  formatNumber(
                                    _model.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                    currency: 'P',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.selectedType == null ||
                                      _model.selectedType == '') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Invalid'),
                                          content: Text(
                                              'Please select a valid type!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  var confirmDialogResponse = await showDialog<
                                          bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Confirm'),
                                            content: Text(
                                                'Confirm payment of ${formatNumber(
                                              _model.price,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                              currency: 'P',
                                            )}?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    _model.createdReceiptID = await actions
                                        .generatePayPalReceiptNumber();
                                    _shouldSetState = true;

                                    var subscriptionsRecordReference =
                                        SubscriptionsRecord.collection.doc();
                                    await subscriptionsRecordReference.set({
                                      ...createSubscriptionsRecordData(
                                        user: currentUserReference,
                                        type: _model.radioButtonValue,
                                        price: _model.price,
                                        status:
                                            FFAppConstants.quizStatusOngoing,
                                        paymentMethod:
                                            FFAppConstants.paymentMethodPaypal,
                                        receiptNo: (_model.createdReceiptID!)
                                            .hashCode
                                            .toString(),
                                        expiryDate: _model.radioButtonValue ==
                                                FFAppConstants.payDurationMonth
                                            ? functions.addOneMonth(
                                                getCurrentTimestamp)
                                            : functions.addTwelveMonths(
                                                getCurrentTimestamp),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.createdSubscription =
                                        SubscriptionsRecord
                                            .getDocumentFromData({
                                      ...createSubscriptionsRecordData(
                                        user: currentUserReference,
                                        type: _model.radioButtonValue,
                                        price: _model.price,
                                        status:
                                            FFAppConstants.quizStatusOngoing,
                                        paymentMethod:
                                            FFAppConstants.paymentMethodPaypal,
                                        receiptNo: (_model.createdReceiptID!)
                                            .hashCode
                                            .toString(),
                                        expiryDate: _model.radioButtonValue ==
                                                FFAppConstants.payDurationMonth
                                            ? functions.addOneMonth(
                                                getCurrentTimestamp)
                                            : functions.addTwelveMonths(
                                                getCurrentTimestamp),
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'date': DateTime.now(),
                                        },
                                      ),
                                    }, subscriptionsRecordReference);
                                    _shouldSetState = true;
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Success'),
                                          content: Text(
                                              'You are now subscribed! Thank you very much'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.pop(context);
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: ReceiptWidget(
                                            subscription:
                                                _model.createdSubscription!,
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  }
                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Pay w/Paypal',
                                icon: FaIcon(
                                  FontAwesomeIcons.paypal,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                options: FFButtonOptions(
                                  width: 270.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
