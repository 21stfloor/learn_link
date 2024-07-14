import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/subject_rating_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subject_ratings_model.dart';
export 'subject_ratings_model.dart';

class SubjectRatingsWidget extends StatefulWidget {
  const SubjectRatingsWidget({super.key});

  @override
  State<SubjectRatingsWidget> createState() => _SubjectRatingsWidgetState();
}

class _SubjectRatingsWidgetState extends State<SubjectRatingsWidget> {
  late SubjectRatingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectRatingsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.allSubjectResult = await querySubjectsRecordOnce();
      _model.allSubjects =
          _model.allSubjectResult!.toList().cast<SubjectsRecord>();
      setState(() {});
      _model.iterator = 0;
      setState(() {});
      while (_model.iterator < _model.allSubjectResult!.length) {
        _model.addToSubjectsToSave(SkillSurveyStruct(
          score: 1,
          subject: _model.allSubjectResult?[_model.iterator]?.name,
        ));
        _model.iterator = _model.iterator + 1;
        setState(() {});
      }
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                    child: Text(
                      'Subject Ratings',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 16.0),
              child: Text(
                'Rate your skills on subjects',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final subjectRows =
                          _model.allSubjectResult?.toList() ?? [];

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(subjectRows.length,
                              (subjectRowsIndex) {
                            final subjectRowsItem =
                                subjectRows[subjectRowsIndex];
                            return wrapWithModel(
                              model: _model.subjectRatingRowModels.getModel(
                                subjectRowsItem.reference.id,
                                subjectRowsIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: SubjectRatingRowWidget(
                                key: Key(
                                  'Key44d_${subjectRowsItem.reference.id}',
                                ),
                                parameter1: subjectRowsItem.name,
                                saveAction: (subjectData) async {
                                  _model.updateSubjectsToSaveAtIndex(
                                    subjectRowsIndex,
                                    (_) => subjectData,
                                  );
                                  setState(() {});
                                },
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      _model.iterator = 0;
                      setState(() {});
                      while (_model.iterator < _model.subjectsToSave.length) {
                        _model.existingSkillSurvey =
                            await querySkillSurveyRecordOnce(
                          queryBuilder: (skillSurveyRecord) => skillSurveyRecord
                              .where(
                                'subject',
                                isEqualTo: _model
                                    .subjectsToSave[_model.iterator].subject,
                              )
                              .where(
                                'user',
                                isEqualTo: currentUserReference,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.existingSkillSurvey != null) {
                          firestoreBatch
                              .update(_model.existingSkillSurvey!.reference, {
                            ...createSkillSurveyRecordData(
                              score:
                                  _model.subjectsToSave[_model.iterator].score,
                            ),
                            ...mapToFirestore(
                              {
                                'date': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        } else {
                          firestoreBatch
                              .set(SkillSurveyRecord.collection.doc(), {
                            ...createSkillSurveyRecordData(
                              user: currentUserReference,
                              subject: _model
                                  .subjectsToSave[_model.iterator].subject,
                              score:
                                  _model.subjectsToSave[_model.iterator].score,
                            ),
                            ...mapToFirestore(
                              {
                                'date': FieldValue.serverTimestamp(),
                              },
                            ),
                          });
                        }

                        _model.iterator = _model.iterator + 1;
                        setState(() {});
                      }

                      context.goNamed('studentDashboard');
                    } finally {
                      await firestoreBatch.commit();
                    }

                    setState(() {});
                  },
                  text: 'Submit',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ),
          ],
        ),
      ),
    );
  }
}
