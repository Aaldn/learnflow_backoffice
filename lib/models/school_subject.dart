import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_subject.freezed.dart';
part 'school_subject.g.dart';

@freezed
class SchoolSubject with _$SchoolSubject {
  factory SchoolSubject({
    @JsonKey(name: '_id') required String? id,
    required String? name,
  }) = _SchoolSubject;

  factory SchoolSubject.fromJson(Map<String, dynamic> json) =>
      _$SchoolSubjectFromJson(json);
}
