import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeacherRatingRecord extends FirestoreRecord {
  TeacherRatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _student = snapshotData['student'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
    _comment = snapshotData['comment'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teacherRating');

  static Stream<TeacherRatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeacherRatingRecord.fromSnapshot(s));

  static Future<TeacherRatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeacherRatingRecord.fromSnapshot(s));

  static TeacherRatingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeacherRatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeacherRatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeacherRatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeacherRatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeacherRatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeacherRatingRecordData({
  DocumentReference? teacher,
  DocumentReference? student,
  int? score,
  String? comment,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher': teacher,
      'student': student,
      'score': score,
      'comment': comment,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeacherRatingRecordDocumentEquality
    implements Equality<TeacherRatingRecord> {
  const TeacherRatingRecordDocumentEquality();

  @override
  bool equals(TeacherRatingRecord? e1, TeacherRatingRecord? e2) {
    return e1?.teacher == e2?.teacher &&
        e1?.student == e2?.student &&
        e1?.score == e2?.score &&
        e1?.comment == e2?.comment &&
        e1?.date == e2?.date;
  }

  @override
  int hash(TeacherRatingRecord? e) => const ListEquality()
      .hash([e?.teacher, e?.student, e?.score, e?.comment, e?.date]);

  @override
  bool isValidKey(Object? o) => o is TeacherRatingRecord;
}
