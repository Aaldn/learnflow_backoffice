import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_type.freezed.dart';
part 'report_type.g.dart';

@freezed
class ReportType with _$ReportType {
  factory ReportType({
    required int? id,
    required String? name,
  }) = _ReportType;

  factory ReportType.fromJson(Map<String, dynamic> json) =>
      _$ReportTypeFromJson(json);
}
