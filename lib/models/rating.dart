import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@freezed
class Rating with _$Rating {
  factory Rating({
    @JsonKey(name: '_id') required String? id,
    required int? note,
    required Student? student,
    required Teacher? teacher,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
