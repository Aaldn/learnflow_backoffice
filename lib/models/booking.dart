import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learnflow_backoffice/models/justificative.dart';
import 'package:learnflow_backoffice/models/payment.dart';
import 'package:learnflow_backoffice/models/school_subject.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  factory Booking({
    @JsonKey(name: '_id') required String? id,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool? isAccepted,
    required SchoolSubject? schoolSubject,
    required Student? student,
    required Teacher? teacher,
    required Justificative? studentJustificative,
    required Justificative? teacherJustificative,
    required Payment? payment,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}
