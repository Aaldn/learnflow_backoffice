import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learnflow_backoffice/models/student.dart';
import 'package:learnflow_backoffice/services/api/api_service.dart';
import 'package:learnflow_backoffice/services/authentication/secure_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';

final studentsProvider = FutureProvider<List<Student>>((ref) async {
  final apiToken = await ref.watch(secureStorageProvider).getApiToken();
  final apiService = ref.read(apiServiceProvider(apiToken));
  final students = await apiService.getStudents();
  return students;
});

class StudentDataTable extends ConsumerStatefulWidget {
  const StudentDataTable({super.key});

  @override
  ConsumerState<StudentDataTable> createState() => _StudentDataTableState();
}

class _StudentDataTableState extends ConsumerState<StudentDataTable> {
  late final PlutoGridStateManager stateManager;

  @override
  Widget build(BuildContext context) {
    final List<PlutoColumn> columns = <PlutoColumn>[
      PlutoColumn(
        title: 'Prénom',
        field: 'firstName',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Nom',
        field: 'lastName',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Date de naissance',
        field: 'birthdate',
        type: PlutoColumnType.date(),
      ),
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Numéro de téléphone',
        field: 'phoneNumber',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Rue',
        field: 'street',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Ville',
        field: 'city',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Code postale',
        field: 'zipCode',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Niveau scolaire',
        field: 'schoolLevel',
        type: PlutoColumnType.text(),
      ),
    ];

    final List<PlutoColumnGroup> columnGroups = [
      PlutoColumnGroup(title: 'Information personnelles', fields: [
        'firstName',
        'lastName',
        "birthdate",
      ]),
      PlutoColumnGroup(
        title: 'Contacts',
        fields: ["email", "phoneNumber"],
      ),
      PlutoColumnGroup(
        title: 'Adresse',
        fields: ["street", "city", "zipCode"],
      ),
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ref.watch(studentsProvider).when(
          data: (students) {
            return PlutoGrid(
              columns: columns,
              columnGroups: columnGroups,
              rows: students.map((student) {
                return PlutoRow(
                  cells: {
                    '_id': PlutoCell(value: student.id ?? ""),
                    'firstName': PlutoCell(value: student.firstName ?? ""),
                    'lastName': PlutoCell(value: student.lastName ?? ""),
                    'birthdate': PlutoCell(value: student.birthdate ?? ""),
                    'email': PlutoCell(value: student.email ?? ""),
                    'phoneNumber': PlutoCell(value: student.phoneNumber ?? ""),
                    'street': PlutoCell(value: student.address?.street ?? ""),
                    'city': PlutoCell(value: student.address?.city ?? ""),
                    'zipCode': PlutoCell(value: student.address?.zipCode ?? ""),
                    'schoolLevel': PlutoCell(value: student.schoolLevel ?? ""),
                  },
                );
              }).toList(),
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
                stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) async {
                try {
                  final cell =
                      event.row.cells.map<String, dynamic>((key, cell) {
                    final json = MapEntry(key, cell.value);
                    return json;
                  });
                  final student = Student.fromJson(cell);
                  final apiToken =
                      await ref.read(secureStorageProvider).getApiToken();
                  print(student.id);
                  final response = await ref
                      .read(apiServiceProvider(apiToken))
                      .updateStudent(
                        student.id!,
                        student,
                      );
                  print(response);
                  print("Success update");
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Modification non sauvegardées"),
                    ),
                  );
                }
              },
              createHeader: (stateManager) {
                return _Header(stateManager: stateManager);
              },
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
        ),
      ),
    );
  }
}

class _Header extends ConsumerStatefulWidget {
  const _Header({
    required this.stateManager,
    Key? key,
  }) : super(key: key);
  final PlutoGridStateManager stateManager;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<_Header> {
  int addCount = 1;
  int addedCount = 0;
  PlutoGridSelectingMode gridSelectingMode = PlutoGridSelectingMode.row;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.stateManager.setSelectingMode(gridSelectingMode);
    });
  }

  void handleAddRows() {
    final newRows = widget.stateManager.getNewRows(count: addCount);
    widget.stateManager.appendRows(newRows);
    widget.stateManager.setCurrentCell(
      newRows.first.cells.entries.first.value,
      widget.stateManager.refRows.length - 1,
    );
    widget.stateManager.moveScrollByRow(
      PlutoMoveDirection.down,
      widget.stateManager.refRows.length - 2,
    );
    widget.stateManager.setKeepFocus(true);
  }

  void handleRemoveCurrentRowButton() async {
    try {
      final json = widget.stateManager.currentRow!.cells
          .map<String, dynamic>((key, cell) {
        final json = MapEntry(key, cell.value);
        return json;
      });
      final student = Student.fromJson(json);
      final apiToken = await ref.read(secureStorageProvider).getApiToken();
      print(student.id);
      widget.stateManager.removeCurrentRow();
      final response =
          await ref.read(apiServiceProvider(apiToken)).deleteStudent(
                student.id!,
              );
      print(response);
      print("Success update");
    } catch (e) {
      print(e);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Modification non sauvegardées"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // ElevatedButton(
            //   onPressed: handleAddRows,
            //   child: const Text('Ajouter un élève'),
            // ),
            ElevatedButton(
              onPressed: handleRemoveCurrentRowButton,
              child: const Text("Supprimer l'élève"),
            ),
          ],
        ),
      ),
    );
  }
}
