import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher {
  factory Teacher({
    required String? firstName,
    required String? lastName,
    required String? birthday,
    required String? email,
    required String? address,
    required String? zipCode,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required String? degrees,
    required String? identityCard,
    required String? isValidated,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
