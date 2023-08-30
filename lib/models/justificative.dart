import 'package:freezed_annotation/freezed_annotation.dart';

part 'justificative.freezed.dart';
part 'justificative.g.dart';

@freezed
class Justificative with _$Justificative {
  factory Justificative({
    @JsonKey(name: '_id') required String? id,
    required String? uploadUrl,
    required String? comment,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _Justificative;

  factory Justificative.fromJson(Map<String, dynamic> json) =>
      _$JustificativeFromJson(json);
}
