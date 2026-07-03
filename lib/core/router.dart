import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/result_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/quiz/:category',
      builder: (context, state) => QuizScreen(category: state.pathParameters['category']!),
    ),
    GoRoute(path: '/result', builder: (context, state) => const ResultScreen()),
  ],
);