// lib/features/patient_record/data/repositories/patient_repository.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/complaint.dart';

part 'patient_repository.g.dart';

@riverpod
class PatientRepository extends _$PatientRepository {
  @override
  List<Complaint> build() {
    return [
      Complaint(id: '1', name: 'Cough', isSelected: true),
      Complaint(id: '2', name: 'Cold'),
      Complaint(id: '3', name: 'Abdominal pain'),
      // ... add other complaints
    ];
  }

  void toggleComplaint(String id) {
    state = state.map((complaint) {
      if (complaint.id == id) {
        return complaint.copyWith(isSelected: !complaint.isSelected);
      }
      return complaint;
    }).toList();
  }
}
