import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'option_view_only_model.dart';
export 'option_view_only_model.dart';

class OptionViewOnlyWidget extends StatefulWidget {
  const OptionViewOnlyWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final int? parameter2;

  @override
  State<OptionViewOnlyWidget> createState() => _OptionViewOnlyWidgetState();
}

class _OptionViewOnlyWidgetState extends State<OptionViewOnlyWidget> {
  late OptionViewOnlyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionViewOnlyModel());

    _model.textController ??= TextEditingController(text: widget.parameter1);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      autofocus: false,
      readOnly: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Option ${widget.parameter2?.toString()}',
        hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
              fontFamily: 'Readex Pro',
              letterSpacing: 0.0,
            ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 32.0, 20.0, 12.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            letterSpacing: 0.0,
          ),
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
