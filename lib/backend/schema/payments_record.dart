import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "receiptNo" field.
  String? _receiptNo;
  String get receiptNo => _receiptNo ?? '';
  bool hasReceiptNo() => _receiptNo != null;

  // "schedule" field.
  DocumentReference? _schedule;
  DocumentReference? get schedule => _schedule;
  bool hasSchedule() => _schedule != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _paymentMethod = snapshotData['payment_method'] as String?;
    _status = snapshotData['status'] as String?;
    _receiptNo = snapshotData['receiptNo'] as String?;
    _schedule = snapshotData['schedule'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? user,
  double? amount,
  DateTime? paymentDate,
  String? paymentMethod,
  String? status,
  String? receiptNo,
  DocumentReference? schedule,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'amount': amount,
      'payment_date': paymentDate,
      'payment_method': paymentMethod,
      'status': status,
      'receiptNo': receiptNo,
      'schedule': schedule,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.amount == e2?.amount &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.status == e2?.status &&
        e1?.receiptNo == e2?.receiptNo &&
        e1?.schedule == e2?.schedule;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.user,
        e?.amount,
        e?.paymentDate,
        e?.paymentMethod,
        e?.status,
        e?.receiptNo,
        e?.schedule
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
