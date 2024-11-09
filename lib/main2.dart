import 'package:flutter/material.dart';

void main() {
  runApp(PatientRecordScreenM());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {/* Handle navigation */},
        ),
        title: Row(
          children: [
            TextButton(
              child:
                  Text('Past Records', style: TextStyle(color: Colors.white)),
              onPressed: () {/* Handle navigation */},
            ),
            TextButton(
              child:
                  Text('Change Patient', style: TextStyle(color: Colors.white)),
              onPressed: () {/* Handle navigation */},
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Row(
        children: [
          Expanded(child: PatientRecordScreen()),
          Expanded(child: History()),
        ],
      ),
    );
  }
}

class PatientRecordScreenM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class PatientRecordScreen extends StatefulWidget {
  @override
  _PatientRecordScreenState createState() => _PatientRecordScreenState();
}

class _PatientRecordScreenState extends State<PatientRecordScreen> {
  final List<String> complaints = [
    'Cough',
    'Cold',
    'Abdominal pain',
    'Headache',
    'Chest pain',
    'Tingling',
    'Rash',
    'Shortness of breath',
    'heartburn'
  ];

  List<String> selectedComplaints = ['Cough'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Navigation Buttons
              Row(
                children: [
                  _buildNavButton('Chief Complaint', true),
                  _buildNavButton('Findings', false),
                  _buildNavButton('Past History', false),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildNavButton('Investigations', false),
                  _buildNavButton('Diagnosis', false),
                  _buildNavButton('Medications', false),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildNavButton('Lifestyle Advice', false),
                  _buildNavButton('Comments', false),
                  _buildNavButton('Follow Up', false),
                ],
              ),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Chief Complaints',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.blue),
                    onPressed: () {/* Handle add */},
                  ),
                ),
              ),

              // Complaint Tags
              Wrap(
                spacing: 8,
                children: complaints.map((complaint) {
                  bool isSelected = selectedComplaints.contains(complaint);
                  return FilterChip(
                    label: Text(complaint),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedComplaints.add(complaint);
                        } else {
                          selectedComplaints.remove(complaint);
                        }
                      });
                    },
                    backgroundColor:
                        isSelected ? Colors.green : Colors.blue[100],
                    labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black),
                  );
                }).toList(),
              ),
/*
              // Cough History Section
             
            */
            ],
          ),
        ),
      ),
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
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
    return Container(
      child: Card(
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
