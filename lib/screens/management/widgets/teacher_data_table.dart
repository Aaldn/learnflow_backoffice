import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/teacher.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

final teachersProvider = FutureProvider<List<Teacher>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final teachers = await apiService.getTeachers();
  return teachers;
});

class TeacherDataTable extends ConsumerWidget {
  const TeacherDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ref.watch(teachersProvider).when(
          data: (teachers) {
            return DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              columns: const [
                DataColumn(label: Text('Prénom')),
                DataColumn(label: Text('Nom')),
                DataColumn(label: Text('Date de naissance')),
                DataColumn(label: Text('Email')),
                DataColumn(label: Text('Numéro de téléphone')),
              ],
              rows: teachers.map((teacher) {
                return DataRow(cells: [
                  DataCell(Text(teacher.firstName ?? '')),
                  DataCell(Text(teacher.lastName ?? '')),
                  DataCell(
                    Text(teacher.birthdate?.toString() ?? ''),
                  ),
                  DataCell(Text(teacher.email ?? '')),
                  DataCell(Text(teacher.phoneNumber ?? '')),
                ]);
              }).toList(),
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text('Erreur lors du chargement des données'),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
