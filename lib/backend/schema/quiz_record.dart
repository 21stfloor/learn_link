import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "questions" field.
  List<DocumentReference>? _questions;
  List<DocumentReference> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "passingScore" field.
  double? _passingScore;
  double get passingScore => _passingScore ?? 0.0;
  bool hasPassingScore() => _passingScore != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _questions = getDataList(snapshotData['questions']);
    _subject = snapshotData['subject'] as String?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _passingScore = castToType<double>(snapshotData['passingScore']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? name,
  String? subject,
  DateTime? updatedAt,
  DateTime? createdAt,
  DocumentReference? createdBy,
  double? passingScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'subject': subject,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'passingScore': passingScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.subject == e2?.subject &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.passingScore == e2?.passingScore;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality().hash([
        e?.name,
        e?.questions,
        e?.subject,
        e?.updatedAt,
        e?.createdAt,
        e?.createdBy,
        e?.passingScore
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
