import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/dto/jwt.dto.dart';

part 'jwt_response.dto.freezed.dart';
part 'jwt_response.dto.g.dart';

@freezed
class JwtResponse with _$JwtResponse {
  factory JwtResponse({
    required Jwt? jwt,
  }) = _JwtResponse;

  factory JwtResponse.fromJson(Map<String, dynamic> json) =>
      _$JwtResponseFromJson(json);
}
