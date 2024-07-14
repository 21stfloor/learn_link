import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionMilestoneRecord extends FirestoreRecord {
  SessionMilestoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "done" field.
  bool? _done;
  bool get done => _done ?? false;
  bool hasDone() => _done != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _done = snapshotData['done'] as bool?;
    _order = castToType<int>(snapshotData['order']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sessionMilestone')
          : FirebaseFirestore.instance.collectionGroup('sessionMilestone');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sessionMilestone').doc(id);

  static Stream<SessionMilestoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionMilestoneRecord.fromSnapshot(s));

  static Future<SessionMilestoneRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SessionMilestoneRecord.fromSnapshot(s));

  static SessionMilestoneRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionMilestoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionMilestoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionMilestoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionMilestoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionMilestoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionMilestoneRecordData({
  String? name,
  bool? done,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'done': done,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionMilestoneRecordDocumentEquality
    implements Equality<SessionMilestoneRecord> {
  const SessionMilestoneRecordDocumentEquality();

  @override
  bool equals(SessionMilestoneRecord? e1, SessionMilestoneRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.done == e2?.done &&
        e1?.order == e2?.order;
  }

  @override
  int hash(SessionMilestoneRecord? e) =>
      const ListEquality().hash([e?.name, e?.done, e?.order]);

  @override
  bool isValidKey(Object? o) => o is SessionMilestoneRecord;
}
