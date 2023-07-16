import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/dto/jwt_payload.dto.dart';

part 'jwt.dto.freezed.dart';
part 'jwt.dto.g.dart';

@freezed
class Jwt with _$Jwt {
  factory Jwt({
    required String? token,
    required JwtPayload? payload,
    required bool? valid,
    required bool? expired,
    required bool? stale,
  }) = _Jwt;

  factory Jwt.fromJson(Map<String, dynamic> json) => _$JwtFromJson(json);
}
