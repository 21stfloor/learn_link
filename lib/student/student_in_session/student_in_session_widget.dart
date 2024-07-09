import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/chat_groupwbubbles/chat_details_overlay/chat_details_overlay_widget.dart';
import '/chat_groupwbubbles/chat_thread_component/chat_thread_component_widget.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/common/video_call_widget/video_call_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'student_in_session_model.dart';
export 'student_in_session_model.dart';

class StudentInSessionWidget extends StatefulWidget {
  const StudentInSessionWidget({
    super.key,
    this.chatRef,
  });

  final DocumentReference? chatRef;

  @override
  State<StudentInSessionWidget> createState() => _StudentInSessionWidgetState();
}

class _StudentInSessionWidgetState extends State<StudentInSessionWidget> {
  late StudentInSessionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  var _isReady = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentInSessionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.existingStudentProfile = await queryStudentProfileRecordOnce(
        parent: currentUserReference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.existingStudentProfile?.reference == null) {
        context.goNamed('auth_2_createStudentProfile');

        return;
      } else {
        _model.chatDoc = await ChatsRecord.getDocumentOnce(widget.chatRef!);
        setState(() {
          _isReady = true;
        });
        if (!_model.chatDoc!.users.contains(currentUserReference)) {
          await widget.chatRef!.update({
            ...mapToFirestore(
              {
                'users': FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }
      }
    });

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: WebViewAware(
            child: wrapWithModel(
              model: _model.studentSidebarModel,
              updateCallback: () => setState(() {}),
              child: StudentSidebarWidget(),
            ),
          ),
        ),
        endDrawer: Container(
          width: () {
            if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
              return 360.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
              return 480.0;
            } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
              return 512.0;
            } else {
              return 360.0;
            }
          }(),
          child: Drawer(
            elevation: 16.0,
            child: WebViewAware(
              child: wrapWithModel(
                model: _model.chatThreadComponentModel,
                updateCallback: () => setState(() {}),
                child: ChatThreadComponentWidget(
                  chatRef: _model.chatDoc,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              _isReady? Expanded(
                flex: 10,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 1170.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .accent4,
                                          barrierColor: Color(0x00FFFFFF),
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                    .canRequestFocus
                                                    ? FocusScope.of(context)
                                                    .requestFocus(
                                                    _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                    .unfocus(),
                                                child: Padding(
                                                  padding:
                                                  MediaQuery.viewInsetsOf(
                                                      context),
                                                  child:
                                                  ChatDetailsOverlayWidget(
                                                    chatRef: _model.chatDoc!,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.people_outline_sharp,
                                        size: 36.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: '',
                                      icon: Icon(
                                        Icons.fact_check,
                                        size: 36.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                  text: 'Chat',
                                  icon: Icon(
                                    Icons.chat_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                  MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 9,
                                        child: StreamBuilder<SessionsRecord>(
                                          stream: SessionsRecord.getDocument(
                                              _model.chatDoc!.chatSession!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final conditionalBuilderSessionsRecord =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                if (conditionalBuilderSessionsRecord
                                                    .videoCallStatus) {
                                                  return wrapWithModel(
                                                    model: _model
                                                        .videoCallWidgetModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        VideoCallWidgetWidget(
                                                      chatRef: _model.chatDoc!,
                                                    ),
                                                  );
                                                } else {
                                                  return RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Video Call ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 38.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '\nis currently off',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 36.0,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '\nPlease wait for your tutor to start the video call',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                          ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  );
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                      ))
                                        Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                          child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                0.0, 10.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .accent4,
                                                  barrierColor:
                                                  Color(0x00FFFFFF),
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                            ? FocusScope.of(
                                                            context)
                                                            .requestFocus(_model
                                                            .unfocusNode)
                                                            : FocusScope.of(
                                                            context)
                                                            .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                              context),
                                                          child:
                                                          ChatDetailsOverlayWidget(
                                                            chatRef:
                                                            _model.chatDoc!,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.people_outline_sharp,
                                                size: 36.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.fact_check,
                                                size: 36.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                                color:
                                                FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                  fontFamily:
                                                  'Readex Pro',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                              ),
                                            ),
                                        ].divide(SizedBox(height: 10.0)),
                                        ),
                                    ],
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
              ): Container()
              ,
            ],
          ),
        ),
      ),
    );
  }
}
