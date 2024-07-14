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
import 'quiz_take_form_widget.dart' show QuizTakeFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizTakeFormModel extends FlutterFlowModel<QuizTakeFormWidget> {
  ///  Local state fields for this page.

  bool nextEnabled = true;

  String correctAnswer = 'none';

  List<QuestionRecord> filteredQuestions = [];
  void addToFilteredQuestions(QuestionRecord item) =>
      filteredQuestions.add(item);
  void removeFromFilteredQuestions(QuestionRecord item) =>
      filteredQuestions.remove(item);
  void removeAtIndexFromFilteredQuestions(int index) =>
      filteredQuestions.removeAt(index);
  void insertAtIndexInFilteredQuestions(int index, QuestionRecord item) =>
      filteredQuestions.insert(index, item);
  void updateFilteredQuestionsAtIndex(
          int index, Function(QuestionRecord) updateFn) =>
      filteredQuestions[index] = updateFn(filteredQuestions[index]);

  String? selectedAnswer;

  bool finished = false;

  QuizResultRecord? quizResult;

  int currentScore = 0;

  double finalScore = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in quizTakeForm widget.
  List<QuestionRecord>? allQuestions;
  // Stores action output result for [Firestore Query - Query a collection] action in quizTakeForm widget.
  QuizResultRecord? existingQuizResult;
  // Stores action output result for [Backend Call - Create Document] action in quizTakeForm widget.
  QuizResultRecord? createQuizResult;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for questionView dynamic component.
  late FlutterFlowDynamicModels<QuestionViewModel> questionViewModels;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    questionViewModels = FlutterFlowDynamicModels(() => QuestionViewModel());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    questionViewModels.dispose();
    studentSidebarModel.dispose();
  }
}
