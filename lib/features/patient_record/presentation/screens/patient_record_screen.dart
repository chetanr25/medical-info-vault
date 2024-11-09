// lib/features/patient_record/presentation/screens/patient_record_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/data/repositories/patient_repository.dart';
import '../widgets/complaint_chip.dart';
import '../widgets/nav_button.dart';
import '../providers/complaint_provider.dart';

class PatientRecordScreen extends ConsumerWidget {
  const PatientRecordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(patientRepositoryProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNavigationButtons(),
            const SizedBox(height: 16),
            _buildSearchBar(),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: complaints
                  .map((complaint) => ComplaintChip(complaint: complaint))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(child: _buildNavButton('Chief Complaint', true)),
            Expanded(child: _buildNavButton('Findings', false)),
            Expanded(child: _buildNavButton('Past History', false)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildNavButton('Investigations', false)),
            Expanded(child: _buildNavButton('Diagnosis', false)),
            Expanded(child: _buildNavButton('Medications', false)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildNavButton('Lifestyle Advice', false)),
            Expanded(child: _buildNavButton('Comments', false)),
            Expanded(child: _buildNavButton('Follow Up', false)),
          ],
        ),
      ],
    );
  }

  Widget _buildNavButton(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {/* Handle navigation */},
        style: TextButton.styleFrom(
          backgroundColor: isActive ? Colors.blue : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Chief Complaints',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.add_circle, color: Colors.blue),
          onPressed: () {},
        ),
      ),
    );
  }
}
