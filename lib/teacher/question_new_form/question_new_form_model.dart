import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/question_option_entry/question_option_entry_widget.dart';
import 'question_new_form_widget.dart' show QuestionNewFormWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class QuestionNewFormModel extends FlutterFlowModel<QuestionNewFormWidget> {
  ///  Local state fields for this component.

  List<String> options = [];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  String? _questionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Models for questionOptionEntry dynamic component.
  late FlutterFlowDynamicModels<QuestionOptionEntryModel>
      questionOptionEntryModels;
  // State field(s) for correctAnswer widget.
  FocusNode? correctAnswerFocusNode;
  TextEditingController? correctAnswerTextController;
  String? Function(BuildContext, String?)? correctAnswerTextControllerValidator;
  String? _correctAnswerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
    questionOptionEntryModels =
        FlutterFlowDynamicModels(() => QuestionOptionEntryModel());
    correctAnswerTextControllerValidator =
        _correctAnswerTextControllerValidator;
  }

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();

    questionOptionEntryModels.dispose();
    correctAnswerFocusNode?.dispose();
    correctAnswerTextController?.dispose();
  }
}
