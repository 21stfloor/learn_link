import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/subscription_payment_select_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/lesson_preview/lesson_preview_widget.dart';
import '/student/student_sidebar/student_sidebar_widget.dart';
import 'dart:math';
import '/actions/actions.dart' as action_blocks;
import 'student_dashboard_widget.dart' show StudentDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class StudentDashboardModel extends FlutterFlowModel<StudentDashboardWidget> {
  ///  Local state fields for this page.

  List<SchedulesRecord> lessonList = [];
  void addToLessonList(SchedulesRecord item) => lessonList.add(item);
  void removeFromLessonList(SchedulesRecord item) => lessonList.remove(item);
  void removeAtIndexFromLessonList(int index) => lessonList.removeAt(index);
  void insertAtIndexInLessonList(int index, SchedulesRecord item) =>
      lessonList.insert(index, item);
  void updateLessonListAtIndex(int index, Function(SchedulesRecord) updateFn) =>
      lessonList[index] = updateFn(lessonList[index]);

  List<SchedulesRecord> recommendedLessons = [];
  void addToRecommendedLessons(SchedulesRecord item) =>
      recommendedLessons.add(item);
  void removeFromRecommendedLessons(SchedulesRecord item) =>
      recommendedLessons.remove(item);
  void removeAtIndexFromRecommendedLessons(int index) =>
      recommendedLessons.removeAt(index);
  void insertAtIndexInRecommendedLessons(int index, SchedulesRecord item) =>
      recommendedLessons.insert(index, item);
  void updateRecommendedLessonsAtIndex(
          int index, Function(SchedulesRecord) updateFn) =>
      recommendedLessons[index] = updateFn(recommendedLessons[index]);

  List<String> recommendedSubjects = [];
  void addToRecommendedSubjects(String item) => recommendedSubjects.add(item);
  void removeFromRecommendedSubjects(String item) =>
      recommendedSubjects.remove(item);
  void removeAtIndexFromRecommendedSubjects(int index) =>
      recommendedSubjects.removeAt(index);
  void insertAtIndexInRecommendedSubjects(int index, String item) =>
      recommendedSubjects.insert(index, item);
  void updateRecommendedSubjectsAtIndex(int index, Function(String) updateFn) =>
      recommendedSubjects[index] = updateFn(recommendedSubjects[index]);

  List<DocumentReference> existingSchedules = [];
  void addToExistingSchedules(DocumentReference item) =>
      existingSchedules.add(item);
  void removeFromExistingSchedules(DocumentReference item) =>
      existingSchedules.remove(item);
  void removeAtIndexFromExistingSchedules(int index) =>
      existingSchedules.removeAt(index);
  void insertAtIndexInExistingSchedules(int index, DocumentReference item) =>
      existingSchedules.insert(index, item);
  void updateExistingSchedulesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      existingSchedules[index] = updateFn(existingSchedules[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in studentDashboard widget.
  StudentProfileRecord? existingStudentProfile;
  // Stores action output result for [Firestore Query - Query a collection] action in studentDashboard widget.
  List<SchedulesRecord>? initialLessons;
  // Stores action output result for [Firestore Query - Query a collection] action in studentDashboard widget.
  List<SessionRequestsRecord>? existingSessionRequests;
  // Stores action output result for [Firestore Query - Query a collection] action in studentDashboard widget.
  List<SkillSurveyRecord>? lowSubjectScores;
  // Stores action output result for [Firestore Query - Query a collection] action in studentDashboard widget.
  List<SchedulesRecord>? toRecommend;
  // Model for drawerToggle component.
  late DrawerToggleModel drawerToggleModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<SchedulesRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in TextField widget.
  List<SchedulesRecord>? allLessons;
  // Model for studentSidebar component.
  late StudentSidebarModel studentSidebarModel;

  @override
  void initState(BuildContext context) {
    drawerToggleModel = createModel(context, () => DrawerToggleModel());
    studentSidebarModel = createModel(context, () => StudentSidebarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerToggleModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    studentSidebarModel.dispose();
  }
}
