import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SchedulesRecord extends FirestoreRecord {
  SchedulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "maxStudent" field.
  int? _maxStudent;
  int get maxStudent => _maxStudent ?? 0;
  bool hasMaxStudent() => _maxStudent != null;

  // "totalDays" field.
  int? _totalDays;
  int get totalDays => _totalDays ?? 0;
  bool hasTotalDays() => _totalDays != null;

  // "topics" field.
  String? _topics;
  String get topics => _topics ?? '';
  bool hasTopics() => _topics != null;

  // "prerequisite" field.
  DocumentReference? _prerequisite;
  DocumentReference? get prerequisite => _prerequisite;
  bool hasPrerequisite() => _prerequisite != null;

  void _initializeFields() {
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _day = snapshotData['day'] as String?;
    _subject = snapshotData['subject'] as String?;
    _maxStudent = castToType<int>(snapshotData['maxStudent']);
    _totalDays = castToType<int>(snapshotData['totalDays']);
    _topics = snapshotData['topics'] as String?;
    _prerequisite = snapshotData['prerequisite'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schedules');

  static Stream<SchedulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchedulesRecord.fromSnapshot(s));

  static Future<SchedulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchedulesRecord.fromSnapshot(s));

  static SchedulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchedulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchedulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchedulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchedulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchedulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchedulesRecordData({
  DocumentReference? teacher,
  DateTime? startTime,
  DateTime? endTime,
  String? day,
  String? subject,
  int? maxStudent,
  int? totalDays,
  String? topics,
  DocumentReference? prerequisite,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher': teacher,
      'startTime': startTime,
      'endTime': endTime,
      'day': day,
      'subject': subject,
      'maxStudent': maxStudent,
      'totalDays': totalDays,
      'topics': topics,
      'prerequisite': prerequisite,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchedulesRecordDocumentEquality implements Equality<SchedulesRecord> {
  const SchedulesRecordDocumentEquality();

  @override
  bool equals(SchedulesRecord? e1, SchedulesRecord? e2) {
    return e1?.teacher == e2?.teacher &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.day == e2?.day &&
        e1?.subject == e2?.subject &&
        e1?.maxStudent == e2?.maxStudent &&
        e1?.totalDays == e2?.totalDays &&
        e1?.topics == e2?.topics &&
        e1?.prerequisite == e2?.prerequisite;
  }

  @override
  int hash(SchedulesRecord? e) => const ListEquality().hash([
        e?.teacher,
        e?.startTime,
        e?.endTime,
        e?.day,
        e?.subject,
        e?.maxStudent,
        e?.totalDays,
        e?.topics,
        e?.prerequisite
      ]);

  @override
  bool isValidKey(Object? o) => o is SchedulesRecord;
}
