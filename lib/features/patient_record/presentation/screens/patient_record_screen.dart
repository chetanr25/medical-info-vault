import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/data/repositories/patient_repository.dart';
import 'package:med_cortico/features/patient_record/domain/providers/provider.dart';
import '../widgets/complaint_chip.dart';

class PatientRecordScreen extends ConsumerWidget {
  const PatientRecordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(patientRepositoryProvider);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildNavigationButtons(ref),
              )),
          const SizedBox(height: 2),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 1),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: complaints
                        .map((complaint) => Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ComplaintChip(complaint: complaint),
                            ))
                        .toList(),
                  ),
                  // Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            for (final category in [
              'Chief Complaint',
              'Findings',
              'Past History'
            ])
              Expanded(
                child: _buildNavButtonCategory(category,
                    category == ref.watch(selectedCategoriesProvider), ref),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            for (final category in [
              'Investigations',
              'Diagnosis',
              'Medications',
            ])
              Expanded(
                child: _buildNavButtonCategory(category,
                    category == ref.watch(selectedCategoriesProvider), ref),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            for (final category in [
              'Lifestyle Advice',
              'Comments',
              'Follow Up'
            ])
              Expanded(
                child: _buildNavButtonCategory(category,
                    category == ref.watch(selectedCategoriesProvider), ref),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavButtonCategory(String text, bool isActive, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          ref.watch(selectedCategoriesProvider.notifier).state = text;
        },
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Chief Complaints',
          hintStyle: const TextStyle(color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.blue),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
