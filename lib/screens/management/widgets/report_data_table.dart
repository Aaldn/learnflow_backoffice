import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/report.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

final reportsProvider = FutureProvider<List<Report>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final reports = await apiService.getReports();
  return reports;
});

class ReportDataTable extends ConsumerWidget {
  const ReportDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ref.watch(reportsProvider).when(
          data: (reports) {
            return DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              columns: const [
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Type')),
                DataColumn(label: Text('Modérateur')),
                DataColumn(label: Text('Élève')),
                DataColumn(label: Text('Professeur')),
                DataColumn(label: Text('Motif')),
                DataColumn(label: Text('Détail')),
              ],
              rows: reports.map((report) {
                return DataRow(cells: [
                  DataCell(Text(report.date?.toIso8601String() ?? '')),
                  DataCell(Text(report.reportType?.name ?? '')),
                  DataCell(Text(report.moderator?.email ?? '')),
                  DataCell(Text(report.student?.email ?? '')),
                  DataCell(Text(report.teacher?.email ?? '')),
                  DataCell(Text(report.reason?.toString() ?? '')),
                  DataCell(Text(report.detail ?? '')),
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
