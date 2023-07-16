import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

final studentsProvider = FutureProvider<List<Student>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final students = await apiService.getStudents();
  return students;
});

class StudentDataTable extends ConsumerWidget {
  const StudentDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ref.watch(studentsProvider).when(
          data: (students) {
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
                DataColumn(label: Text('Address')),
              ],
              rows: students.map((student) {
                return DataRow(cells: [
                  DataCell(Text(student.firstName ?? '')),
                  DataCell(Text(student.lastName ?? '')),
                  DataCell(
                    Text(student.birthdate?.toString() ?? ''),
                  ),
                  DataCell(Text(student.email ?? '')),
                  DataCell(Text(student.phoneNumber ?? '')),
                  DataCell(
                    Text(
                      "${student.address?.street ?? ""}, ${student.address?.city ?? ""}, ${student.address?.zipCode ?? ""}",
                    ),
                  ),
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
