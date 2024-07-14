import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "receiptNo" field.
  String? _receiptNo;
  String get receiptNo => _receiptNo ?? '';
  bool hasReceiptNo() => _receiptNo != null;

  // "expiryDate" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _date = snapshotData['date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _receiptNo = snapshotData['receiptNo'] as String?;
    _expiryDate = snapshotData['expiryDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  DocumentReference? user,
  String? type,
  double? price,
  DateTime? date,
  String? status,
  String? paymentMethod,
  String? receiptNo,
  DateTime? expiryDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'type': type,
      'price': price,
      'date': date,
      'status': status,
      'paymentMethod': paymentMethod,
      'receiptNo': receiptNo,
      'expiryDate': expiryDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.type == e2?.type &&
        e1?.price == e2?.price &&
        e1?.date == e2?.date &&
        e1?.status == e2?.status &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.receiptNo == e2?.receiptNo &&
        e1?.expiryDate == e2?.expiryDate;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.type,
        e?.price,
        e?.date,
        e?.status,
        e?.paymentMethod,
        e?.receiptNo,
        e?.expiryDate
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
