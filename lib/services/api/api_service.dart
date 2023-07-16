import 'package:dio/dio.dart' hide Headers;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/dto/login_information.dto.dart';
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
import 'package:retrofit/retrofit.dart';

part "api_service.g.dart";

final apiServiceProvider =
    Provider.family<ApiService, String?>((ref, apiToken) {
  final baseOptions = BaseOptions(
    baseUrl: Env.apiBaseUrl,
    headers: apiToken != null ? {"Authorization": "Bearer $apiToken"} : null,
  );
  final dio = Dio(baseOptions);
  return ApiService(dio);
});

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  // HealthCheck
  @GET("/")
  Future healthCheck();

  // Login
  @POST("/auth/login/manager/")
  Future<dynamic> login(@Body() LoginInformation loginInformation);

  // Logout
  @POST("/logout")
  Future<void> logout();

  // Booking
  @GET("/bookings")
  Future<List<Booking>> getBookings();

  @GET("/bookings/{id}")
  Future<Booking> getBooking(@Path('id') int id);

  @POST("/bookings/")
  Future<Booking> createBooking(@Body() Booking booking);

  @PATCH("/bookings/{id}/")
  Future<Booking> updateBooking(
    @Path('id') int id,
    @Body() Booking booking,
  );

  // Chat
  @GET("/chats")
  Future<List<Chat>> getChats();

  @GET("/chats/{id}")
  Future<Chat> getChat(@Path('id') int id);

  @POST("/chats/")
  Future<Chat> createChat(@Body() Chat chat);

  @PATCH("/chats/{id}/")
  Future<Chat> updateChat(
    @Path('id') int id,
    @Body() Chat chat,
  );

  // Evaluation
  @GET("/evaluations")
  Future<List<Evaluation>> getEvaluations();

  @GET("/evaluations/{id}")
  Future<Evaluation> getEvaluation(@Path('id') int id);

  @POST("/evaluations/")
  Future<Evaluation> createEvaluation(@Body() Evaluation evaluation);

  @PATCH("/evaluations/{id}/")
  Future<Evaluation> updateEvaluation(
    @Path('id') int id,
    @Body() Evaluation evaluation,
  );

  // Justificative
  @GET("/justificatives")
  Future<List<Justificative>> getJustificatives();

  @GET("/justificatives/{id}")
  Future<Justificative> getJustificative(@Path('id') int id);

  @POST("/justificatives/")
  Future<Justificative> createJustificative(
      @Body() Justificative justificative);

  @PATCH("/justificatives/{id}/")
  Future<Justificative> updateJustificative(
    @Path('id') int id,
    @Body() Justificative justificative,
  );

  // Manager
  @GET("/managers")
  Future<List<Manager>> getManagers();

  @GET("/managers/{id}")
  Future<Manager> getManager(@Path('id') int id);

  @POST("/managers/")
  Future<Manager> createManager(@Body() Manager manager);

  @PATCH("/managers/{id}/")
  Future<Manager> updateManager(
    @Path('id') int id,
    @Body() Manager manager,
  );

  // Moderator
  @GET("/moderators")
  Future<List<Moderator>> getModerators();

  @GET("/moderators/{id}")
  Future<Moderator> getModerator(@Path('id') int id);

  @POST("/moderators/")
  Future<Moderator> createModerator(@Body() Moderator moderator);

  @PATCH("/moderators/{id}/")
  Future<Moderator> updateModerator(
    @Path('id') int id,
    @Body() Moderator moderator,
  );

  // Payment
  @GET("/payments")
  Future<List<Payment>> getPayments();

  @GET("/payments/{id}")
  Future<Payment> getPayment(@Path('id') int id);

  @POST("/payments/")
  Future<Payment> createPayment(@Body() Payment payment);

  @PATCH("/payments/{id}/")
  Future<Payment> updatePayment(
    @Path('id') int id,
    @Body() Payment payment,
  );

  // Rating
  @GET("/ratings")
  Future<List<Rating>> getRatings();

  @GET("/ratings/{id}")
  Future<Rating> getRating(@Path('id') int id);

  @POST("/ratings/")
  Future<Rating> createRating(@Body() Rating rating);

  @PATCH("/ratings/{id}/")
  Future<Rating> updateRating(
    @Path('id') int id,
    @Body() Rating rating,
  );

  // ReportType
  @GET("/reportTypes")
  Future<List<ReportType>> getReportTypes();

  @GET("/reportTypes/{id}")
  Future<ReportType> getReportType(@Path('id') int id);

  @POST("/reportTypes/")
  Future<ReportType> createReportType(@Body() ReportType reportType);

  @PATCH("/reportTypes/{id}/")
  Future<ReportType> updateReportType(
    @Path('id') int id,
    @Body() ReportType reportType,
  );

  // Report
  @GET("/reports")
  Future<List<Report>> getReports();

  @GET("/reports/{id}")
  Future<Report> getReport(@Path('id') int id);

  @POST("/reports/")
  Future<Report> createReport(@Body() Report report);

  @PATCH("/reports/{id}/")
  Future<Report> updateReport(
    @Path('id') int id,
    @Body() Report report,
  );

  // SchoolSubjectTaught
  @GET("/school_subjects_teached")
  Future<List<SchoolSubjectTaught>> getSchoolSubjectTaughts();

  @GET("/school_subjects_teached/{id}")
  Future<SchoolSubjectTaught> getSchoolSubjectTaught(@Path('id') int id);

  @POST("/school_subjects_teached/")
  Future<SchoolSubjectTaught> createSchoolSubjectTaught(
    @Body() SchoolSubjectTaught schoolSubjectsTeached,
  );

  @PATCH("/school_subjects_teached/{id}/")
  Future<SchoolSubjectTaught> updateSchoolSubjectTaught(
    @Path('id') int id,
    @Body() SchoolSubjectTaught report,
  );

  // SchoolSubject
  @GET("/school_subjects")
  Future<List<SchoolSubject>> getSchoolSubjects();

  @GET("/school_subjects/{id}")
  Future<SchoolSubject> getSchoolSubject(@Path('id') int id);

  @POST("/school_subjects/")
  Future<SchoolSubject> createSchoolSubject(
      @Body() SchoolSubject schoolSubject);

  @PATCH("/school_subjects/{id}/")
  Future<SchoolSubject> updateSchoolSubject(
    @Path('id') int id,
    @Body() SchoolSubject schoolSubject,
  );

  // Student
  @GET("/students")
  Future<List<Student>> getStudents();

  @GET("/students/{id}")
  Future<Student> getStudent(@Path('id') int id);

  @POST("/students/")
  Future<Student> createStudent(@Body() Student student);

  @PATCH("/students/{id}/")
  Future<Student> updateStudent(
    @Path('id') int id,
    @Body() Student student,
  );

  @DELETE("/students/{id}")
  Future<Student> deleteStudent(@Path('id') int id);

  // TeacherValidation
  @GET("/teachers")
  Future<List<TeacherValidation>> getTeacherValidations();

  @GET("/teachers/{id}")
  Future<TeacherValidation> getTeacherValidation(@Path('id') int id);

  @POST("/teachers/")
  Future<TeacherValidation> createTeacherValidation(
      @Body() TeacherValidation teacher);

  @PATCH("/teachers/{id}/")
  Future<TeacherValidation> updateTeacherValidation(
    @Path('id') int id,
    @Body() TeacherValidation teacher,
  );

  // Teacher
  @GET("/teachers")
  Future<List<Teacher>> getTeachers();

  @GET("/teachers/{id}")
  Future<Teacher> getTeacher(@Path('id') int id);

  @POST("/teachers/")
  Future<Teacher> createTeacher(@Body() Teacher teacher);

  @PATCH("/teachers/{id}/")
  Future<Teacher> updateTeacher(
    @Path('id') int id,
    @Body() Teacher teacher,
  );

  @DELETE("/teachers/{id}")
  Future<Teacher> deleteTeacher(@Path('id') int id);
}
