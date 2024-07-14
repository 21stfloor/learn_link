import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'student_action_list_widget.dart' show StudentActionListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StudentActionListModel extends FlutterFlowModel<StudentActionListWidget> {
  ///  Local state fields for this component.

  int iterator = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuizTakerRecord? createdTakeQuiz;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
