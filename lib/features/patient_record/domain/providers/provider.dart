import 'package:flutter_riverpod/flutter_riverpod.dart';

// final patientRepositoryProvider =
//     StateNotifierProvider<PatientNotifier, List<String>>((ref) {
//   return PatientNotifier();
// });

class PatientNotifier extends StateNotifier<List<String>> {
  PatientNotifier() : super([]);

  void addComplaint(String complaint) {
    state = [...state, complaint];
  }

  void removeComplaint(String complaint) {
    state = state.where((element) => element != complaint).toList();
  }
}

final selectedTypesProvider = StateProvider<Set<String>>((ref) => {});
final toggleSelectedTypesProvider = Provider<Function(String)>((ref) {
  return (String type) {
    final notifier = ref.read(selectedTypesProvider.notifier);
    final currentTypes = Set<String>.from(ref.read(selectedTypesProvider));

    if (currentTypes.contains(type)) {
      currentTypes.remove(type);
    } else {
      currentTypes.add(type);
    }

    notifier.state = currentTypes;
  };
});

// final selectedComplaintProvider = StateProvider<Set<String>>((ref) => {});
// final toggleSelectedComplaintProvider = Provider<Function(String)>((ref) {
//   return (String type) {
//     final notifier = ref.read(selectedTypesProvider.notifier);
//     final currentTypes = Set<String>.from(ref.read(selectedTypesProvider));

//     if (currentTypes.contains(type)) {
//       currentTypes.remove(type);
//     } else {
//       currentTypes.add(type);
//     }

//     notifier.state = currentTypes;
//   };
// });
final selectedCategoriesProvider =
    StateProvider<String>((ref) => 'Chief Complaint');
final toggleSelectedCategoriesProvider = Provider<Function(String)>((ref) {
  return (String category) {
    ref.read(selectedCategoriesProvider.notifier).state = category;
  };
});
