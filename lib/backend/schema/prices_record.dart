import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricesRecord extends FirestoreRecord {
  PricesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _userType = snapshotData['userType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prices');

  static Stream<PricesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricesRecord.fromSnapshot(s));

  static Future<PricesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricesRecord.fromSnapshot(s));

  static PricesRecord fromSnapshot(DocumentSnapshot snapshot) => PricesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricesRecordData({
  double? price,
  String? userType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'userType': userType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricesRecordDocumentEquality implements Equality<PricesRecord> {
  const PricesRecordDocumentEquality();

  @override
  bool equals(PricesRecord? e1, PricesRecord? e2) {
    return e1?.price == e2?.price && e1?.userType == e2?.userType;
  }

  @override
  int hash(PricesRecord? e) =>
      const ListEquality().hash([e?.price, e?.userType]);

  @override
  bool isValidKey(Object? o) => o is PricesRecord;
}
