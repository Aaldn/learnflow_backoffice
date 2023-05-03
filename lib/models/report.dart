import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@freezed
class Report with _$Report {
  factory Report({
    required int? id,
    required DateTime? date,
    required String? reason,
    required String? detail,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
