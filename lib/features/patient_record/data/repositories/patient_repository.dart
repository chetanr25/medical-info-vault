// lib/features/patient_record/data/repositories/patient_repository.dart
import 'package:med_cortico/features/patient_record/presentation/providers/complaint_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/complaint.dart';

part 'patient_repository.g.dart';

@riverpod
class PatientRepository extends _$PatientRepository {
  List<String> complaints = [
    'Cough',
    'Cold',
    'Abdominal pain',
    'Headache',
    'Chest pain',
    'Tingling',
    'Rash',
    'Shortness of breath',
    'heartburn'
  ];
  @override
  List<Complaint> build() {
    print(complaints);
    return [
      for (var complaint in complaints)
        Complaint(
            id: complaint,
            name: complaint,
            isSelected:
                ref.watch(selectedComplaintsProvider).contains(complaint)),
    ];
  }

  // void toggleComplaint(String id) {
  //   state = state.map((complaint) {
  //     if (complaint.id == id) {
  //       return complaint.copyWith(isSelected: !complaint.isSelected);
  //     }
  //     return complaint;
  //   }).toList();
  // }
}
