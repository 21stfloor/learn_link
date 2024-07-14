// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillSurveyStruct extends FFFirebaseStruct {
  SkillSurveyStruct({
    int? score,
    String? subject,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _score = score,
        _subject = subject,
        super(firestoreUtilData);

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  static SkillSurveyStruct fromMap(Map<String, dynamic> data) =>
      SkillSurveyStruct(
        score: castToType<int>(data['score']),
        subject: data['subject'] as String?,
      );

  static SkillSurveyStruct? maybeFromMap(dynamic data) => data is Map
      ? SkillSurveyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'score': _score,
        'subject': _subject,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'score': serializeParam(
          _score,
          ParamType.int,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
      }.withoutNulls;

  static SkillSurveyStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillSurveyStruct(
        score: deserializeParam(
          data['score'],
          ParamType.int,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SkillSurveyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillSurveyStruct &&
        score == other.score &&
        subject == other.subject;
  }

  @override
  int get hashCode => const ListEquality().hash([score, subject]);
}

SkillSurveyStruct createSkillSurveyStruct({
  int? score,
  String? subject,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SkillSurveyStruct(
      score: score,
      subject: subject,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SkillSurveyStruct? updateSkillSurveyStruct(
  SkillSurveyStruct? skillSurvey, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    skillSurvey
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSkillSurveyStructData(
  Map<String, dynamic> firestoreData,
  SkillSurveyStruct? skillSurvey,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (skillSurvey == null) {
    return;
  }
  if (skillSurvey.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && skillSurvey.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final skillSurveyData =
      getSkillSurveyFirestoreData(skillSurvey, forFieldValue);
  final nestedData =
      skillSurveyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = skillSurvey.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSkillSurveyFirestoreData(
  SkillSurveyStruct? skillSurvey, [
  bool forFieldValue = false,
]) {
  if (skillSurvey == null) {
    return {};
  }
  final firestoreData = mapToFirestore(skillSurvey.toMap());

  // Add any Firestore field values
  skillSurvey.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSkillSurveyListFirestoreData(
  List<SkillSurveyStruct>? skillSurveys,
) =>
    skillSurveys?.map((e) => getSkillSurveyFirestoreData(e, true)).toList() ??
    [];
