import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('QuizAttemptScreen shows answered questions in green', (WidgetTester tester) async {
    // Surface size - Massive to prevent overflow during test
    tester.view.physicalSize = const Size(2400, 3000);
    tester.view.devicePixelRatio = 3.0;

    // Reset view keys on complete
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MaterialApp(
      home: QuizAttemptScreen(),
    ));

    // Verify Q1 circle color is White (Active) initially
    // We access the text widget inside the circle.
    final q1CircleFinder = find.text('1');
    expect(q1CircleFinder, findsOneWidget);
    expect(tester.widget<Text>(q1CircleFinder).style?.color, Colors.white);

    // Answer Q1. Find Option A.
    // We use a specific text finder that is unique enough.
    // "A. " might be found multiple times if multiple options are visible.
    // But initially only Q1 is visible.
    final optionAFinder = find.text('A. ');
    await tester.ensureVisible(optionAFinder.first);
    await tester.tap(optionAFinder.first);
    await tester.pumpAndSettle();

    // Tap Next
    final nextBtn = find.text("Soal Selanjut nya.");
    await tester.ensureVisible(nextBtn);
    await tester.tap(nextBtn);
    await tester.pumpAndSettle();

    // Now Q2 is Active. Q1 is Inactive but Answered.
    // Both should be Green (White Text).
    
    // Q1
    expect(tester.widget<Text>(q1CircleFinder).style?.color, Colors.white, reason: "Q1 should be white text (green bg) because answered");
    
    // Q2
    final q2CircleFinder = find.text('2');
    await tester.ensureVisible(q2CircleFinder); // Ensure nav bar is scrolled if needed
    expect(tester.widget<Text>(q2CircleFinder).style?.color, Colors.white, reason: "Q2 should be white text (green bg) because active");
  });
}
