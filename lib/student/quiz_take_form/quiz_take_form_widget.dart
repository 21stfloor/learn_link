import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/question_view/question_view_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_take_form_model.dart';
export 'quiz_take_form_model.dart';

class QuizTakeFormWidget extends StatefulWidget {
  const QuizTakeFormWidget({
    super.key,
    required this.quiz,
  });

  final QuizRecord? quiz;

  @override
  State<QuizTakeFormWidget> createState() => _QuizTakeFormWidgetState();
}

class _QuizTakeFormWidgetState extends State<QuizTakeFormWidget> {
  late QuizTakeFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizTakeFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allQuestions = await queryQuestionRecordOnce(
        parent: widget.quiz?.reference,
      );
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            valueOrDefault<String>(
              widget.quiz?.name,
              'Quiz name',
            ),
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'Question ${_model.pageViewCurrentIndex.toString()}/${_model.allQuestions?.length?.toString()}',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
                child: LinearPercentIndicator(
                  percent: (_model.pageViewCurrentIndex /
                          _model.allQuestions!.length) *
                      100,
                  width: MediaQuery.sizeOf(context).width * 0.96,
                  lineHeight: 12.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).primary,
                  backgroundColor: Color(0xFFE0E3E7),
                  barRadius: Radius.circular(24.0),
                  padding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final questionsRows = _model.allQuestions?.toList() ?? [];
                    return Container(
                      width: double.infinity,
                      height: 500.0,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage:
                                      max(0, min(0, questionsRows.length - 1))),
                          scrollDirection: Axis.horizontal,
                          itemCount: questionsRows.length,
                          itemBuilder: (context, questionsRowsIndex) {
                            final questionsRowsItem =
                                questionsRows[questionsRowsIndex];
                            return wrapWithModel(
                              model: _model.questionViewModels.getModel(
                                questionsRowsItem.reference.id,
                                questionsRowsIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: QuestionViewWidget(
                                key: Key(
                                  'Keyhz6_${questionsRowsItem.reference.id}',
                                ),
                                question: questionsRowsItem,
                                enableNext: () async {
                                  _model.nextEnabled = true;
                                  setState(() {});
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_model.nextEnabled)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await _model.pageViewController?.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          _model.nextEnabled = false;
                          setState(() {});
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
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
