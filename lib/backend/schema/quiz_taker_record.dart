import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizTakerRecord extends FirestoreRecord {
  QuizTakerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizSession" field.
  DocumentReference? _quizSession;
  DocumentReference? get quizSession => _quizSession;
  bool hasQuizSession() => _quizSession != null;

  // "student" field.
  DocumentReference? _student;
  DocumentReference? get student => _student;
  bool hasStudent() => _student != null;

  // "quiz" field.
  DocumentReference? _quiz;
  DocumentReference? get quiz => _quiz;
  bool hasQuiz() => _quiz != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "doneQuestions" field.
  List<DocumentReference>? _doneQuestions;
  List<DocumentReference> get doneQuestions => _doneQuestions ?? const [];
  bool hasDoneQuestions() => _doneQuestions != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _quizSession = snapshotData['quizSession'] as DocumentReference?;
    _student = snapshotData['student'] as DocumentReference?;
    _quiz = snapshotData['quiz'] as DocumentReference?;
    _done = snapshotData['done'] as bool?;
    _doneQuestions = getDataList(snapshotData['doneQuestions']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('QuizTaker')
          : FirebaseFirestore.instance.collectionGroup('QuizTaker');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('QuizTaker').doc(id);

  static Stream<QuizTakerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizTakerRecord.fromSnapshot(s));

  static Future<QuizTakerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizTakerRecord.fromSnapshot(s));

  static QuizTakerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizTakerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizTakerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizTakerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizTakerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizTakerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizTakerRecordData({
  DocumentReference? quizSession,
  DocumentReference? student,
  DocumentReference? quiz,
  bool? done,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizSession': quizSession,
      'student': student,
      'quiz': quiz,
      'done': done,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizTakerRecordDocumentEquality implements Equality<QuizTakerRecord> {
  const QuizTakerRecordDocumentEquality();

  @override
  bool equals(QuizTakerRecord? e1, QuizTakerRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quizSession == e2?.quizSession &&
        e1?.student == e2?.student &&
        e1?.quiz == e2?.quiz &&
        e1?.done == e2?.done &&
        listEquality.equals(e1?.doneQuestions, e2?.doneQuestions);
  }

  @override
  int hash(QuizTakerRecord? e) => const ListEquality()
      .hash([e?.quizSession, e?.student, e?.quiz, e?.done, e?.doneQuestions]);

  @override
  bool isValidKey(Object? o) => o is QuizTakerRecord;
}
