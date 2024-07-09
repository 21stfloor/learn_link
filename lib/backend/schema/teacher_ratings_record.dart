import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeacherRatingsRecord extends FirestoreRecord {
  TeacherRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teacherRatings');

  static Stream<TeacherRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeacherRatingsRecord.fromSnapshot(s));

  static Future<TeacherRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeacherRatingsRecord.fromSnapshot(s));

  static TeacherRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeacherRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeacherRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeacherRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeacherRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeacherRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeacherRatingsRecordData({
  DocumentReference? teacher,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'teacher': teacher,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeacherRatingsRecordDocumentEquality
    implements Equality<TeacherRatingsRecord> {
  const TeacherRatingsRecordDocumentEquality();

  @override
  bool equals(TeacherRatingsRecord? e1, TeacherRatingsRecord? e2) {
    return e1?.teacher == e2?.teacher && e1?.rating == e2?.rating;
  }

  @override
  int hash(TeacherRatingsRecord? e) =>
      const ListEquality().hash([e?.teacher, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is TeacherRatingsRecord;
}
