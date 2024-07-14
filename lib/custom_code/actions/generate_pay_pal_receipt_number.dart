// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

String generatePayPalReceiptNumber() {
  // Define the length of the receipt number
  const int receiptNumberLength = 16;

  // List of characters allowed in the receipt number
  final List<String> characters = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  // Create a random number generator
  final Random random = Random();

  // String buffer to store the generated receipt number
  StringBuffer receiptNumber = StringBuffer();

  // Loop to generate the receipt number characters
  for (int i = 0; i < receiptNumberLength; i++) {
    final int index = random.nextInt(characters.length);
    receiptNumber.write(characters[index]);
  }

  return receiptNumber.toString();
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
