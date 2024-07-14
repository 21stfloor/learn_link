import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MilestoneRecord extends FirestoreRecord {
  MilestoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _order = castToType<int>(snapshotData['order']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('milestone')
          : FirebaseFirestore.instance.collectionGroup('milestone');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('milestone').doc(id);

  static Stream<MilestoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MilestoneRecord.fromSnapshot(s));

  static Future<MilestoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MilestoneRecord.fromSnapshot(s));

  static MilestoneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MilestoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MilestoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MilestoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MilestoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MilestoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMilestoneRecordData({
  String? name,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class MilestoneRecordDocumentEquality implements Equality<MilestoneRecord> {
  const MilestoneRecordDocumentEquality();

  @override
  bool equals(MilestoneRecord? e1, MilestoneRecord? e2) {
    return e1?.name == e2?.name && e1?.order == e2?.order;
  }

  @override
  int hash(MilestoneRecord? e) =>
      const ListEquality().hash([e?.name, e?.order]);

  @override
  bool isValidKey(Object? o) => o is MilestoneRecord;
}
