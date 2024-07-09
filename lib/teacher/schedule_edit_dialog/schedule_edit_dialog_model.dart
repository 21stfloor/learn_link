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
import 'package:webviewx_plus/webviewx_plus.dart';

class ScheduleEditDialogModel
    extends FlutterFlowModel<ScheduleEditDialogWidget> {
  ///  Local state fields for this component.

  DateTime? selectedStart;

  DateTime? selectedEnd;

  int iterator = 0;

  bool hasConflict = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<SchedulesRecord>? possibleConflictsSchedules;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
