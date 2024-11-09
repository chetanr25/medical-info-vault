// lib/features/patient_record/presentation/providers/complaint_provider.dart
import 'package:med_cortico/features/patient_record/data/repositories/patient_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/complaint.dart';

part 'complaint_provider.g.dart';

@riverpod
class SelectedComplaints extends _$SelectedComplaints {
  @override
  List<String> build() {
    return ['Cough'];
  }

  void toggleComplaint(String complaint) {
    if (state.contains(complaint)) {
      state = [...state]..remove(complaint);
    } else {
      state = [...state, complaint];
    }
  }
}
