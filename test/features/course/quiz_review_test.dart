import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_review_screen.dart'; // Import this
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:app_lms/core/providers/user_provider.dart';

void main() {
  testWidgets('Quiz Review Flow Test', (WidgetTester tester) async {
    final router = GoRouter(
      initialLocation: '/quiz-attempt',
      routes: [
        GoRoute(
          path: '/quiz-attempt', 
          builder: (context, state) => const QuizAttemptScreen()
        ),
        GoRoute(
          path: '/quiz-review', 
          builder: (context, state) {
             final questions = state.extra as List<Map<String, dynamic>>? ?? [];
             return QuizReviewScreen(questions: questions);
          }
        ),
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

    // 1. Initial State: QuizAttemptScreen
    expect(find.byType(QuizAttemptScreen), findsOneWidget);
    
    // 2. Navigate to Review (Click Selesai on last question)
    // We must tap "Soal Selanjut nya." 14 times.
    
    final nextBtn = find.text('Soal Selanjut nya.');
    
    for (int i = 0; i < 14; i++) {
      await tester.tap(nextBtn);
      await tester.pump();
    }
    
    // Now "Selesai." should be visible
    final finishBtn = find.text('Selesai.');
    expect(finishBtn, findsOneWidget);
    
    await tester.tap(finishBtn);
    await tester.pumpAndSettle(); // Animation to new screen
    
    // 3. Verify QuizReviewScreen
    expect(find.byType(QuizReviewScreen), findsOneWidget);
    expect(find.text('Review Jawaban'), findsOneWidget);
    
    // 4. Test "Lihat Soal" - Edit Question 1
    // Find first "Lihat Soal"
    final editBtn1 = find.text('Lihat Soal').first;
    await tester.tap(editBtn1);
    await tester.pumpAndSettle();
    
    // Should be back on QuizAttemptScreen at Q1
    expect(find.byType(QuizAttemptScreen), findsOneWidget);
    expect(find.text('Soal Nomor 1 / 15'), findsOneWidget);
    
    // 5. Go back to Review to Submit
    // Navigate to end again... (tedious)
    // Actually, maybe we can just tap "Selesai" if we are at Q1? No, Selesai only at end.
    // We have to Scroll to end again.
    
    for (int i = 0; i < 14; i++) {
      await tester.tap(nextBtn);
      await tester.pump();
    }
    await tester.tap(finishBtn);
    await tester.pumpAndSettle();
    
    // 6. Test "Kirim Jawaban"
    final submitBtn = find.text('Kirim Jawaban');
    // await tester.scrollUntilVisible(submitBtn, 500, scrollable: find.byType(SingleChildScrollView)); 
    // Manual drag
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();
    
    await tester.tap(submitBtn);
    await tester.pumpAndSettle();
    
    // Should pop and close 
  });
}
