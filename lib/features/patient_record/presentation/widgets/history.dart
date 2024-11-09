import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  Widget _buildTypeChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          // Handle selection
        });
      },
      backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }

  Widget _buildNavButton(String text, bool isActive) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {/* Handle navigation */},
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of Cough:'),
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('History of Cough:'),
                  TextButton(
                    child: Text('Save'),
                    onPressed: () {/* Handle save */},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Text('Duration-'),
              // Grid for duration (you'd implement a proper grid here)
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
              ),
              Text('Severity-'),
              // Severity input field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              // Type selection
              Text('Type-'),
              Wrap(
                spacing: 8,
                children: [
                  _buildTypeChip('Dry Cough', true),
                  _buildTypeChip('Whopping Cough', false),
                  _buildTypeChip('Productive Cough', false),
                ],
              ),
              // Note section
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add note',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Add Question'),
                    onPressed: () {/* Handle add question */},
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
