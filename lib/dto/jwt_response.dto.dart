import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/dto/jwt.dto.dart';
import 'package:learnflow_backoffice/dto/jwt_payload.dto.dart';

part 'jwt_response.dto.freezed.dart';
part 'jwt_response.dto.g.dart';

@freezed
class JwtResponse with _$JwtResponse {
  factory JwtResponse({
    required Jwt? jwt,
    required JwtPayload? payload,
  }) = _JwtResponse;

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);
}
