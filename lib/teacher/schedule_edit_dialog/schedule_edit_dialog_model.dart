import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'schedule_edit_dialog_widget.dart' show ScheduleEditDialogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScheduleEditDialogModel
    extends FlutterFlowModel<ScheduleEditDialogWidget> {
  ///  Local state fields for this component.

  DateTime? selectedStart;

  DateTime? selectedEnd;

  int iterator = 0;

  bool hasConflict = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for topic widget.
  FocusNode? topicFocusNode;
  TextEditingController? topicTextController;
  String? Function(BuildContext, String?)? topicTextControllerValidator;
  String? _topicTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for subject widget.
  String? subjectValue;
  FormFieldController<String>? subjectValueController;
  // State field(s) for day widget.
  String? dayValue;
  FormFieldController<String>? dayValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for maxStudent widget.
  int? maxStudentValue;
  // State field(s) for totalDays widget.
  int? totalDaysValue;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SchedulesRecord>? possibleConflictsSchedules;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SchedulesRecord? createdSchedule;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SessionsRecord? createdSession;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? createdChatRef;

  @override
  void initState(BuildContext context) {
    topicTextControllerValidator = _topicTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
  }

  @override
  void dispose() {
    topicFocusNode?.dispose();
    topicTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();
  }
}
