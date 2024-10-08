import '/components/subject_ratings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'student_skill_rating_model.dart';
export 'student_skill_rating_model.dart';

class StudentSkillRatingWidget extends StatefulWidget {
  const StudentSkillRatingWidget({super.key});

  @override
  State<StudentSkillRatingWidget> createState() =>
      _StudentSkillRatingWidgetState();
}

class _StudentSkillRatingWidgetState extends State<StudentSkillRatingWidget> {
  late StudentSkillRatingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StudentSkillRatingModel());

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
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.subjectRatingsModel,
            updateCallback: () => setState(() {}),
            child: SubjectRatingsWidget(),
          ),
        ),
      ),
    );
  }
}
