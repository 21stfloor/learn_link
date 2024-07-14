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
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookSessionModel extends FlutterFlowModel<BookSessionWidget> {
  ///  Local state fields for this component.

  SchedulesRecord? selectedSchedule;

  List<DocumentReference> existingScheduleList = [];
  void addToExistingScheduleList(DocumentReference item) =>
      existingScheduleList.add(item);
  void removeFromExistingScheduleList(DocumentReference item) =>
      existingScheduleList.remove(item);
  void removeAtIndexFromExistingScheduleList(int index) =>
      existingScheduleList.removeAt(index);
  void insertAtIndexInExistingScheduleList(int index, DocumentReference item) =>
      existingScheduleList.insert(index, item);
  void updateExistingScheduleListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      existingScheduleList[index] = updateFn(existingScheduleList[index]);

  List<SchedulesRecord> schedulesToShow = [];
  void addToSchedulesToShow(SchedulesRecord item) => schedulesToShow.add(item);
  void removeFromSchedulesToShow(SchedulesRecord item) =>
      schedulesToShow.remove(item);
  void removeAtIndexFromSchedulesToShow(int index) =>
      schedulesToShow.removeAt(index);
  void insertAtIndexInSchedulesToShow(int index, SchedulesRecord item) =>
      schedulesToShow.insert(index, item);
  void updateSchedulesToShowAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      schedulesToShow[index] = updateFn(schedulesToShow[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in BookSession widget.
  List<SessionRequestsRecord>? existingSessionRequests;
  // State field(s) for subject widget.
  String? subjectValue;
  FormFieldController<String>? subjectValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in subject widget.
  List<SchedulesRecord>? scheduleResults;
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
