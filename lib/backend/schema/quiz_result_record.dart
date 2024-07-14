import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizResultRecord extends FirestoreRecord {
  QuizResultRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "dateTaken" field.
  DateTime? _dateTaken;
  DateTime? get dateTaken => _dateTaken;
  bool hasDateTaken() => _dateTaken != null;

  // "correctAnswers" field.
  int? _correctAnswers;
  int get correctAnswers => _correctAnswers ?? 0;
  bool hasCorrectAnswers() => _correctAnswers != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  // "totalItems" field.
  int? _totalItems;
  int get totalItems => _totalItems ?? 0;
  bool hasTotalItems() => _totalItems != null;

  // "session" field.
  DocumentReference? _session;
  DocumentReference? get session => _session;
  bool hasSession() => _session != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _dateTaken = snapshotData['dateTaken'] as DateTime?;
    _correctAnswers = castToType<int>(snapshotData['correctAnswers']);
    _score = castToType<double>(snapshotData['score']);
    _totalItems = castToType<int>(snapshotData['totalItems']);
    _session = snapshotData['session'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quizResult')
          : FirebaseFirestore.instance.collectionGroup('quizResult');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('quizResult').doc(id);

  static Stream<QuizResultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizResultRecord.fromSnapshot(s));

  static Future<QuizResultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizResultRecord.fromSnapshot(s));

  static QuizResultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizResultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizResultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizResultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizResultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizResultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizResultRecordData({
  DocumentReference? user,
  DateTime? dateTaken,
  int? correctAnswers,
  double? score,
  int? totalItems,
  DocumentReference? session,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'dateTaken': dateTaken,
      'correctAnswers': correctAnswers,
      'score': score,
      'totalItems': totalItems,
      'session': session,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizResultRecordDocumentEquality implements Equality<QuizResultRecord> {
  const QuizResultRecordDocumentEquality();

  @override
  bool equals(QuizResultRecord? e1, QuizResultRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.dateTaken == e2?.dateTaken &&
        e1?.correctAnswers == e2?.correctAnswers &&
        e1?.score == e2?.score &&
        e1?.totalItems == e2?.totalItems &&
        e1?.session == e2?.session;
  }

  @override
  int hash(QuizResultRecord? e) => const ListEquality().hash([
        e?.user,
        e?.dateTaken,
        e?.correctAnswers,
        e?.score,
        e?.totalItems,
        e?.session
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizResultRecord;
}
