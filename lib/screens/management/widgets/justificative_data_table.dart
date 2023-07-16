import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/justificative.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

final justificativesProvider = FutureProvider<List<Justificative>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final justificatives = await apiService.getJustificatives();
  return justificatives;
});

class JustificativeDataTable extends ConsumerWidget {
  const JustificativeDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ref.watch(justificativesProvider).when(
          data: (justificatives) {
            return DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              columns: const [
                DataColumn(label: Text('Début')),
                DataColumn(label: Text('Fin')),
                DataColumn(label: Text('Commentaires')),
                DataColumn(label: Text('Upload')),
              ],
              rows: justificatives.map((justificative) {
                return DataRow(cells: [
                  DataCell(
                    Text(justificative.startDate?.toIso8601String() ?? ''),
                  ),
                  DataCell(
                    Text(justificative.endDate?.toIso8601String() ?? ''),
                  ),
                  DataCell(Text(justificative.comment ?? '')),
                  DataCell(Text(justificative.uploadUrl ?? '')),
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
