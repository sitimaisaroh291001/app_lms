import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_review_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';

void main() {
  group('Quiz Scoring Verification', () {
    testWidgets('QuizReviewScreen shows neutral state (no scoring) when isSubmissionResult is false', (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0,
          "correctAnswer": 0
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: questions, isSubmissionResult: false),
      ));
      await tester.pumpAndSettle();

      // Assert
      expect(find.textContaining('/ 100'), findsNothing);
      expect(find.text('Sedang Dikerjakan'), findsOneWidget);
      expect(find.text('Ubah Jawaban'), findsOneWidget);
    });

    testWidgets('QuizReviewScreen shows result state (scored) when isSubmissionResult is true', (WidgetTester tester) async {
      // Arrange
      final questions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0, // Correct
          "correctAnswer": 0
        },
        {
          "question": "Q2",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 1, // Incorrect
          "correctAnswer": 0
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: questions, isSubmissionResult: true),
      ));
      await tester.pumpAndSettle();

      // Assert
      // Should show score (50 / 100)
      expect(find.text('50 / 100'), findsOneWidget);
      
      // Should show status "Selesai"
      expect(find.text('Selesai'), findsOneWidget);

      // Should show "Jawaban Benar" for incorrect answer
      expect(find.textContaining('Jawaban Benar'), findsOneWidget);

      // Should NOT show "Ubah Jawaban"
      expect(find.text('Ubah Jawaban'), findsNothing);
      
      // Should show validation icons (check/cancel)
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      expect(find.byIcon(Icons.cancel), findsOneWidget);
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
