import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/booking.dart';
import 'package:learnflow_backoffice/models/chat.dart';
import 'package:learnflow_backoffice/models/evaluation.dart';
import 'package:learnflow_backoffice/models/justificative.dart';
import 'package:learnflow_backoffice/models/manager.dart';
import 'package:learnflow_backoffice/models/moderator.dart';
import 'package:learnflow_backoffice/models/payment.dart';
import 'package:learnflow_backoffice/models/rating.dart';
import 'package:learnflow_backoffice/models/report.dart';
import 'package:learnflow_backoffice/models/report_type.dart';
import 'package:learnflow_backoffice/models/school_subject.dart';
import 'package:learnflow_backoffice/models/school_subject_taught.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';
import 'package:learnflow_backoffice/models/teacher_validation.dart';
import 'package:learnflow_backoffice/services/env/env.dart';

part "api_service.chopper.dart";

final apiServiceProvider = Provider<ChopperClient>((ref) {
  final chopper = ChopperClient(
    baseUrl: Uri.parse(Env.serverUrl),
    services: [ApiService.create()],
  );
  return chopper;
});

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  // Booking
  @Get()
  Future<Response<List<Booking>>> getBookings();

  @Get(path: "/bookings/{id}")
  Future<Response<Booking>> getBooking(@Path('id') int id);

  @Post(path: "/bookings/")
  Future<Response<Booking>> createBooking(@Body() Booking booking);

  @Patch(path: "/bookings/{id}/")
  Future<Response<Booking>> updateBooking(
    @Path('id') int id,
    @Body() Booking booking,
  );

  // Chat
  @Get()
  Future<Response<List<Chat>>> getChats();

  @Get(path: "/chats/{id}")
  Future<Response<Chat>> getChat(@Path('id') int id);

  @Post(path: "/chats/")
  Future<Response<Chat>> createChat(@Body() Chat chat);

  @Patch(path: "/chats/{id}/")
  Future<Response<Chat>> updateChat(
    @Path('id') int id,
    @Body() Chat chat,
  );

  // Evaluation
  @Get()
  Future<Response<List<Evaluation>>> getEvaluations();

  @Get(path: "/evaluations/{id}")
  Future<Response<Evaluation>> getEvaluation(@Path('id') int id);

  @Post(path: "/evaluations/")
  Future<Response<Evaluation>> createEvaluation(@Body() Evaluation evaluation);

  @Patch(path: "/evaluations/{id}/")
  Future<Response<Evaluation>> updateEvaluation(
    @Path('id') int id,
    @Body() Evaluation evaluation,
  );

  // Justificative
  @Get()
  Future<Response<List<Justificative>>> getJustificatives();

  @Get(path: "/justificatives/{id}")
  Future<Response<Justificative>> getJustificative(@Path('id') int id);

  @Post(path: "/justificatives/")
  Future<Response<Justificative>> createJustificative(
      @Body() Justificative justificative);

  @Patch(path: "/justificatives/{id}/")
  Future<Response<Justificative>> updateJustificative(
    @Path('id') int id,
    @Body() Justificative justificative,
  );

  // Manager
  @Get()
  Future<Response<List<Manager>>> getManagers();

  @Get(path: "/managers/{id}")
  Future<Response<Manager>> getManager(@Path('id') int id);

  @Post(path: "/managers/")
  Future<Response<Manager>> createManager(@Body() Manager manager);

  @Patch(path: "/managers/{id}/")
  Future<Response<Manager>> updateManager(
    @Path('id') int id,
    @Body() Manager manager,
  );

  // Moderator
  @Get()
  Future<Response<List<Moderator>>> getModerators();

  @Get(path: "/moderators/{id}")
  Future<Response<Moderator>> getModerator(@Path('id') int id);

  @Post(path: "/moderators/")
  Future<Response<Moderator>> createModerator(@Body() Moderator moderator);

  @Patch(path: "/moderators/{id}/")
  Future<Response<Moderator>> updateModerator(
    @Path('id') int id,
    @Body() Moderator moderator,
  );

  // Payment
  @Get()
  Future<Response<List<Payment>>> getPayments();

  @Get(path: "/payments/{id}")
  Future<Response<Payment>> getPayment(@Path('id') int id);

  @Post(path: "/payments/")
  Future<Response<Payment>> createPayment(@Body() Payment payment);

  @Patch(path: "/payments/{id}/")
  Future<Response<Payment>> updatePayment(
    @Path('id') int id,
    @Body() Payment payment,
  );

  // Rating
  @Get()
  Future<Response<List<Rating>>> getRatings();

  @Get(path: "/ratings/{id}")
  Future<Response<Rating>> getRating(@Path('id') int id);

  @Post(path: "/ratings/")
  Future<Response<Rating>> createRating(@Body() Rating rating);

  @Patch(path: "/ratings/{id}/")
  Future<Response<Rating>> updateRating(
    @Path('id') int id,
    @Body() Rating rating,
  );

  // ReportType
  @Get()
  Future<Response<List<ReportType>>> getReportTypes();

  @Get(path: "/reportTypes/{id}")
  Future<Response<ReportType>> getReportType(@Path('id') int id);

  @Post(path: "/reportTypes/")
  Future<Response<ReportType>> createReportType(@Body() ReportType reportType);

  @Patch(path: "/reportTypes/{id}/")
  Future<Response<ReportType>> updateReportType(
    @Path('id') int id,
    @Body() ReportType reportType,
  );

  // Report
  @Get()
  Future<Response<List<Report>>> getReports();

  @Get(path: "/reports/{id}")
  Future<Response<Report>> getReport(@Path('id') int id);

  @Post(path: "/reports/")
  Future<Response<Report>> createReport(@Body() Report report);

  @Patch(path: "/reports/{id}/")
  Future<Response<Report>> updateReport(
    @Path('id') int id,
    @Body() Report report,
  );

  // SchoolSubjectTaught
  @Get()
  Future<Response<List<SchoolSubjectTaught>>> getSchoolSubjectTaughts();

  @Get(path: "/school_subjects_teached/{id}")
  Future<Response<SchoolSubjectTaught>> getSchoolSubjectTaught(
      @Path('id') int id);

  @Post(path: "/school_subjects_teached/")
  Future<Response<SchoolSubjectTaught>> createSchoolSubjectTaught(
    @Body() SchoolSubjectTaught schoolSubjectsTeached,
  );

  @Patch(path: "/school_subjects_teached/{id}/")
  Future<Response<SchoolSubjectTaught>> updateSchoolSubjectTaught(
    @Path('id') int id,
    @Body() SchoolSubjectTaught report,
  );

  // SchoolSubject
  @Get()
  Future<Response<List<SchoolSubject>>> getSchoolSubjects();

  @Get(path: "/school_subjects/{id}")
  Future<Response<SchoolSubject>> getSchoolSubject(@Path('id') int id);

  @Post(path: "/school_subjects/")
  Future<Response<SchoolSubject>> createSchoolSubject(
      @Body() SchoolSubject schoolSubject);

  @Patch(path: "/school_subjects/{id}/")
  Future<Response<SchoolSubject>> updateSchoolSubject(
    @Path('id') int id,
    @Body() SchoolSubject schoolSubject,
  );

  // Student
  @Get()
  Future<Response<List<Student>>> getStudents();

  @Get(path: "/students/{id}")
  Future<Response<Student>> getStudent(@Path('id') int id);

  @Post(path: "/students/")
  Future<Response<Student>> createStudent(@Body() Student student);

  @Patch(path: "/students/{id}/")
  Future<Response<Student>> updateStudent(
    @Path('id') int id,
    @Body() Student student,
  );

  @Delete(path: "/students/{id}")
  Future<Response<Student>> deleteStudent(@Path('id') int id);

  // TeacherValidation
  @Get()
  Future<Response<List<TeacherValidation>>> getTeacherValidations();

  @Get(path: "/teachers/{id}")
  Future<Response<TeacherValidation>> getTeacherValidation(@Path('id') int id);

  @Post(path: "/teachers/")
  Future<Response<TeacherValidation>> createTeacherValidation(
      @Body() TeacherValidation teacher);

  @Patch(path: "/teachers/{id}/")
  Future<Response<TeacherValidation>> updateTeacherValidation(
    @Path('id') int id,
    @Body() TeacherValidation teacher,
  );

  // Teacher
  @Get()
  Future<Response<List<Teacher>>> getTeachers();

  @Get(path: "/teachers/{id}")
  Future<Response<Teacher>> getTeacher(@Path('id') int id);

  @Post(path: "/teachers/")
  Future<Response<Teacher>> createTeacher(@Body() Teacher teacher);

  @Patch(path: "/teachers/{id}/")
  Future<Response<Teacher>> updateTeacher(
    @Path('id') int id,
    @Body() Teacher teacher,
  );

  @Delete(path: "/teachers/{id}")
  Future<Response<Teacher>> deleteTeacher(@Path('id') int id);
}
