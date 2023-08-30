import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/address.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  factory Student({
    @JsonKey(name: '_id') required String? id,
    required String? firstName,
    required String? lastName,
    required DateTime? birthdate,
    required String? email,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required String? schoolLevel,
    required Address? address, // mongodb foreign key
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
