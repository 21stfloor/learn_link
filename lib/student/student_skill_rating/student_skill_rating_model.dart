import '/components/subject_ratings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'student_skill_rating_widget.dart' show StudentSkillRatingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentSkillRatingModel
    extends FlutterFlowModel<StudentSkillRatingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for subjectRatings component.
  late SubjectRatingsModel subjectRatingsModel;

  @override
  void initState(BuildContext context) {
    subjectRatingsModel = createModel(context, () => SubjectRatingsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    subjectRatingsModel.dispose();
  }
}
