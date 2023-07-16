import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/school_subject.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'school_subject_taught.freezed.dart';
part 'school_subject_taught.g.dart';

@freezed
class SchoolSubjectTaught with _$SchoolSubjectTaught {
  factory SchoolSubjectTaught({
    required int? id,
    required int? yearsOfExperience,
    required Teacher? teacher,
    required SchoolSubject? schoolSubject,
  }) = _SchoolSubjectTaught;

  factory SchoolSubjectTaught.fromJson(Map<String, dynamic> json) =>
      _$SchoolSubjectTaughtFromJson(json);
}
