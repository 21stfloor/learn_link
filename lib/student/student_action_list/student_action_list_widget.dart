import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'student_action_list_model.dart';
export 'student_action_list_model.dart';

class StudentActionListWidget extends StatefulWidget {
  const StudentActionListWidget({
    super.key,
    required this.schedule,
    required this.session,
  });

  final SchedulesRecord? schedule;
  final SessionsRecord? session;

  @override
  State<StudentActionListWidget> createState() =>
      _StudentActionListWidgetState();
}

class _StudentActionListWidgetState extends State<StudentActionListWidget> {
  late StudentActionListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentActionListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 360.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 860.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 1280.0;
          } else {
            return 860.0;
          }
        }(),
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Container(
                  width: 50.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Choose Action',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: StreamBuilder<List<QuizSessionRecord>>(
                  stream: queryQuizSessionRecord(
                    queryBuilder: (quizSessionRecord) => quizSessionRecord
                        .where(
                          'status',
                          isEqualTo: FFAppConstants.quizStatusOngoing,
                        )
                        .where(
                          'subject',
                          isEqualTo: widget!.schedule?.subject,
                        )
                        .where(
                          'session',
                          isEqualTo: widget!.session?.reference,
                        ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<QuizSessionRecord> listViewQuizSessionRecordList =
                        snapshot.data!;

                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewQuizSessionRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewQuizSessionRecord =
                            listViewQuizSessionRecordList[listViewIndex];
                        return StreamBuilder<List<QuizTakerRecord>>(
                          stream: queryQuizTakerRecord(
                            parent: listViewQuizSessionRecord.reference,
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<QuizTakerRecord> containerQuizTakerRecordList =
                                snapshot.data!;

                            final containerQuizTakerRecord =
                                containerQuizTakerRecordList.isNotEmpty
                                    ? containerQuizTakerRecordList.first
                                    : null;
                            return Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<QuizRecord>(
                                stream: QuizRecord.getDocument(
                                    listViewQuizSessionRecord.quiz!),
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final rowQuizRecord = snapshot.data!;

                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: rowQuizRecord.name,
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: dateTimeFormat(
                                                    'relative',
                                                    listViewQuizSessionRecord
                                                        .dateStarted!),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            if (!(containerQuizTakerRecord !=
                                                    null) ||
                                                !containerQuizTakerRecord!
                                                    .done) {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  final firestoreBatch =
                                                      FirebaseFirestore.instance
                                                          .batch();
                                                  try {
                                                    if (!(containerQuizTakerRecord !=
                                                        null)) {
                                                      var quizTakerRecordReference =
                                                          QuizTakerRecord.createDoc(
                                                              listViewQuizSessionRecord
                                                                  .reference);
                                                      firestoreBatch.set(
                                                          quizTakerRecordReference,
                                                          createQuizTakerRecordData(
                                                            quizSession:
                                                                listViewQuizSessionRecord
                                                                    .reference,
                                                            student:
                                                                currentUserReference,
                                                            quiz: rowQuizRecord
                                                                .reference,
                                                            done: false,
                                                          ));
                                                      _model.createdTakeQuiz =
                                                          QuizTakerRecord
                                                              .getDocumentFromData(
                                                                  createQuizTakerRecordData(
                                                                    quizSession:
                                                                        listViewQuizSessionRecord
                                                                            .reference,
                                                                    student:
                                                                        currentUserReference,
                                                                    quiz: rowQuizRecord
                                                                        .reference,
                                                                    done: false,
                                                                  ),
                                                                  quizTakerRecordReference);

                                                      context.goNamed(
                                                        'quizTakeForm',
                                                        queryParameters: {
                                                          'quiz':
                                                              serializeParam(
                                                            rowQuizRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'quizTaker':
                                                              serializeParam(
                                                            _model
                                                                .createdTakeQuiz,
                                                            ParamType.Document,
                                                          ),
                                                          'session':
                                                              serializeParam(
                                                            widget!.session,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'quiz': rowQuizRecord,
                                                          'quizTaker': _model
                                                              .createdTakeQuiz,
                                                          'session':
                                                              widget!.session,
                                                        },
                                                      );
                                                    } else {
                                                      firestoreBatch.update(
                                                          listViewQuizSessionRecord
                                                              .reference,
                                                          {
                                                            ...mapToFirestore(
                                                              {
                                                                'studentsCount':
                                                                    FieldValue
                                                                        .increment(
                                                                            1),
                                                              },
                                                            ),
                                                          });

                                                      context.goNamed(
                                                        'quizTakeForm',
                                                        queryParameters: {
                                                          'quiz':
                                                              serializeParam(
                                                            rowQuizRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'quizTaker':
                                                              serializeParam(
                                                            containerQuizTakerRecord,
                                                            ParamType.Document,
                                                          ),
                                                          'session':
                                                              serializeParam(
                                                            widget!.session,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'quiz': rowQuizRecord,
                                                          'quizTaker':
                                                              containerQuizTakerRecord,
                                                          'session':
                                                              widget!.session,
                                                        },
                                                      );
                                                    }
                                                  } finally {
                                                    await firestoreBatch
                                                        .commit();
                                                  }

                                                  setState(() {});
                                                },
                                                text:
                                                    containerQuizTakerRecord !=
                                                            null
                                                        ? 'Continue'
                                                        : 'Take quiz',
                                                icon: Icon(
                                                  Icons.start_sharp,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                              );
                                            } else {
                                              return Text(
                                                '  You\'ve already taken this quiz..\n  Or it is already expired...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 8.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Close',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: Color(0xFF7C8791),
                                  size: 24.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
