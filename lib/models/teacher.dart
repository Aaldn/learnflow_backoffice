import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/address.dart';
import 'package:learnflow_backoffice/models/document.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher {
  factory Teacher({
    @JsonKey(name: '_id') required String? id,
    required String? firstName,
    required String? lastName,
    required DateTime? birthdate,
    required String? email,
    required String? phoneNumber,
    required String? profilePictureUrl,
    required bool? isValidated,
    required Address? address,
    required List<Document>? documents,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
