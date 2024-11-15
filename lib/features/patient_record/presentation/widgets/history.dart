import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      backgroundColor: isSelected ? Colors.blue : Colors.white12,
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
      // appBar: AppBar(
      //   title: Text('History of Cough:'),
      // ),
      body: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          // side: BorderSide(),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
            bottomLeft: const Radius.circular(0),
            bottomRight: const Radius.circular(0),
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Back'),
                    onPressed: () {/* Handle save */},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  Text('History of Cough:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              Gap(10),
              Text('Duration-'),
              // Grid for duration (you'd implement a proper grid here)
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Text
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 8.0),
                    //   child: Text(
                    //     'Duration-',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // Table
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Table(
                        border: TableBorder.all(color: Colors.grey),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          // First Row
                          TableRow(
                            children: List.generate(
                              6,
                              (index) => Container(
                                height: 40,
                                child: Center(child: Text('')),
                              ),
                            ),
                          ),
                          // Second Row
                          TableRow(
                            children: List.generate(
                              6,
                              (index) => Container(
                                height: 40,
                                child: Center(child: Text('')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 100,
              //   decoration: BoxDecoration(
              //     border: Border.all(),
              //   ),
              // ),
              Gap(10),
              // Severity input field
              Row(
                children: [
                  Text('Severity'),
                  SizedBox(width: 8),
                  Expanded(
                    child: Row(
                      // direction: Axis.vertical,
                      // spacing: 8,
                      // runSpacing: 8,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                  // Expanded(
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black54),
                        hintText: 'Add note',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Gap(10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Question'),
                    onPressed: () {/* Handle add question */},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
              // Wrap(
              //   alignment: WrapAlignment.start,
              //   spacing: 8,
              //   children: [
              //     Text('Type -', style: TextStyle(fontWeight: FontWeight.bold)),
              //     _buildTypeChip('Dry Cough', true),
              //     _buildTypeChip('Whopping Cough', false),
              //     _buildTypeChip('Productive Cough', false),
              //   ],
              // ),
              // SizedBox(height: 18),
              // // Note section
              // Row(
              //   children: [
              //     TextButton.icon(
              //       icon: Icon(Icons.add),
              //       label: Text('Add Question'),
              //       onPressed: () {/* Handle add question */},
              //       style: TextButton.styleFrom(foregroundColor: Colors.blue),
              //     ),
              //     Expanded(
              //       child: TextField(
              //         decoration: InputDecoration(
              //           hintText: 'Add note',
              //           border: OutlineInputBorder(),
              //         ),
              //       ),
              //     ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
