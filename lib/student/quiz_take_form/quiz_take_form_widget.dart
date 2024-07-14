import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/question_view/question_view_widget.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_take_form_model.dart';
export 'quiz_take_form_model.dart';

class QuizTakeFormWidget extends StatefulWidget {
  const QuizTakeFormWidget({
    super.key,
    required this.quiz,
    required this.quizTaker,
    required this.session,
  });

  final QuizRecord? quiz;
  final QuizTakerRecord? quizTaker;
  final SessionsRecord? session;

  @override
  State<QuizTakeFormWidget> createState() => _QuizTakeFormWidgetState();
}

class _QuizTakeFormWidgetState extends State<QuizTakeFormWidget>
    with TickerProviderStateMixin {
  late QuizTakeFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizTakeFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final firestoreBatch = FirebaseFirestore.instance.batch();
      try {
        _model.allQuestions = await queryQuestionRecordOnce(
          parent: widget!.quiz?.reference,
        );
        _model.filteredQuestions = _model.allQuestions!
            .where(
                (e) => !widget!.quizTaker!.doneQuestions.contains(e.reference))
            .toList()
            .toList()
            .cast<QuestionRecord>();
        setState(() {});
        if ((widget!.quizTaker!.doneQuestions.length >=
                _model.filteredQuestions.length) &&
            !widget!.quizTaker!.done) {
          firestoreBatch.update(
              widget!.quizTaker!.reference,
              createQuizTakerRecordData(
                done: true,
              ));
          _model.finished = true;
          setState(() {});
        }
        _model.existingQuizResult = await queryQuizResultRecordOnce(
          parent: widget!.quiz?.reference,
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.existingQuizResult != null) {
          _model.quizResult = _model.existingQuizResult;
          _model.currentScore = _model.existingQuizResult!.correctAnswers;
          setState(() {});
        } else {
          var quizResultRecordReference =
              QuizResultRecord.createDoc(widget!.quiz!.reference);
          firestoreBatch.set(quizResultRecordReference, {
            ...createQuizResultRecordData(
              user: currentUserReference,
              totalItems: widget!.quiz?.questions?.length,
              session: widget!.session?.reference,
            ),
            ...mapToFirestore(
              {
                'dateTaken': FieldValue.serverTimestamp(),
              },
            ),
          });
          _model.createQuizResult = QuizResultRecord.getDocumentFromData({
            ...createQuizResultRecordData(
              user: currentUserReference,
              totalItems: widget!.quiz?.questions?.length,
              session: widget!.session?.reference,
            ),
            ...mapToFirestore(
              {
                'dateTaken': DateTime.now(),
              },
            ),
          }, quizResultRecordReference);
          _model.quizResult = _model.createQuizResult;
          setState(() {});
        }
      } finally {
        await firestoreBatch.commit();
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
            model: _model.studentSidebarModel,
            updateCallback: () => setState(() {}),
            child: StudentSidebarWidget(),
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
                child: Builder(
                  builder: (context) {
                    if ((widget!.quizTaker != null) &&
                        !widget!.quizTaker!.done) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget!.quiz?.name,
                                    'Quiz name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Question ${((int var1, int len) {
                                    return len > 0 ? var1 + 1 : 0;
                                  }(_model.pageViewCurrentIndex, _model.filteredQuestions.length)).toString()}/${_model.filteredQuestions.length.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 0.0),
                              child: LinearPercentIndicator(
                                percent: (_model.pageViewCurrentIndex /
                                        _model.allQuestions!.length) *
                                    100,
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                lineHeight: 12.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).primary,
                                backgroundColor: Color(0xFFE0E3E7),
                                barRadius: Radius.circular(24.0),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (((widget!.quizTaker!.doneQuestions
                                                  .length >=
                                              _model
                                                  .filteredQuestions.length) ||
                                          (_model
                                              .filteredQuestions.isNotEmpty)) &&
                                      !_model.finished) {
                                    return Builder(
                                      builder: (context) {
                                        final questionsRows =
                                            _model.filteredQuestions.toList();

                                        return Container(
                                          width: double.infinity,
                                          height: 500.0,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 40.0),
                                            child: PageView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              questionsRows
                                                                      .length -
                                                                  1))),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: questionsRows.length,
                                              itemBuilder: (context,
                                                  questionsRowsIndex) {
                                                final questionsRowsItem =
                                                    questionsRows[
                                                        questionsRowsIndex];
                                                return wrapWithModel(
                                                  model: _model
                                                      .questionViewModels
                                                      .getModel(
                                                    questionsRowsItem
                                                        .reference.id,
                                                    questionsRowsIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: QuestionViewWidget(
                                                    key: Key(
                                                      'Keyhz6_${questionsRowsItem.reference.id}',
                                                    ),
                                                    question: questionsRowsItem,
                                                    enableNext: () async {
                                                      _model.nextEnabled = true;
                                                      setState(() {});
                                                    },
                                                    selectedAction:
                                                        (selectedAnswer) async {
                                                      _model.selectedAnswer =
                                                          selectedAnswer;
                                                      _model.correctAnswer = '';
                                                      setState(() {});
                                                      _model.correctAnswer = _model
                                                          .filteredQuestions[_model
                                                              .pageViewCurrentIndex]
                                                          .answer;
                                                      setState(() {});
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall) {
                                            return 360.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointMedium) {
                                            return 800.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              kBreakpointLarge) {
                                            return 1280.0;
                                          } else {
                                            return 800.0;
                                          }
                                        }(),
                                        height: 160.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x2B202529),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.smileBeam,
                                                color: Color(0xFF14181B),
                                                size: 50.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 4.0),
                                                child: Text(
                                                  '${_model.currentScore.toString()} correct answers out of ${_model.quizResult?.totalItems?.toString()} items',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 36.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 4.0),
                                                child: Text(
                                                  '${_model.finalScore.toString()}%',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 36.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Congratulations\nYou already completed this quiz!',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    );
                                  }
                                },
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (_model.nextEnabled && !_model.finished)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 32.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        final firestoreBatch =
                                            FirebaseFirestore.instance.batch();
                                        try {
                                          // Check if answer is wrong
                                          if (!((_model.selectedAnswer ==
                                                      null ||
                                                  _model.selectedAnswer ==
                                                      '') ||
                                              (_model.correctAnswer !=
                                                  _model.selectedAnswer))) {
                                            firestoreBatch.update(
                                                _model.quizResult!.reference, {
                                              ...mapToFirestore(
                                                {
                                                  'correctAnswers':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            _model.currentScore =
                                                _model.currentScore + 1;
                                            setState(() {});
                                          }

                                          firestoreBatch.update(
                                              widget!.quizTaker!.reference, {
                                            ...mapToFirestore(
                                              {
                                                'doneQuestions':
                                                    FieldValue.arrayUnion([
                                                  _model
                                                      .filteredQuestions[_model
                                                          .pageViewCurrentIndex]
                                                      .reference
                                                ]),
                                              },
                                            ),
                                          });
                                          // check if this is the last question
                                          if (_model.pageViewCurrentIndex <
                                              (_model.filteredQuestions.length -
                                                  1)) {
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                            return;
                                          } else {
                                            _model.finished = true;
                                            setState(() {});

                                            firestoreBatch.update(
                                                widget!.quizTaker!.reference,
                                                createQuizTakerRecordData(
                                                  done: true,
                                                ));

                                            firestoreBatch.update(
                                                _model.quizResult!.reference,
                                                createQuizResultRecordData(
                                                  score: (_model.currentScore /
                                                          _model.quizResult!
                                                              .totalItems) *
                                                      100,
                                                ));
                                            _model.finalScore =
                                                (_model.currentScore /
                                                        _model.quizResult!
                                                            .totalItems) *
                                                    100;
                                            setState(() {});
                                          }

                                          _model.nextEnabled = false;
                                          setState(() {});
                                        } finally {
                                          await firestoreBatch.commit();
                                        }
                                      },
                                      text: 'Next Question',
                                      icon: Icon(
                                        Icons.navigate_next_sharp,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
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
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                if (_model.finished)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 32.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.goNamed('studentMySessions');
                                      },
                                      text: 'Finish',
                                      icon: Icon(
                                        Icons.check_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        size: 32.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
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
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_none,
                            color: Color(0xFF606A85),
                            size: 72.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'The quiz is over',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF15161E),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.goNamed('studentDashboard');
                            },
                            text: 'Back to home',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
