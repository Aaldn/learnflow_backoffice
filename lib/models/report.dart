import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/moderator.dart';
import 'package:learnflow_backoffice/models/report_type.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  factory Report({
    required int? id,
    required DateTime? date,
    required String? reason,
    required String? detail,
    required ReportType? reportType,
    required Student? student,
    required Moderator? moderator,
    required Teacher? teacher,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
