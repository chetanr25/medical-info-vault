// lib/routes.dart
import 'package:go_router/go_router.dart';
import 'features/patient_record/presentation/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // Add more routes as needed
  ],
);
