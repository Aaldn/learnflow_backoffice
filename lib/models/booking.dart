import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  factory Booking({
    required int? id,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool? isAccepted,
    required String? subject,
    required Student? student,
    required Teacher? teacher,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
