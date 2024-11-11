import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_cortico/features/patient_record/domain/providers/provider.dart';

class TypeWidget extends ConsumerStatefulWidget {
  const TypeWidget({super.key});

  @override
  ConsumerState<TypeWidget> createState() => _TypeWidgetState();
}

class _TypeWidgetState extends ConsumerState<TypeWidget> {
  Widget _buildTypeChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        ref.read(toggleSelectedTypesProvider)(label);
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Colors.blue,
            ),
          ),
          label: Text(label),

          // selected: isSelected,
          deleteIcon: isSelected
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : const Text(''),
          onDeleted: () {
            ref.read(toggleSelectedTypesProvider)(label);
            // ref.read(selectedTypesProvider.notifier).state.contains(label)
            //     ? ref.read(selectedTypesProvider.notifier).remove(label)
            //     : ref.read(selectedTypesProvider.notifier).add(label);
          },
          backgroundColor: isSelected ? Colors.blue : Colors.white,
          labelStyle:
              TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  List types = ['Dry Cough', 'Whopping Cough', 'Productive Cough'];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        // side: const BorderSide(),

        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(0),
            topRight: const Radius.circular(0),
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10)),
      ),
      color: Colors.white,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 100,
          maxHeight: 200,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                const Text('Type - ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                for (var type in types)
                  _buildTypeChip(
                      type, ref.watch(selectedTypesProvider).contains(type)),
              ],
            ),
            const Expanded(
              child: Row(
                children: [
                  Text('No. of Bouts-'),
                  // Gap(1),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
