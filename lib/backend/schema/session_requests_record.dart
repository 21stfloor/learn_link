import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionRequestsRecord extends FirestoreRecord {
  SessionRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "session" field.
  DocumentReference? _session;
  DocumentReference? get session => _session;
  bool hasSession() => _session != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "schedule" field.
  DocumentReference? _schedule;
  DocumentReference? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  void _initializeFields() {
    _student = snapshotData['student'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _session = snapshotData['session'] as DocumentReference?;
    _subject = snapshotData['subject'] as String?;
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _schedule = snapshotData['schedule'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessionRequests');

  static Stream<SessionRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionRequestsRecord.fromSnapshot(s));

  static Future<SessionRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionRequestsRecord.fromSnapshot(s));

  static SessionRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionRequestsRecordData({
  DocumentReference? student,
  String? status,
  DocumentReference? session,
  String? subject,
  DocumentReference? teacher,
  DocumentReference? schedule,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student': student,
      'status': status,
      'session': session,
      'subject': subject,
      'teacher': teacher,
      'schedule': schedule,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionRequestsRecordDocumentEquality
    implements Equality<SessionRequestsRecord> {
  const SessionRequestsRecordDocumentEquality();

  @override
  bool equals(SessionRequestsRecord? e1, SessionRequestsRecord? e2) {
    return e1?.student == e2?.student &&
        e1?.status == e2?.status &&
        e1?.session == e2?.session &&
        e1?.subject == e2?.subject &&
        e1?.teacher == e2?.teacher &&
        e1?.schedule == e2?.schedule;
  }

  @override
  int hash(SessionRequestsRecord? e) => const ListEquality().hash(
      [e?.student, e?.status, e?.session, e?.subject, e?.teacher, e?.schedule]);

  @override
  bool isValidKey(Object? o) => o is SessionRequestsRecord;
}
