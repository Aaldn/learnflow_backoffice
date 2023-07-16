import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/booking.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';

final bookingsProvider = FutureProvider<List<Booking>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final bookings = await apiService.getBookings();
  return bookings;
});

class BookingDataTable extends ConsumerWidget {
  const BookingDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        ref.watch(bookingsProvider).when(
          data: (bookings) {
            return DataTable(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              headingTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              columns: const [
                DataColumn(label: Text('Élève')),
                DataColumn(label: Text('Professeur')),
                DataColumn(label: Text('Début')),
                DataColumn(label: Text('Fin')),
                DataColumn(label: Text('Montant')),
                DataColumn(label: Text('Paiement')),
                DataColumn(label: Text('Accepté')),
              ],
              rows: bookings.map((booking) {
                return DataRow(cells: [
                  DataCell(Text(booking.student?.email ?? '')),
                  DataCell(Text(booking.teacher?.email ?? '')),
                  DataCell(Text(booking.startDate?.toIso8601String() ?? '')),
                  DataCell(Text(booking.endDate?.toIso8601String() ?? '')),
                  DataCell(Text(booking.payment?.amount ?? '')),
                  DataCell(
                    Text(booking.payment?.date?.toIso8601String() ?? ''),
                  ),
                  DataCell(_buildState(booking.isAccepted)),
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

  Widget _buildState(bool? isAccepted) {
    if (isAccepted == null) return const Text("En attente");
    if (isAccepted) {
      return const Icon(
        Icons.done,
        color: Colors.green,
      );
    }
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
