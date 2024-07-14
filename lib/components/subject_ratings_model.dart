import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/subject_rating_row_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'subject_ratings_widget.dart' show SubjectRatingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubjectRatingsModel extends FlutterFlowModel<SubjectRatingsWidget> {
  ///  Local state fields for this component.

  int iterator = 0;

  List<SubjectsRecord> allSubjects = [];
  void addToAllSubjects(SubjectsRecord item) => allSubjects.add(item);
  void removeFromAllSubjects(SubjectsRecord item) => allSubjects.remove(item);
  void removeAtIndexFromAllSubjects(int index) => allSubjects.removeAt(index);
  void insertAtIndexInAllSubjects(int index, SubjectsRecord item) =>
      allSubjects.insert(index, item);
  void updateAllSubjectsAtIndex(int index, Function(SubjectsRecord) updateFn) =>
      allSubjects[index] = updateFn(allSubjects[index]);

  List<SkillSurveyStruct> subjectsToSave = [];
  void addToSubjectsToSave(SkillSurveyStruct item) => subjectsToSave.add(item);
  void removeFromSubjectsToSave(SkillSurveyStruct item) =>
      subjectsToSave.remove(item);
  void removeAtIndexFromSubjectsToSave(int index) =>
      subjectsToSave.removeAt(index);
  void insertAtIndexInSubjectsToSave(int index, SkillSurveyStruct item) =>
      subjectsToSave.insert(index, item);
  void updateSubjectsToSaveAtIndex(
          int index, Function(SkillSurveyStruct) updateFn) =>
      subjectsToSave[index] = updateFn(subjectsToSave[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in subjectRatings widget.
  List<SubjectsRecord>? allSubjectResult;
  // Models for subjectRatingRow dynamic component.
  late FlutterFlowDynamicModels<SubjectRatingRowModel> subjectRatingRowModels;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SkillSurveyRecord? existingSkillSurvey;

  @override
  void initState(BuildContext context) {
    subjectRatingRowModels =
        FlutterFlowDynamicModels(() => SubjectRatingRowModel());
  }

  @override
  void dispose() {
    subjectRatingRowModels.dispose();
  }
}
