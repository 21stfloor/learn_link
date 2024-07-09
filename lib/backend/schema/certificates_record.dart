import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificatesRecord extends FirestoreRecord {
  CertificatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "certificates" field.
  List<String>? _certificates;
  List<String> get certificates => _certificates ?? const [];
  bool hasCertificates() => _certificates != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _certificates = getDataList(snapshotData['certificates']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('certificates');

  static Stream<CertificatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificatesRecord.fromSnapshot(s));

  static Future<CertificatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CertificatesRecord.fromSnapshot(s));

  static CertificatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCertificatesRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificatesRecordDocumentEquality
    implements Equality<CertificatesRecord> {
  const CertificatesRecordDocumentEquality();

  @override
  bool equals(CertificatesRecord? e1, CertificatesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.certificates, e2?.certificates);
  }

  @override
  int hash(CertificatesRecord? e) =>
      const ListEquality().hash([e?.user, e?.certificates]);

  @override
  bool isValidKey(Object? o) => o is CertificatesRecord;
}
