import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_information.dto.freezed.dart';
part 'login_information.dto.g.dart';

@freezed
class LoginInformation with _$LoginInformation {
  factory LoginInformation({
    required String? email,
    required String? password,
  }) = _LoginInformation;

  factory LoginInformation.fromJson(Map<String, dynamic> json) =>
      _$LoginInformationFromJson(json);
}
