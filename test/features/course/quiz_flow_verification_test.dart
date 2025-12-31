import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_review_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';

void main() {
  group('Quiz Scoring Verification', () {
    testWidgets('QuizReviewScreen shows neutral state (no scoring)', (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0,
          "correctAnswer": 0
        },
        {
          "question": "Q2",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 1, // Wrong
          "correctAnswer": 0
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: questions),
      ));
      await tester.pumpAndSettle();

      // Assert
      // Should NOT show score
      expect(find.textContaining('/ 100'), findsNothing);
      
      // Should show status "Sedang Dikerjakan"
      expect(find.text('Sedang Dikerjakan'), findsOneWidget);

      // Should NOT show "Jawaban Benar"
      expect(find.text('Jawaban Benar'), findsNothing);

      // Should show "Ubah Jawaban"
      expect(find.text('Ubah Jawaban'), findsWidgets);
    });
  });

  group('Quiz Attempt Verification', () {
    testWidgets('QuizAttemptScreen shows first question correctly', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(const MaterialApp(
        home: QuizAttemptScreen(),
      ));
      await tester.pumpAndSettle();

      // Assert
      // Check for first question text from the hardcoded list
      expect(find.textContaining('Radio button dapat digunakan untuk menentukan?'), findsOneWidget);
      expect(find.text('Soal Nomor 1 / 15'), findsOneWidget);
      expect(find.text('15 : 00'), findsOneWidget);
    });
  });
}
