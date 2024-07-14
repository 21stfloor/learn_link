import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'milestone_list_widget.dart' show MilestoneListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MilestoneListModel extends FlutterFlowModel<MilestoneListWidget> {
  ///  Local state fields for this component.

  bool creatingNew = false;

  int iterator = 0;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for newMilestone widget.
  FocusNode? newMilestoneFocusNode;
  TextEditingController? newMilestoneTextController;
  String? Function(BuildContext, String?)? newMilestoneTextControllerValidator;
  String? _newMilestoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    newMilestoneTextControllerValidator = _newMilestoneTextControllerValidator;
  }

  @override
  void dispose() {
    newMilestoneFocusNode?.dispose();
    newMilestoneTextController?.dispose();
  }
}
