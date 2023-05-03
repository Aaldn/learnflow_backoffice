import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher {
  factory Teacher({
    required int? id,
    required String? firstName,
    required String? lastName,
    required DateTime? birthday,
    required String? email,
    required String? address,
    required String? zipCode,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required List<String>? degrees,
    required List<String>? identityCard,
    required bool? isValidated,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
