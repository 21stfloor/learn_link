import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/subscription_payment_select_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'session_entry_widget.dart' show SessionEntryWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionEntryModel extends FlutterFlowModel<SessionEntryWidget> {
  ///  Local state fields for this component.

  bool videoCallStatus = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatsRecord? existingChatRef;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? createdChatRef;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
