import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/manager.dart';
import 'package:learnflow_backoffice/models/moderator.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/models/teacher.dart';
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

  @Delete(path: "/moderators/{id}")
  Future<Response<Moderator>> deleteModerator(@Path('id') int id);

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
}
