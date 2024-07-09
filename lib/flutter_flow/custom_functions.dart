import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isFirstTimeBeforeOrEqualSecondTime(
  DateTime firstDate,
  DateTime secondDate,
) {
  int firstTimeInSeconds =
      firstDate.hour * 3600 + firstDate.minute * 60 + firstDate.second;
  int secondTimeInSeconds =
      secondDate.hour * 3600 + secondDate.minute * 60 + secondDate.second;

  return firstTimeInSeconds <= secondTimeInSeconds;
}

bool isFirstTimePastOrEqualSecondTime(
  DateTime firstDate,
  DateTime secondDate,
) {
  int firstTimeInSeconds =
      firstDate.hour * 3600 + firstDate.minute * 60 + firstDate.second;
  int secondTimeInSeconds =
      secondDate.hour * 3600 + secondDate.minute * 60 + secondDate.second;

  return firstTimeInSeconds >= secondTimeInSeconds;
}

bool isTimeBetween(
  DateTime startDate,
  DateTime checkDate,
  DateTime endDate,
) {
  int startTimeInSeconds =
      startDate.hour * 3600 + startDate.minute * 60 + startDate.second;
  int checkTimeInSeconds =
      checkDate.hour * 3600 + checkDate.minute * 60 + checkDate.second;
  int endTimeInSeconds =
      endDate.hour * 3600 + endDate.minute * 60 + endDate.second;

  return startTimeInSeconds <= checkTimeInSeconds &&
      checkTimeInSeconds <= endTimeInSeconds;
}
