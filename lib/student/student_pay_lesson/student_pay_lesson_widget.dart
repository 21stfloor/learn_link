import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/lesson_receipt_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'student_pay_lesson_model.dart';
export 'student_pay_lesson_model.dart';

class StudentPayLessonWidget extends StatefulWidget {
  const StudentPayLessonWidget({
    super.key,
    double? price,
    required this.schedule,
  }) : this.price = price ?? 300.0;

  final double price;
  final SchedulesRecord? schedule;

  @override
  State<StudentPayLessonWidget> createState() => _StudentPayLessonWidgetState();
}

class _StudentPayLessonWidgetState extends State<StudentPayLessonWidget> {
  late StudentPayLessonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentPayLessonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.price = widget!.price;
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
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
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
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
                ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Container(
                  width: double.infinity,
                  height: 500.0,
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (false)
                              Column(
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<PricesRecord>
                                            radioButtonPricesRecordList =
                                            snapshot.data!;

                                        final radioButtonPricesRecord =
                                            radioButtonPricesRecordList
                                                    .isNotEmpty
                                                ? radioButtonPricesRecordList
                                                    .first
                                                : null;
                                        return FlutterFlowRadioButton(
                                          options:
                                              ['Monthly', 'Annually'].toList(),
                                          onChanged: (val) async {
                                            setState(() {});
                                            _model.price = _model
                                                        .radioButtonValue ==
                                                    FFAppConstants
                                                        .payDurationMonth
                                                ? _model.price
                                                : (FFAppConstants
                                                        .defaultSubscriptionPrice *
                                                    12);
                                            _model.selectedType = '';
                                            setState(() {});
                                          },
                                          controller: _model
                                                  .radioButtonValueController ??=
                                              FormFieldController<String>(
                                                  _model.selectedType),
                                          optionHeight: 32.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.vertical,
                                          radioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveRadioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          toggleable: false,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
                                        );
                                      },
                                    ),
                                  ),
                                ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final firestoreBatch =
                                      FirebaseFirestore.instance.batch();
                                  try {
                                    _model.createdReceiptID = await actions
                                        .generatePayPalReceiptNumber();

                                    var paymentsRecordReference =
                                        PaymentsRecord.collection.doc();
                                    firestoreBatch
                                        .set(paymentsRecordReference, {
                                      ...createPaymentsRecordData(
                                        user: currentUserReference,
                                        receiptNo: (_model.createdReceiptID!)
                                            .hashCode
                                            .toString(),
                                        amount: widget!.price,
                                        paymentMethod:
                                            FFAppConstants.paymentMethodPaypal,
                                        status: 'Paid',
                                        schedule: widget!.schedule?.reference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'payment_date':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.createdPayment =
                                        PaymentsRecord.getDocumentFromData({
                                      ...createPaymentsRecordData(
                                        user: currentUserReference,
                                        receiptNo: (_model.createdReceiptID!)
                                            .hashCode
                                            .toString(),
                                        amount: widget!.price,
                                        paymentMethod:
                                            FFAppConstants.paymentMethodPaypal,
                                        status: 'Paid',
                                        schedule: widget!.schedule?.reference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'payment_date': DateTime.now(),
                                        },
                                      ),
                                    }, paymentsRecordReference);
                                    _model.existingSession2 =
                                        await querySessionsRecordOnce(
                                      queryBuilder: (sessionsRecord) =>
                                          sessionsRecord.where(
                                        'schedule',
                                        isEqualTo: widget!.schedule?.reference,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.existingSession2?.reference !=
                                        null) {
                                      firestoreBatch.set(
                                          SessionRequestsRecord.collection
                                              .doc(),
                                          createSessionRequestsRecordData(
                                            student: currentUserReference,
                                            status: FFAppConstants
                                                .sessionRequestStatusPending,
                                            session: _model
                                                .existingSession2?.reference,
                                            subject: widget!.schedule?.subject,
                                            teacher: widget!.schedule?.teacher,
                                            schedule:
                                                widget!.schedule?.reference,
                                          ));
                                    } else {
                                      firestoreBatch.set(
                                          SessionRequestsRecord.collection
                                              .doc(),
                                          createSessionRequestsRecordData(
                                            student: currentUserReference,
                                            status: FFAppConstants
                                                .sessionRequestStatusPending,
                                            subject: widget!.schedule?.subject,
                                            teacher: widget!.schedule?.teacher,
                                            schedule:
                                                widget!.schedule?.reference,
                                          ));
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Your booking session was sent to the teacher!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: LessonReceiptWidget(
                                            payment: _model.createdPayment!,
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.paymentResult = value));

                                    if (_model.paymentResult!) {
                                      Navigator.pop(context, true);
                                    }
                                  } finally {
                                    await firestoreBatch.commit();
                                  }

                                  setState(() {});
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
                          ],
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
    );
  }
}
