import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const String userTypeAdmin = 'admin';
  static const String userTypeTeacher = 'teacher';
  static const String userTypeStudent = 'student';
  static const List<String> genders = ['Male', 'Female', 'Other'];
  static const List<String> adminEmails = ['admin@learn.com'];
  static const String defaultProfilePic =
      'https://firebasestorage.googleapis.com/v0/b/learn-link-el7ijg.appspot.com/o/profile-user_64572.png?alt=media&token=89e05ad0-a7f8-48ce-8ba9-02cbd71f13d1';
  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  static const String sessionRequestStatusPending = 'pending';
  static const String sessionRequestStatusReject = 'rejected';
  static const String sessionRequestStatusApproved = 'approved';
  static const String statusOngoing = 'ongoing';
  static const String statusOver = 'over';
  static const String statusNotStarted = 'Not yet started';
  static const List<Color> colors = [
    Color(4281775359),
    Color(4279884682),
    Color(4294943024),
    Color(4294924643),
    Color(1308598576)
  ];
  static const String quizStatusOngoing = 'ongoing';
  static const String quizStatusStopped = 'stopped';
  static const double defaultSubscriptionPrice = 300.0;
  static const String payDurationMonth = 'Monthly';
  static const String payDurationAnnually = 'Annually';
  static const String paymentMethodPaypal = 'Paypal';
  static const String paymentMethodCard = 'Card';
  static const int maxFailedLoginAttempt = 3;
  static const String done = 'done';
  static const String refunded = 'refunded';
}
