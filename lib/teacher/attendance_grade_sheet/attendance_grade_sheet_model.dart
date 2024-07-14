import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/attendance_create/attendance_create_widget.dart';
import 'attendance_grade_sheet_widget.dart' show AttendanceGradeSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttendanceGradeSheetModel
    extends FlutterFlowModel<AttendanceGradeSheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for grade widget.
  FocusNode? gradeFocusNode;
  TextEditingController? gradeTextController;
  String? Function(BuildContext, String?)? gradeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    gradeFocusNode?.dispose();
    gradeTextController?.dispose();
  }
}
