//lib/features/patient_record/presentation/widgets/duration_grid.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final durationProvider = StateProvider<List<List<String>>>((ref) {
  return List.generate(2, (_) => List.filled(6, ''));
});

class DurationGrid extends ConsumerWidget {
  const DurationGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(durationProvider);

    return Table(
      border: TableBorder.all(),
      children: List.generate(
        2,
        (row) => TableRow(
          children: List.generate(
            6,
            (col) => Container(
              height: 40,
              padding: const EdgeInsets.all(4),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                onChanged: (value) {
                  final newDuration = [...duration];
                  newDuration[row][col] = value;
                  ref.read(durationProvider.notifier).state = newDuration;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
