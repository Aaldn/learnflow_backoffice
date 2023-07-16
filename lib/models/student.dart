import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  factory Student({
    required String? firstName,
    required String? lastName,
    required DateTime? birthdate,
    required String? email,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required String? address, // mongodb foreign key
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
