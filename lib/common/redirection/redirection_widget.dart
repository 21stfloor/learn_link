import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'redirection_model.dart';
export 'redirection_model.dart';

class RedirectionWidget extends StatefulWidget {
  const RedirectionWidget({super.key});

  @override
  State<RedirectionWidget> createState() => _RedirectionWidgetState();
}

class _RedirectionWidgetState extends State<RedirectionWidget> {
  late RedirectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedirectionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      if (valueOrDefault(currentUserDocument?.role, '') ==
          FFAppConstants.userTypeStudent) {
        context.goNamed('studentMySessions');
      } else {
        if (FFAppConstants.adminEmails.contains(currentUserEmail)) {
          context.goNamed('adminTeacherList');
        } else {
          context.goNamed('teacherMySchedulesPage');
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
