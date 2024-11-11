// lib/features/patient_record/presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/presentation/screens/patient_record_screen.dart';
import 'package:med_cortico/features/patient_record/presentation/widgets/history.dart';
import 'package:med_cortico/features/patient_record/presentation/widgets/type.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {/* Handle navigation */},
        ),
        title: Row(
          children: [
            Container(
              // onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Past Records',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Change Patient',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            Spacer(),
            Text('Naman Singh, M 21'),
            Spacer(),
            Image(
              image: AssetImage('assets/icon.png'),
              fit: BoxFit.fill,
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.lightBlue,
                Colors.blue[100] ?? Colors.blue,
              ],
            ),
          ),
        ),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: PatientRecordScreen()),
          Expanded(
              child: Column(
            children: [
              Expanded(child: HistoryWidget()),
              SizedBox(
                child: TypeWidget(),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
