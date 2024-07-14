import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/common/drawer_toggle/drawer_toggle_widget.dart';
import '/components/subscription_required_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/teacher/attendance_grade_sheet/attendance_grade_sheet_widget.dart';
import '/teacher/teacher_sidebar/teacher_sidebar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'teacher_attendance_page_model.dart';
export 'teacher_attendance_page_model.dart';

class TeacherAttendancePageWidget extends StatefulWidget {
  const TeacherAttendancePageWidget({super.key});

  @override
  State<TeacherAttendancePageWidget> createState() =>
      _TeacherAttendancePageWidgetState();
}

class _TeacherAttendancePageWidgetState
    extends State<TeacherAttendancePageWidget> {
  late TeacherAttendancePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeacherAttendancePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.existingTeacherProfile = await queryTeacherProfileRecordOnce(
        parent: currentUserReference,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.existingTeacherProfile?.reference == null) {
        context.goNamed('auth_2_createTeacherProfile');
      } else {
        _model.mySchedules = await querySchedulesRecordOnce(
          queryBuilder: (schedulesRecord) => schedulesRecord.where(
            'teacher',
            isEqualTo: currentUserReference,
          ),
        );
        _model.scheduleToView =
            _model.mySchedules!.toList().cast<SchedulesRecord>();
        _model.currentSchedule = _model.mySchedules?.first;
        setState(() {});
        _model.selectedSession = await querySessionsRecordOnce(
          queryBuilder: (sessionsRecord) => sessionsRecord.where(
            'schedule',
            isEqualTo: _model.currentSchedule?.reference,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.currentSessionSelected = _model.selectedSession;
        setState(() {});
        _model.iterator = 0;
        _model.filteredStudentResult = [];
        setState(() {});
        while (
            _model.iterator < _model.currentSessionSelected!.students.length) {
          _model.student = await UsersRecord.getDocumentOnce(
              _model.currentSessionSelected!.students[_model.iterator]);
          _model.addToFilteredStudentResult(_model.student!);
          _model.iterator = _model.iterator + 1;
          setState(() {});
        }
      }
    });

    _model.searchBoxTextController ??= TextEditingController();
    _model.searchBoxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.teacherSidebarModel,
            updateCallback: () => setState(() {}),
            child: TeacherSidebarWidget(),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                wrapWithModel(
                  model: _model.drawerToggleModel,
                  updateCallback: () => setState(() {}),
                  child: DrawerToggleWidget(),
                ),
              Expanded(
                flex: 9,
                child: Builder(
                  builder: (context) {
                    if (FFAppState().subscribed) {
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if ((_model.scheduleToView.isNotEmpty) == true) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Attendance & Grade Page',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final scheduleRows =
                                              _model.scheduleToView.toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  scheduleRows.length,
                                                  (scheduleRowsIndex) {
                                                final scheduleRowsItem =
                                                    scheduleRows[
                                                        scheduleRowsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.newSelectedSession =
                                                        await querySessionsRecordOnce(
                                                      queryBuilder:
                                                          (sessionsRecord) =>
                                                              sessionsRecord
                                                                  .where(
                                                        'schedule',
                                                        isEqualTo:
                                                            scheduleRowsItem
                                                                .reference,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    _model.currentSchedule =
                                                        scheduleRowsItem;
                                                    _model.currentSessionSelected =
                                                        _model
                                                            .newSelectedSession;
                                                    setState(() {});
                                                    _model.iterator = 0;
                                                    _model.filteredStudentResult =
                                                        [];
                                                    setState(() {});
                                                    while (_model.iterator <
                                                        _model
                                                            .currentSessionSelected!
                                                            .students
                                                            .length) {
                                                      _model.studentOnLoad =
                                                          await UsersRecord
                                                              .getDocumentOnce(_model
                                                                      .currentSessionSelected!
                                                                      .students[
                                                                  _model
                                                                      .iterator]);
                                                      _model.addToFilteredStudentResult(
                                                          _model
                                                              .studentOnLoad!);
                                                      _model.iterator =
                                                          _model.iterator + 1;
                                                      setState(() {});
                                                    }

                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      scheduleRowsItem.topics,
                                                      'unamed schedule',
                                                    ),
                                                    maxLines: 1,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: scheduleRowsItem
                                                                          .topics ==
                                                                      _model.currentSchedule
                                                                          ?.topics
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                            ),
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 14.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Spacer(flex: 2),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .searchBoxTextController,
                                                    focusNode: _model
                                                        .searchBoxFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.searchBoxTextController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () => setState(() {}),
                                                    ),
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      var _shouldSetState =
                                                          false;
                                                      _model.iterator = 0;
                                                      _model.tempStudentList =
                                                          [];
                                                      _model.filteredStudentResult =
                                                          [];
                                                      setState(() {});
                                                      while (_model.iterator <
                                                          _model
                                                              .currentSessionSelected!
                                                              .students
                                                              .length) {
                                                        _model.studentSingle =
                                                            await UsersRecord
                                                                .getDocumentOnce(_model
                                                                        .currentSessionSelected!
                                                                        .students[
                                                                    _model
                                                                        .iterator]);
                                                        _shouldSetState = true;
                                                        _model.addToTempStudentList(
                                                            _model
                                                                .studentSingle!);
                                                        _model.iterator =
                                                            _model.iterator + 1;
                                                        setState(() {});
                                                      }
                                                      if (_model.searchBoxTextController
                                                                  .text ==
                                                              null ||
                                                          _model.searchBoxTextController
                                                                  .text ==
                                                              '') {
                                                        _model.filteredStudentResult =
                                                            _model
                                                                .tempStudentList
                                                                .toList()
                                                                .cast<
                                                                    UsersRecord>();
                                                        setState(() {});
                                                      } else {
                                                        safeSetState(() {
                                                          _model.simpleSearchResults =
                                                              TextSearch(
                                                            _model
                                                                .tempStudentList
                                                                .map(
                                                                  (record) => TextSearchItem
                                                                      .fromTerms(
                                                                          record,
                                                                          [
                                                                        record
                                                                            .displayName!,
                                                                        record
                                                                            .firstName!,
                                                                        record
                                                                            .lastName!
                                                                      ]),
                                                                )
                                                                .toList(),
                                                          )
                                                                  .search(_model
                                                                      .searchBoxTextController
                                                                      .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList();
                                                          ;
                                                        });
                                                        _model.filteredStudentResult = _model
                                                            .simpleSearchResults
                                                            .toList()
                                                            .cast<
                                                                UsersRecord>();
                                                        setState(() {});
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Search...',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      suffixIcon: _model
                                                              .searchBoxTextController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .searchBoxTextController
                                                                    ?.clear();
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 32.0,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    validator: _model
                                                        .searchBoxTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 1170.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                1.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(8.0),
                                                    topRight:
                                                        Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'Student',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'Days total',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'Actions',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 9,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final studentRows = _model
                                                        .filteredStudentResult
                                                        .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          studentRows.length,
                                                      itemBuilder: (context,
                                                          studentRowsIndex) {
                                                        final studentRowsItem =
                                                            studentRows[
                                                                studentRowsIndex];
                                                        return StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  studentRowsItem
                                                                      .reference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }

                                                            final containerUsersRecord =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 65.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      containerUsersRecord
                                                                          .displayName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        FutureBuilder<
                                                                            int>(
                                                                      future:
                                                                          queryAttendanceRecordCount(
                                                                        queryBuilder: (attendanceRecord) => attendanceRecord
                                                                            .where(
                                                                              'student',
                                                                              isEqualTo: containerUsersRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'schedule',
                                                                              isEqualTo: _model.currentSchedule?.reference,
                                                                            ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        int textCount =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            textCount.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            GradeRecord>>(
                                                                      stream:
                                                                          queryGradeRecord(
                                                                        queryBuilder: (gradeRecord) => gradeRecord
                                                                            .where(
                                                                              'student',
                                                                              isEqualTo: containerUsersRecord.reference,
                                                                            )
                                                                            .where(
                                                                              'lesson',
                                                                              isEqualTo: _model.currentSchedule?.reference,
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<GradeRecord>
                                                                            rowGradeRecordList =
                                                                            snapshot.data!;

                                                                        final rowGradeRecord = rowGradeRecordList.isNotEmpty
                                                                            ? rowGradeRecordList.first
                                                                            : null;
                                                                        return Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: FlutterFlowTheme.of(context).primary,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              fillColor: FlutterFlowTheme.of(context).accent1,
                                                                              icon: Icon(
                                                                                Icons.edit,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: AttendanceGradeSheetWidget(
                                                                                          student: containerUsersRecord,
                                                                                          schedule: _model.currentSchedule!,
                                                                                          grade: rowGradeRecord,
                                                                                          session: _model.currentSessionSelected!.reference,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.schedule_sharp,
                                    color: Color(0xFF606A85),
                                    size: 72.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'No Schedules Yet',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF15161E),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      'You will be able to encode attendance once you have a schedule',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF606A85),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context
                                          .pushNamed('teacherMySchedulesPage');
                                    },
                                    text: 'Go to Schedules',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.subscriptionRequiredModel,
                          updateCallback: () => setState(() {}),
                          child: SubscriptionRequiredWidget(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
