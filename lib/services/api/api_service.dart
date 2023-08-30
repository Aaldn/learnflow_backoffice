// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart' hide Headers;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/dto/jwt_response.dto.dart';
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
    contentType: "application/json",
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
  @Headers(<String, dynamic>{"Content-Type": "application/json"})
  Future<JwtResponse> login(@Body() LoginInformation loginInformation);

  // Logout
  @POST("/auth/logout")
  Future<void> logout();

  // Booking
  @GET("/bookings")
  Future<List<Booking>> getBookings();

  @GET("/bookings/{_id}")
  Future<Booking> getBooking(@Path('_id') String _id);

  @POST("/bookings/")
  Future<Booking> createBooking(@Body() Booking booking);

  @PATCH("/bookings/{_id}/")
  Future<List<Booking>> updateBooking(
    @Path('_id') String _id,
    @Body() Booking booking,
  );

  @DELETE("/bookings/{_id}")
  Future<bool> deleteBooking(@Path('_id') String _id);

  // Chat
  @GET("/chats")
  Future<List<Chat>> getChats();

  @GET("/chats/{_id}")
  Future<Chat> getChat(@Path('_id') String _id);

  @POST("/chats/")
  Future<Chat> createChat(@Body() Chat chat);

  @PATCH("/chats/{_id}/")
  Future<List<Chat>> updateChat(
    @Path('_id') String _id,
    @Body() Chat chat,
  );

  // Evaluation
  @GET("/evaluations")
  Future<List<Evaluation>> getEvaluations();

  @GET("/evaluations/{_id}")
  Future<Evaluation> getEvaluation(@Path('_id') String _id);

  @POST("/evaluations/")
  Future<Evaluation> createEvaluation(@Body() Evaluation evaluation);

  @PATCH("/evaluations/{_id}/")
  Future<List<Evaluation>> updateEvaluation(
    @Path('_id') String _id,
    @Body() Evaluation evaluation,
  );

  // Justificative
  @GET("/justificatives")
  Future<List<Justificative>> getJustificatives();

  @GET("/justificatives/{_id}")
  Future<Justificative> getJustificative(@Path('_id') String _id);

  @POST("/justificatives/")
  Future<Justificative> createJustificative(
      @Body() Justificative justificative);

  @PATCH("/justificatives/{_id}/")
  Future<List<Justificative>> updateJustificative(
    @Path('_id') String _id,
    @Body() Justificative justificative,
  );

  // Manager
  @GET("/managers")
  Future<List<Manager>> getManagers();

  @GET("/managers/{_id}")
  Future<Manager> getManager(@Path('_id') String _id);

  @POST("/managers/")
  Future<Manager> createManager(@Body() Manager manager);

  @PATCH("/managers/{_id}/")
  Future<List<Manager>> updateManager(
    @Path('_id') String _id,
    @Body() Manager manager,
  );

  // Moderator
  @GET("/moderators")
  Future<List<Moderator>> getModerators();

  @GET("/moderators/{_id}")
  Future<Moderator> getModerator(@Path('_id') String _id);

  @POST("/moderators/")
  Future<Moderator> createModerator(@Body() Moderator moderator);

  @PATCH("/moderators/{_id}/")
  Future<List<Moderator>> updateModerator(
    @Path('_id') String _id,
    @Body() Moderator moderator,
  );

  // Payment
  @GET("/payments")
  Future<List<Payment>> getPayments();

  @GET("/payments/{_id}")
  Future<Payment> getPayment(@Path('_id') String _id);

  @POST("/payments/")
  Future<Payment> createPayment(@Body() Payment payment);

  @PATCH("/payments/{_id}/")
  Future<List<Payment>> updatePayment(
    @Path('_id') String _id,
    @Body() Payment payment,
  );

  // Rating
  @GET("/ratings")
  Future<List<Rating>> getRatings();

  @GET("/ratings/{_id}")
  Future<Rating> getRating(@Path('_id') String _id);

  @POST("/ratings/")
  Future<Rating> createRating(@Body() Rating rating);

  @PATCH("/ratings/{_id}/")
  Future<List<Rating>> updateRating(
    @Path('_id') String _id,
    @Body() Rating rating,
  );

  // ReportType
  @GET("/reportTypes")
  Future<List<ReportType>> getReportTypes();

  @GET("/reportTypes/{_id}")
  Future<ReportType> getReportType(@Path('_id') String _id);

  @POST("/reportTypes/")
  Future<ReportType> createReportType(@Body() ReportType reportType);

  @PATCH("/reportTypes/{_id}/")
  Future<List<ReportType>> updateReportType(
    @Path('_id') String _id,
    @Body() ReportType reportType,
  );

  // Report
  @GET("/reports")
  Future<List<Report>> getReports();

  @GET("/reports/{_id}")
  Future<Report> getReport(@Path('_id') String _id);

  @POST("/reports/")
  Future<Report> createReport(@Body() Report report);

  @PATCH("/reports/{_id}/")
  Future<List<Report>> updateReport(
    @Path('_id') String _id,
    @Body() Report report,
  );

  // SchoolSubjectTaught
  @GET("/school_subjects_teached")
  Future<List<SchoolSubjectTaught>> getSchoolSubjectTaughts();

  @GET("/school_subjects_teached/{_id}")
  Future<SchoolSubjectTaught> getSchoolSubjectTaught(@Path('_id') String _id);

  @POST("/school_subjects_teached/")
  Future<SchoolSubjectTaught> createSchoolSubjectTaught(
    @Body() SchoolSubjectTaught schoolSubjectsTeached,
  );

  @PATCH("/school_subjects_teached/{_id}/")
  Future<List<SchoolSubjectTaught>> updateSchoolSubjectTaught(
    @Path('_id') String _id,
    @Body() SchoolSubjectTaught report,
  );

  // SchoolSubject
  @GET("/school_subjects")
  Future<List<SchoolSubject>> getSchoolSubjects();

  @GET("/school_subjects/{_id}")
  Future<SchoolSubject> getSchoolSubject(@Path('_id') String _id);

  @POST("/school_subjects/")
  Future<SchoolSubject> createSchoolSubject(
      @Body() SchoolSubject schoolSubject);

  @PATCH("/school_subjects/{_id}/")
  Future<List<SchoolSubject>> updateSchoolSubject(
    @Path('_id') String _id,
    @Body() SchoolSubject schoolSubject,
  );

  // Student
  @GET("/students")
  Future<List<Student>> getStudents();

  @GET("/students/{_id}")
  Future<Student> getStudent(@Path('_id') String _id);

  @POST("/students/")
  Future<Student> createStudent(@Body() Student student);

  @PATCH("/students/{_id}/")
  Future<List<Student>> updateStudent(
    @Path('_id') String _id,
    @Body() Student student,
  );

  @DELETE("/students/{_id}")
  Future<bool> deleteStudent(@Path('_id') String _id);

  // TeacherValidation
  @GET("/teachers")
  Future<List<TeacherValidation>> getTeacherValidations();

  @GET("/teachers/{_id}")
  Future<TeacherValidation> getTeacherValidation(@Path('_id') String _id);

  @POST("/teachers/")
  Future<TeacherValidation> createTeacherValidation(
      @Body() TeacherValidation teacher);

  @PATCH("/teachers/{_id}/")
  Future<List<TeacherValidation>> updateTeacherValidation(
    @Path('_id') String _id,
    @Body() TeacherValidation teacher,
  );

  // Teacher
  @GET("/teachers")
  Future<List<Teacher>> getTeachers();

  @GET("/teachers/{_id}")
  Future<Teacher> getTeacher(@Path('_id') String _id);

  @POST("/teachers/")
  Future<Teacher> createTeacher(@Body() Teacher teacher);

  @PATCH("/teachers/{_id}/")
  Future<List<Teacher>> updateTeacher(
    @Path('_id') String _id,
    @Body() Teacher teacher,
  );

  @DELETE("/teachers/{_id}")
  Future<Teacher> deleteTeacher(@Path('_id') String _id);
}
