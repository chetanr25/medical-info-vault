import 'package:flutter_riverpod/flutter_riverpod.dart';

final patientRepositoryProvider =
    StateNotifierProvider<PatientNotifier, List<String>>((ref) {
  return PatientNotifier();
});

class PatientNotifier extends StateNotifier<List<String>> {
  PatientNotifier() : super([]);

  void addComplaint(String complaint) {
    state = [...state, complaint];
  }

  void removeComplaint(String complaint) {
    state = state.where((element) => element != complaint).toList();
  }
}
