import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/course_detail_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_detail_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:app_lms/core/providers/user_provider.dart';

// Mock Router to verify navigation
class MockNavigatorObserver extends NavigatorObserver {
  final List<String> pushedRoutes = [];
  
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      pushedRoutes.add(route.settings.name!);
    }
    // For GoRouter, we might need to check logic differently or just test the widgets in isolation with a real router
    super.didPush(route, previousRoute);
  }
}

void main() {
  testWidgets('Quiz Navigation Flow Test', (WidgetTester tester) async {
    // We need to wrap the screen in a generic MaterialApp with GoRouter to test navigation properly
    // However, testing GoRouter paths with simple widget tests can be tricky. 
    // A simpler approach for unit testing the WIDGETS is checking callbacks or if specific widgets are present.
    // For navigation verification with GoRouter, we can assert that the correct context.push was called 
    // if we could mock the context, but GoRouter is part of the context.
    
    // Instead, let's setup a test app with the real router configuration or a simplified one.
    
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const CourseDetailScreen()),
        GoRoute(path: '/quiz-detail', builder: (context, state) => const QuizDetailScreen()),
        GoRoute(path: '/quiz-attempt', builder: (context, state) => const QuizAttemptScreen()),
      ],
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
        child: MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );

    // 1. Initial State: CourseDetailScreen
    expect(find.byType(CourseDetailScreen), findsOneWidget);
    
    // 2. Tap "Tugas Dan Kuis" tab
    await tester.tap(find.text('Tugas Dan Kuis'));
    await tester.pumpAndSettle();
    
    // 3. Find Quiz Item and Tap
    // Look for "Quiz Review 01"
    final quizItemInfo = find.text('Quiz Review 01');
    expect(quizItemInfo, findsOneWidget);
    
    await tester.tap(quizItemInfo);
    await tester.pumpAndSettle();
    
    // 4. Verify we are on QuizDetailScreen
    expect(find.byType(QuizDetailScreen), findsOneWidget);
    expect(find.text('Quiz Review 1'), findsOneWidget); // Title in QuizDetailScreen
    
    // 5. Tap "Ambil Kuis"
    final ambilKuisBtn = find.text('Ambil Kuis');
    await tester.scrollUntilVisible(ambilKuisBtn, 500.0);
    await tester.tap(ambilKuisBtn);
    await tester.pumpAndSettle();
    
    // 6. Verify we are on QuizAttemptScreen
    expect(find.byType(QuizAttemptScreen), findsOneWidget);
    expect(find.text('Soal Nomor 1 / 15'), findsOneWidget);
    
    // 7. Test Question Navigation
    // Tap Next
    final nextBtn = find.text('Soal Selanjut nya.');
    await tester.tap(nextBtn);
    await tester.pump(); // Rebuild
    
    expect(find.text('Soal Nomor 2 / 15'), findsOneWidget);
    
    // Tap Prev
    final prevBtn = find.text('Soal Sebelum nya.');
    await tester.tap(prevBtn);
    await tester.pump();
    
    expect(find.text('Soal Nomor 1 / 15'), findsOneWidget);
  });
}
