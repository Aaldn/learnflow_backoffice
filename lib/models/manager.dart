import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager.freezed.dart';
part 'manager.g.dart';

@freezed
class Manager with _$Manager {
  factory Manager({
    required String? firstName,
    required String? lastName,
    required String? email,
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) =>
      _$ManagerFromJson(json);
}
