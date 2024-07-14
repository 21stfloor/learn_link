import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/student/student_pay_lesson/student_pay_lesson_widget.dart';
import 'lesson_preview_widget.dart' show LessonPreviewWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LessonPreviewModel extends FlutterFlowModel<LessonPreviewWidget> {
  ///  Local state fields for this component.

  List<TeacherRatingsRecord> ratings = [];
  void addToRatings(TeacherRatingsRecord item) => ratings.add(item);
  void removeFromRatings(TeacherRatingsRecord item) => ratings.remove(item);
  void removeAtIndexFromRatings(int index) => ratings.removeAt(index);
  void insertAtIndexInRatings(int index, TeacherRatingsRecord item) =>
      ratings.insert(index, item);
  void updateRatingsAtIndex(
          int index, Function(TeacherRatingsRecord) updateFn) =>
      ratings[index] = updateFn(ratings[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in lessonPreview widget.
  List<TeacherRatingsRecord>? allRatings;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? paymentResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
