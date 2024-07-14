import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subject_rating_row_model.dart';
export 'subject_rating_row_model.dart';

class SubjectRatingRowWidget extends StatefulWidget {
  const SubjectRatingRowWidget({
    super.key,
    this.parameter1,
    this.saveAction,
  });

  final String? parameter1;
  final Future Function(SkillSurveyStruct subjectData)? saveAction;

  @override
  State<SubjectRatingRowWidget> createState() => _SubjectRatingRowWidgetState();
}

class _SubjectRatingRowWidgetState extends State<SubjectRatingRowWidget> {
  late SubjectRatingRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubjectRatingRowModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget!.parameter1!,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          RatingBar.builder(
            onRatingUpdate: (newValue) async {
              setState(() => _model.ratingBarValue = newValue);
              await widget.saveAction?.call(
                SkillSurveyStruct(
                  score: _model.ratingBarValue?.round(),
                  subject: widget!.parameter1,
                ),
              );
            },
            itemBuilder: (context, index) => Icon(
              Icons.star_rounded,
              color: FlutterFlowTheme.of(context).tertiary,
            ),
            direction: Axis.horizontal,
            initialRating: _model.ratingBarValue ??= 1.0,
            unratedColor: FlutterFlowTheme.of(context).accent3,
            itemCount: 5,
            itemSize: 40.0,
            glowColor: FlutterFlowTheme.of(context).tertiary,
          ),
        ],
      ),
    );
  }
}
