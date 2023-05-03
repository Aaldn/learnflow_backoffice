import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/school_subject.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'school_subject_teached.freezed.dart';
part 'school_subject_teached.g.dart';

@freezed
class SchoolSubjectTeached with _$SchoolSubjectTeached {
  factory SchoolSubjectTeached({
    required int? id,
    required int? yearsOfExperience,
    required Teacher? teacher,
    required SchoolSubject? schoolSubject,
  }) = _SchoolSubjectTeached;

  factory SchoolSubjectTeached.fromJson(Map<String, dynamic> json) =>
      _$SchoolSubjectTeachedFromJson(json);
}
