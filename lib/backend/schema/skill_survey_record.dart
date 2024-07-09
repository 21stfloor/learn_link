import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillSurveyRecord extends FirestoreRecord {
  SkillSurveyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _subject = snapshotData['subject'] as String?;
    _score = castToType<int>(snapshotData['score']);
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('skillSurvey');

  static Stream<SkillSurveyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SkillSurveyRecord.fromSnapshot(s));

  static Future<SkillSurveyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SkillSurveyRecord.fromSnapshot(s));

  static SkillSurveyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SkillSurveyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SkillSurveyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SkillSurveyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SkillSurveyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SkillSurveyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSkillSurveyRecordData({
  DocumentReference? user,
  String? subject,
  int? score,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'subject': subject,
      'score': score,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class SkillSurveyRecordDocumentEquality implements Equality<SkillSurveyRecord> {
  const SkillSurveyRecordDocumentEquality();

  @override
  bool equals(SkillSurveyRecord? e1, SkillSurveyRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.subject == e2?.subject &&
        e1?.score == e2?.score &&
        e1?.date == e2?.date;
  }

  @override
  int hash(SkillSurveyRecord? e) =>
      const ListEquality().hash([e?.user, e?.subject, e?.score, e?.date]);

  @override
  bool isValidKey(Object? o) => o is SkillSurveyRecord;
}
