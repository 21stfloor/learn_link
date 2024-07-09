import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_toggle_model.dart';
export 'drawer_toggle_model.dart';

class DrawerToggleWidget extends StatefulWidget {
  const DrawerToggleWidget({super.key});

  @override
  State<DrawerToggleWidget> createState() => _DrawerToggleWidgetState();
}

class _DrawerToggleWidgetState extends State<DrawerToggleWidget> {
  late DrawerToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerToggleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).primary,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: FlutterFlowTheme.of(context).secondary,
          icon: FaIcon(
            FontAwesomeIcons.expandAlt,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            Scaffold.of(context).openDrawer();
          },
        ),
      ],
    );
  }
}
