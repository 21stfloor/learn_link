import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'session_entry_model.dart';
export 'session_entry_model.dart';

class SessionEntryWidget extends StatefulWidget {
  const SessionEntryWidget({
    super.key,
    required this.session,
    this.scheduleRef,
  });

  final SessionsRecord? session;
  final DocumentReference? scheduleRef;

  @override
  State<SessionEntryWidget> createState() => _SessionEntryWidgetState();
}

class _SessionEntryWidgetState extends State<SessionEntryWidget> {
  late SessionEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SessionEntryModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.videoCallStatus = widget.session!.videoCallStatus;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
      child: StreamBuilder<SchedulesRecord>(
        stream: SchedulesRecord.getDocument(widget.scheduleRef!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
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
          final containerSchedulesRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.session!.reference.id.hashCode.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      containerSchedulesRecord.subject,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      containerSchedulesRecord.day,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      dateTimeFormat('jm', containerSchedulesRecord.startTime!),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      dateTimeFormat('jm', containerSchedulesRecord.endTime!),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      valueOrDefault<String>(
                        widget.session?.daysRemaining?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      valueOrDefault<String>(
                        widget.session?.students?.length?.toString(),
                        '0',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.double_arrow_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            _model.existingChatRef = await queryChatsRecordOnce(
                              queryBuilder: (chatsRecord) => chatsRecord.where(
                                'chatSession',
                                isEqualTo: widget.session?.reference,
                              ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (_model.existingChatRef != null) {
                              context.pushNamed(
                                'teacherInSession',
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.existingChatRef?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              var chatsRecordReference =
                                  ChatsRecord.collection.doc();
                              await chatsRecordReference.set({
                                ...createChatsRecordData(
                                  userA: currentUserReference,
                                  groupChatId:
                                      widget.session!.reference.id.hashCode,
                                  chatSession: widget.session?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'last_message_time':
                                        FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.createdChatRef =
                                  ChatsRecord.getDocumentFromData({
                                ...createChatsRecordData(
                                  userA: currentUserReference,
                                  groupChatId:
                                      widget.session!.reference.id.hashCode,
                                  chatSession: widget.session?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'last_message_time': DateTime.now(),
                                  },
                                ),
                              }, chatsRecordReference);

                              context.pushNamed(
                                'teacherInSession',
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.createdChatRef?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            setState(() {});
                          },
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(() => _model.videoCallStatus =
                                !_model.videoCallStatus);
                            _model.videoCallStatus = !_model.videoCallStatus;
                            setState(() {});

                            await widget.session!.reference
                                .update(createSessionsRecordData(
                              videoCallStatus: _model.videoCallStatus,
                            ));
                          },
                          value: _model.videoCallStatus,
                          onIcon: Icon(
                            Icons.video_chat_sharp,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.videocam_off_sharp,
                            color: FlutterFlowTheme.of(context).error,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
