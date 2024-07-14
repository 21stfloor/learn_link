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

bool checkAnnuallyExpired(DateTime datePaid) {
  DateTime now = DateTime.now();

  // Calculate the date 12 months ago
  int newYear = now.year;
  int newMonth = now.month - 12;
  if (newMonth <= 0) {
    newYear -= 1;
    newMonth += 12;
  }
  DateTime twelveMonthsAgo = DateTime(newYear, newMonth, now.day);

  return datePaid.isBefore(twelveMonthsAgo);
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

bool checkMonthlyExpired(DateTime datePaid) {
  DateTime now = DateTime.now();

  // Calculate the date 1 month ago
  int newYear = now.year;
  int newMonth = now.month - 1;
  if (newMonth <= 0) {
    newYear -= 1;
    newMonth += 12;
  }
  DateTime oneMonthAgo = DateTime(newYear, newMonth, now.day);

  return datePaid.isBefore(oneMonthAgo);
}

DateTime addTwelveMonths(DateTime date) {
  // Create a new DateTime object with the same year and month but 12 months ahead
  DateTime newDate = DateTime(date.year, date.month + 12, date.day);

  // If the day of the new date is not valid (e.g., adding 12 months to January 31st could result in a date like February 31st)
  // adjust it to the last valid day of the month
  if (newDate.month != ((date.month + 12) % 12)) {
    // Move to the last day of the month
    newDate = DateTime(newDate.year, newDate.month + 1, 0);
  }

  return newDate;
}

DateTime addOneMonth(DateTime date) {
  // Calculate the new month and year
  int newMonth = date.month + 1;
  int newYear = date.year;

  // Adjust year and month if newMonth exceeds 12
  if (newMonth > 12) {
    newMonth = 1;
    newYear++;
  }

  // Create a new DateTime object with the calculated year and month
  DateTime newDate = DateTime(newYear, newMonth, date.day);

  // If the new date is invalid (e.g., adding one month to January 31st), adjust it to the last valid day of the month
  if (newDate.month != newMonth) {
    // Move to the last day of the previous month
    newDate = DateTime(newYear, newMonth + 1, 0);
  }

  return newDate;
}
