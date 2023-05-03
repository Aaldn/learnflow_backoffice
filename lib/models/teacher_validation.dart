import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_validation.freezed.dart';
part 'teacher_validation.g.dart';

@freezed
class TeacherValidation with _$TeacherValidation {
  factory TeacherValidation({
    required int? id,
    required DateTime? date,
    required String? isValidated,
    required String? comment,
  }) = _TeacherValidation;

  factory TeacherValidation.fromJson(Map<String, dynamic> json) =>
      _$TeacherValidationFromJson(json);
}
