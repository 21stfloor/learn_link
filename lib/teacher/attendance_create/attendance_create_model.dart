import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'attendance_create_widget.dart' show AttendanceCreateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttendanceCreateModel extends FlutterFlowModel<AttendanceCreateWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  String? selectedMilestone = 'No milestone';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  DateTime? datePicked;
  // State field(s) for milestoneDropDown widget.
  String? milestoneDropDownValue;
  FormFieldController<String>? milestoneDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? existinAttendanceCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
