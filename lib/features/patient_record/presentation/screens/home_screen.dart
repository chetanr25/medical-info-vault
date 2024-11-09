// lib/features/patient_record/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/presentation/screens/patient_record_screen.dart';
import 'package:med_cortico/features/patient_record/presentation/widgets/history.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {/* Handle navigation */},
        ),
        title: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Past Records',
                  style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Change Patient',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          const Expanded(child: PatientRecordScreen()),
          const Expanded(child: HistoryWidget()),
        ],
      ),
    );
  }
}
