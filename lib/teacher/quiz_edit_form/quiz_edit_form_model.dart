import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/teacher/question_entry/question_entry_widget.dart';
import '/teacher/question_new_form/question_new_form_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'quiz_edit_form_widget.dart' show QuizEditFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class QuizEditFormModel extends FlutterFlowModel<QuizEditFormWidget> {
  ///  Local state fields for this page.

  List<QuestionStruct> questionsCreated = [];
  void addToQuestionsCreated(QuestionStruct item) => questionsCreated.add(item);
  void removeFromQuestionsCreated(QuestionStruct item) =>
      questionsCreated.remove(item);
  void removeAtIndexFromQuestionsCreated(int index) =>
      questionsCreated.removeAt(index);
  void insertAtIndexInQuestionsCreated(int index, QuestionStruct item) =>
      questionsCreated.insert(index, item);
  void updateQuestionsCreatedAtIndex(
          int index, Function(QuestionStruct) updateFn) =>
      questionsCreated[index] = updateFn(questionsCreated[index]);

  int iterator = 0;

  QuestionStruct? currentQuestion;
  void updateCurrentQuestionStruct(Function(QuestionStruct) updateFn) {
    updateFn(currentQuestion ??= QuestionStruct());
  }

  String questionPageText = '0/0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for quizTitle widget.
  FocusNode? quizTitleFocusNode;
  TextEditingController? quizTitleTextController;
  String? Function(BuildContext, String?)? quizTitleTextControllerValidator;
  String? _quizTitleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for subject widget.
  String? subjectValue;
  FormFieldController<String>? subjectValueController;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for questionEntry dynamic component.
  late FlutterFlowDynamicModels<QuestionEntryModel> questionEntryModels;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? existingQuizCount;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QuestionRecord? createdQuestion;
  // Model for teacherSidebar component.
  late TeacherSidebarModel teacherSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    quizTitleTextControllerValidator = _quizTitleTextControllerValidator;
    questionEntryModels = FlutterFlowDynamicModels(() => QuestionEntryModel());
    teacherSidebarModel = createModel(context, () => TeacherSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    quizTitleFocusNode?.dispose();
    quizTitleTextController?.dispose();

    questionEntryModels.dispose();
    teacherSidebarModel.dispose();
  }
}
