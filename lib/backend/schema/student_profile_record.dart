import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentProfileRecord extends FirestoreRecord {
  StudentProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('studentProfile')
          : FirebaseFirestore.instance.collectionGroup('studentProfile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('studentProfile').doc(id);

  static Stream<StudentProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentProfileRecord.fromSnapshot(s));

  static Future<StudentProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentProfileRecord.fromSnapshot(s));

  static StudentProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentProfileRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentProfileRecordDocumentEquality
    implements Equality<StudentProfileRecord> {
  const StudentProfileRecordDocumentEquality();

  @override
  bool equals(StudentProfileRecord? e1, StudentProfileRecord? e2) {
    return e1?.user == e2?.user;
  }

  @override
  int hash(StudentProfileRecord? e) => const ListEquality().hash([e?.user]);

  @override
  bool isValidKey(Object? o) => o is StudentProfileRecord;
}
