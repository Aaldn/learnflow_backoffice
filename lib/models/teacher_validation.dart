import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_validation.freezed.dart';
part 'teacher_validation.g.dart';

@freezed
class TeacherValidation with _$TeacherValidation {
  factory TeacherValidation({
    @JsonKey(name: '_id') required String? id,
    required DateTime? date,
    required bool? isValidated,
    required String? comment,
  }) = _TeacherValidation;

  factory TeacherValidation.fromJson(Map<String, dynamic> json) =>
      _$TeacherValidationFromJson(json);
}
