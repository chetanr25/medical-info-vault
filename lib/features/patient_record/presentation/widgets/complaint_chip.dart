// lib/features/patient_record/presentation/widgets/complaint_chip.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/data/repositories/patient_repository.dart';
import '../../domain/entities/complaint.dart';
import '../providers/complaint_provider.dart';

class ComplaintChip extends ConsumerWidget {
  final Complaint complaint;

  const ComplaintChip({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterChip(
      label: Text(complaint.name),
      selected: complaint.isSelected,
      onSelected: (selected) {
        ref
            .read(patientRepositoryProvider.notifier)
            .toggleComplaint(complaint.id);
      },
      backgroundColor: complaint.isSelected
          ? const Color.fromARGB(255, 234, 6, 6)
          : Colors.blue[100],
      labelStyle: TextStyle(
        color: complaint.isSelected ? Colors.black : Colors.black,
      ),
    );
  }
}
