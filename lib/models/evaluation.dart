import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/school_subject.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'evaluation.freezed.dart';
part 'evaluation.g.dart';

@freezed
class Evaluation with _$Evaluation {
  factory Evaluation({
    required int? id,
    required String? note,
    required SchoolSubject? subject,
    required Student? student,
    required Teacher? teacher,
  }) = _Evaluation;

  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);
}
