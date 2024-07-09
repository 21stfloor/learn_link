import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeacherProfileRecord extends FirestoreRecord {
  TeacherProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "ratePerHour" field.
  double? _ratePerHour;
  double get ratePerHour => _ratePerHour ?? 0.0;
  bool hasRatePerHour() => _ratePerHour != null;

  // "ratePerHourF2F" field.
  double? _ratePerHourF2F;
  double get ratePerHourF2F => _ratePerHourF2F ?? 0.0;
  bool hasRatePerHourF2F() => _ratePerHourF2F != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _subjects = getDataList(snapshotData['subjects']);
    _bio = snapshotData['bio'] as String?;
    _ratePerHour = castToType<double>(snapshotData['ratePerHour']);
    _ratePerHourF2F = castToType<double>(snapshotData['ratePerHourF2F']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('teacherProfile')
          : FirebaseFirestore.instance.collectionGroup('teacherProfile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('teacherProfile').doc(id);

  static Stream<TeacherProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeacherProfileRecord.fromSnapshot(s));

  static Future<TeacherProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeacherProfileRecord.fromSnapshot(s));

  static TeacherProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeacherProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeacherProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeacherProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeacherProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeacherProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeacherProfileRecordData({
  DocumentReference? user,
  String? bio,
  double? ratePerHour,
  double? ratePerHourF2F,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'bio': bio,
      'ratePerHour': ratePerHour,
      'ratePerHourF2F': ratePerHourF2F,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeacherProfileRecordDocumentEquality
    implements Equality<TeacherProfileRecord> {
  const TeacherProfileRecordDocumentEquality();

  @override
  bool equals(TeacherProfileRecord? e1, TeacherProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.bio == e2?.bio &&
        e1?.ratePerHour == e2?.ratePerHour &&
        e1?.ratePerHourF2F == e2?.ratePerHourF2F;
  }

  @override
  int hash(TeacherProfileRecord? e) => const ListEquality()
      .hash([e?.user, e?.subjects, e?.bio, e?.ratePerHour, e?.ratePerHourF2F]);

  @override
  bool isValidKey(Object? o) => o is TeacherProfileRecord;
}
