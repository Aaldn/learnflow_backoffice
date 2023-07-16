import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_payload.dto.freezed.dart';
part 'jwt_payload.dto.g.dart';

@freezed
class JwtPayload with _$JwtPayload {
  factory JwtPayload({
    required String? email,
    required String? role,
    required int? stales,
  }) = _JwtPayload;

  factory JwtPayload.fromJson(Map<String, dynamic> json) =>
      _$JwtPayloadFromJson(json);
}
