import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GradeRecord extends FirestoreRecord {
  GradeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "lesson" field.
  DocumentReference? _lesson;
  DocumentReference? get lesson => _lesson;
  bool hasLesson() => _lesson != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  void _initializeFields() {
    _student = snapshotData['student'] as DocumentReference?;
    _subject = snapshotData['subject'] as String?;
    _lesson = snapshotData['lesson'] as DocumentReference?;
    _score = castToType<double>(snapshotData['score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('grade');

  static Stream<GradeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GradeRecord.fromSnapshot(s));

  static Future<GradeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GradeRecord.fromSnapshot(s));

  static GradeRecord fromSnapshot(DocumentSnapshot snapshot) => GradeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GradeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GradeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GradeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GradeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGradeRecordData({
  DocumentReference? student,
  String? subject,
  DocumentReference? lesson,
  double? score,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'student': student,
      'subject': subject,
      'lesson': lesson,
      'score': score,
    }.withoutNulls,
  );

  return firestoreData;
}

class GradeRecordDocumentEquality implements Equality<GradeRecord> {
  const GradeRecordDocumentEquality();

  @override
  bool equals(GradeRecord? e1, GradeRecord? e2) {
    return e1?.student == e2?.student &&
        e1?.subject == e2?.subject &&
        e1?.lesson == e2?.lesson &&
        e1?.score == e2?.score;
  }

  @override
  int hash(GradeRecord? e) =>
      const ListEquality().hash([e?.student, e?.subject, e?.lesson, e?.score]);

  @override
  bool isValidKey(Object? o) => o is GradeRecord;
}
