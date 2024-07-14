import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future checkSubscription(BuildContext context) async {
  SubscriptionsRecord? latestSubscription;

  latestSubscription = await querySubscriptionsRecordOnce(
    queryBuilder: (subscriptionsRecord) => subscriptionsRecord
        .where(
          'user',
          isEqualTo: currentUserReference,
        )
        .orderBy('date', descending: true),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (latestSubscription != null) {
    if (latestSubscription!.expiryDate! > getCurrentTimestamp) {
      FFAppState().subscribed = true;
      FFAppState().update(() {});
      return;
    } else {
      return;
    }
  } else {
    FFAppState().subscribed = false;
    FFAppState().update(() {});
  }
}
