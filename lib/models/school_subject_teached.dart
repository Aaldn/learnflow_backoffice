import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_subject_teached.freezed.dart';
part 'school_subject_teached.g.dart';

@freezed
class SchoolSubjectTeached with _$SchoolSubjectTeached {
  factory SchoolSubjectTeached({
    required int? id,
    required int? yearsOfExperience,
  }) = _SchoolSubjectTeached;

  factory SchoolSubjectTeached.fromJson(Map<String, dynamic> json) =>
      _$SchoolSubjectTeachedFromJson(json);
}
