import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSessionRecord extends FirestoreRecord {
  QuizSessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dateStarted" field.
  DateTime? _dateStarted;
  DateTime? get dateStarted => _dateStarted;
  bool hasDateStarted() => _dateStarted != null;

  // "dateStopped" field.
  DateTime? _dateStopped;
  DateTime? get dateStopped => _dateStopped;
  bool hasDateStopped() => _dateStopped != null;

  // "studentsCount" field.
  int? _studentsCount;
  int get studentsCount => _studentsCount ?? 0;
  bool hasStudentsCount() => _studentsCount != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "session" field.
  DocumentReference? _session;
  DocumentReference? get session => _session;
  bool hasSession() => _session != null;

  void _initializeFields() {
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _dateStarted = snapshotData['dateStarted'] as DateTime?;
    _dateStopped = snapshotData['dateStopped'] as DateTime?;
    _studentsCount = castToType<int>(snapshotData['studentsCount']);
    _subject = snapshotData['subject'] as String?;
    _session = snapshotData['session'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QuizSession');

  static Stream<QuizSessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSessionRecord.fromSnapshot(s));

  static Future<QuizSessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSessionRecord.fromSnapshot(s));

  static QuizSessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizSessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizSessionRecordData({
  DocumentReference? quiz,
  String? status,
  DateTime? dateStarted,
  DateTime? dateStopped,
  int? studentsCount,
  String? subject,
  DocumentReference? session,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz': quiz,
      'status': status,
      'dateStarted': dateStarted,
      'dateStopped': dateStopped,
      'studentsCount': studentsCount,
      'subject': subject,
      'session': session,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizSessionRecordDocumentEquality implements Equality<QuizSessionRecord> {
  const QuizSessionRecordDocumentEquality();

  @override
  bool equals(QuizSessionRecord? e1, QuizSessionRecord? e2) {
    return e1?.quiz == e2?.quiz &&
        e1?.status == e2?.status &&
        e1?.dateStarted == e2?.dateStarted &&
        e1?.dateStopped == e2?.dateStopped &&
        e1?.studentsCount == e2?.studentsCount &&
        e1?.subject == e2?.subject &&
        e1?.session == e2?.session;
  }

  @override
  int hash(QuizSessionRecord? e) => const ListEquality().hash([
        e?.quiz,
        e?.status,
        e?.dateStarted,
        e?.dateStopped,
        e?.studentsCount,
        e?.subject,
        e?.session
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizSessionRecord;
}
