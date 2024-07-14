import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "schedule" field.
  DocumentReference? _schedule;
  DocumentReference? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  // "milestoneAttended" field.
  String? _milestoneAttended;
  String get milestoneAttended => _milestoneAttended ?? '';
  bool hasMilestoneAttended() => _milestoneAttended != null;

  void _initializeFields() {
    _student = snapshotData['student'] as DocumentReference?;
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
    _schedule = snapshotData['schedule'] as DocumentReference?;
    _milestoneAttended = snapshotData['milestoneAttended'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  DocumentReference? student,
  DocumentReference? teacher,
  DateTime? date,
  DocumentReference? schedule,
  String? milestoneAttended,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student': student,
      'teacher': teacher,
      'date': date,
      'schedule': schedule,
      'milestoneAttended': milestoneAttended,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.student == e2?.student &&
        e1?.teacher == e2?.teacher &&
        e1?.date == e2?.date &&
        e1?.schedule == e2?.schedule &&
        e1?.milestoneAttended == e2?.milestoneAttended;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash(
      [e?.student, e?.teacher, e?.date, e?.schedule, e?.milestoneAttended]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
