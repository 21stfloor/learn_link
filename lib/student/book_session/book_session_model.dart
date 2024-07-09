import '/admin/empty_teacher_result/empty_teacher_result_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/student/teacher_select_entry/teacher_select_entry_widget.dart';
import 'book_session_widget.dart' show BookSessionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BookSessionModel extends FlutterFlowModel<BookSessionWidget> {
  ///  Local state fields for this component.

  SchedulesRecord? selectedSchedule;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for subject widget.
  String? subjectValue;
  FormFieldController<String>? subjectValueController;
  // Models for teacherSelectEntry dynamic component.
  late FlutterFlowDynamicModels<TeacherSelectEntryModel>
      teacherSelectEntryModels;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SessionsRecord? existingSession;

  @override
  void initState(BuildContext context) {
    teacherSelectEntryModels =
        FlutterFlowDynamicModels(() => TeacherSelectEntryModel());
  }

  @override
  void dispose() {
    teacherSelectEntryModels.dispose();
  }
}
