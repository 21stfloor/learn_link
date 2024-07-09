import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/question_view/question_view_widget.dart';
import 'quiz_take_form_widget.dart' show QuizTakeFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizTakeFormModel extends FlutterFlowModel<QuizTakeFormWidget> {
  ///  Local state fields for this page.

  bool nextEnabled = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in quizTakeForm widget.
  List<QuestionRecord>? allQuestions;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for questionView dynamic component.
  late FlutterFlowDynamicModels<QuestionViewModel> questionViewModels;

  @override
  void initState(BuildContext context) {
    questionViewModels = FlutterFlowDynamicModels(() => QuestionViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    questionViewModels.dispose();
  }
}
