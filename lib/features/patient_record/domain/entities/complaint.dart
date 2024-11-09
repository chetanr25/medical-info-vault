// lib/features/patient_record/domain/entities/complaint.dart
class Complaint {
  final String id;
  final String name;
  final bool isSelected;

  Complaint({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  Complaint copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return Complaint(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
