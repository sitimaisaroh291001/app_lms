import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_review_screen.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';

void main() {
  group('Quiz Scoring Verification', () {
    testWidgets('QuizReviewScreen calculates 100% score correctly', (WidgetTester tester) async {
      // Arrange
      final correctQuestions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0,
          "correctAnswer": 0
        },
        {
          "question": "Q2",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 1,
          "correctAnswer": 1
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: correctQuestions),
      ));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('100 / 100'), findsOneWidget);
    });

    testWidgets('QuizReviewScreen calculates 50% score correctly', (WidgetTester tester) async {
      // Arrange
      final mixedQuestions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0, // Correct
          "correctAnswer": 0
        },
        {
          "question": "Q2",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 0, // Incorrect (should be 1)
          "correctAnswer": 1
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: mixedQuestions),
      ));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('50 / 100'), findsOneWidget);
      expect(find.text('Jawaban Tersimpan'), findsNWidgets(2));
    });

    testWidgets('QuizReviewScreen calculates 0% score correctly', (WidgetTester tester) async {
       // Arrange
      final wrongQuestions = [
        {
          "question": "Q1",
          "options": ["A", "B", "C", "D", "E"],
          "selected": 1, // Wrong
          "correctAnswer": 0
        },
      ];

      // Act
      await tester.pumpWidget(MaterialApp(
        home: QuizReviewScreen(questions: wrongQuestions),
      ));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('0 / 100'), findsOneWidget);
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
