import 'package:freezed_annotation/freezed_annotation.dart';

part 'moderator.freezed.dart';
part 'moderator.g.dart';

@freezed
class Moderator with _$Moderator {
  factory Moderator({
    required int? id,
    required String? firstName,
    required String? lastName,
    required String? email,
  }) = _Moderator;

  factory Moderator.fromJson(Map<String, dynamic> json) =>
      _$ModeratorFromJson(json);
}
