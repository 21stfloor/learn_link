import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionsRecord extends FirestoreRecord {
  SessionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "students" field.
  List<DocumentReference>? _students;
  List<DocumentReference> get students => _students ?? const [];
  bool hasStudents() => _students != null;

  // "daysRemaining" field.
  int? _daysRemaining;
  int get daysRemaining => _daysRemaining ?? 0;
  bool hasDaysRemaining() => _daysRemaining != null;

  // "schedule" field.
  DocumentReference? _schedule;
  DocumentReference? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "notes" field.
  List<String>? _notes;
  List<String> get notes => _notes ?? const [];
  bool hasNotes() => _notes != null;

  // "videoCallStatus" field.
  bool? _videoCallStatus;
  bool get videoCallStatus => _videoCallStatus ?? false;
  bool hasVideoCallStatus() => _videoCallStatus != null;

  void _initializeFields() {
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _students = getDataList(snapshotData['students']);
    _daysRemaining = castToType<int>(snapshotData['daysRemaining']);
    _schedule = snapshotData['schedule'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _notes = getDataList(snapshotData['notes']);
    _videoCallStatus = snapshotData['videoCallStatus'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sessions');

  static Stream<SessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionsRecord.fromSnapshot(s));

  static Future<SessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionsRecord.fromSnapshot(s));

  static SessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionsRecordData({
  DocumentReference? teacher,
  int? daysRemaining,
  DocumentReference? schedule,
  String? status,
  bool? videoCallStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher': teacher,
      'daysRemaining': daysRemaining,
      'schedule': schedule,
      'status': status,
      'videoCallStatus': videoCallStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionsRecordDocumentEquality implements Equality<SessionsRecord> {
  const SessionsRecordDocumentEquality();

  @override
  bool equals(SessionsRecord? e1, SessionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.teacher == e2?.teacher &&
        listEquality.equals(e1?.students, e2?.students) &&
        e1?.daysRemaining == e2?.daysRemaining &&
        e1?.schedule == e2?.schedule &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.notes, e2?.notes) &&
        e1?.videoCallStatus == e2?.videoCallStatus;
  }

  @override
  int hash(SessionsRecord? e) => const ListEquality().hash([
        e?.teacher,
        e?.students,
        e?.daysRemaining,
        e?.schedule,
        e?.status,
        e?.notes,
        e?.videoCallStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionsRecord;
}
