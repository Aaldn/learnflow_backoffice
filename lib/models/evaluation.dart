import 'package:freezed_annotation/freezed_annotation.dart';

part 'evaluation.freezed.dart';
part 'evaluation.g.dart';

@freezed
class Evaluation with _$Evaluation {
  factory Evaluation({
    required int? id,
    required String? subject,
    required String? note,
  }) = _Evaluation;

  factory Evaluation.fromJson(Map<String, dynamic> json) =>
      _$EvaluationFromJson(json);
}
