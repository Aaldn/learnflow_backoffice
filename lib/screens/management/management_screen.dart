import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/screens/home/widgets/app_bar.dart';
import 'package:learnflow_backoffice/screens/management/widgets/student_data_table.dart';
import 'package:learnflow_backoffice/screens/management/widgets/table_selector.dart';
import 'package:learnflow_backoffice/screens/management/widgets/teacher_data_table.dart';

final dataTableIndexProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class ManagementScreen extends ConsumerWidget {
  const ManagementScreen({super.key});

  static const dataTable = [
    StudentDataTable(),
    TeacherDataTable(),
    // BookingDataTable(),
    // ReportDataTable(),
    // JustificativeDataTable(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const MyAppBar(subScreen: "Gestion"),
        const Flexible(child: TableSelector()),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: dataTable[ref.watch(dataTableIndexProvider)],
          ),
        ),
      ],
    );
  }
}
