import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RefundRecord extends FirestoreRecord {
  RefundRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "teacher" field.
  DocumentReference? _teacher;
  DocumentReference? get teacher => _teacher;
  bool hasTeacher() => _teacher != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reason = snapshotData['reason'] as String?;
    _status = snapshotData['status'] as String?;
    _teacher = snapshotData['teacher'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Refund')
          : FirebaseFirestore.instance.collectionGroup('Refund');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Refund').doc(id);

  static Stream<RefundRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RefundRecord.fromSnapshot(s));

  static Future<RefundRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RefundRecord.fromSnapshot(s));

  static RefundRecord fromSnapshot(DocumentSnapshot snapshot) => RefundRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RefundRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RefundRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RefundRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RefundRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRefundRecordData({
  String? reason,
  String? status,
  DocumentReference? teacher,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reason': reason,
      'status': status,
      'teacher': teacher,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class RefundRecordDocumentEquality implements Equality<RefundRecord> {
  const RefundRecordDocumentEquality();

  @override
  bool equals(RefundRecord? e1, RefundRecord? e2) {
    return e1?.reason == e2?.reason &&
        e1?.status == e2?.status &&
        e1?.teacher == e2?.teacher &&
        e1?.date == e2?.date;
  }

  @override
  int hash(RefundRecord? e) =>
      const ListEquality().hash([e?.reason, e?.status, e?.teacher, e?.date]);

  @override
  bool isValidKey(Object? o) => o is RefundRecord;
}
