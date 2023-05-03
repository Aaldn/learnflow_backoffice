import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  factory Student({
    required String? firstName,
    required String? lastName,
    required DateTime? birthday,
    required String? email,
    required String? address,
    required String? zipCode,
    required String? phoneNumber,
    required String? profilePictureUrl,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
