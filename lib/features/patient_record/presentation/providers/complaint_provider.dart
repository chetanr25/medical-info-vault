import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'complaint_provider.g.dart';

@riverpod
class SelectedComplaints extends _$SelectedComplaints {
  @override
  List<String> build() {
    return [];
  }

  void toggleComplaint(String complaint) {
    if (state.contains(complaint)) {
      state = [...state]..remove(complaint);
    } else {
      state = [...state, complaint];
    }
  }
}
