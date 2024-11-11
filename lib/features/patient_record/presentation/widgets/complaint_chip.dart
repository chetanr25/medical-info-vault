// lib/features/patient_record/presentation/widgets/complaint_chip.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      label: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Text(complaint.name),
      ),
      selected: complaint.isSelected,
      selectedColor: Colors.green,
      onSelected: (selected) {
        ref
            .read(selectedComplaintsProvider.notifier)
            .toggleComplaint(complaint.id);
      },
      backgroundColor: complaint.isSelected
          ? const Color.fromARGB(255, 234, 6, 6)
          : Colors.blue[100],
      labelStyle: TextStyle(
        color: complaint.isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
