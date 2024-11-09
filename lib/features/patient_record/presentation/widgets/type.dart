import 'package:flutter/material.dart';

class TypeWidget extends StatefulWidget {
  const TypeWidget({super.key});

  @override
  State<TypeWidget> createState() => _TypeWidgetState();
}

class _TypeWidgetState extends State<TypeWidget> {
  Widget _buildTypeChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          // Handle selection
        });
      },
      backgroundColor: isSelected ? Colors.blue : Colors.white12,
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Wrap(
              runSpacing: 8,
              alignment: WrapAlignment.start,
              spacing: 8,
              children: [
                Text('Type -', style: TextStyle(fontWeight: FontWeight.bold)),
                _buildTypeChip('Dry Cough', true),
                _buildTypeChip('Whopping Cough', false),
                _buildTypeChip('Productive Cough', false),
                SizedBox(height: 18),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Text('No. of Bouts-'),
                  Expanded(
                    child: TextField(),
                  )
                ],
              ),
            )
          ],
        ),
        // Note section

        //   ],)
        //   ),
        // ));
      ),
    );
  }
}
