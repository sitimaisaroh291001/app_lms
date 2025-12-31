import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/quiz_attempt_screen.dart';

void main() {
  testWidgets('Answered question number turns green', (WidgetTester tester) async {
    // Surface size
    tester.view.physicalSize = const Size(1080, 2400); 
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(const MaterialApp(
      home: QuizAttemptScreen(),
    ));

    // Select an option for Q1 (Option A)
    // Find the text "A. " inside a row to ensure we tap the right clickable area
    final optionA = find.text('A. ');
    await tester.tap(optionA);
    await tester.pump();

    // Verify selection (Option container turns red)
    // We check if "A. " ancestor container has Color(0xFFEB5757)
    final optionContainer = find.ancestor(of: optionA, matching: find.byType(Container)).first;
    // Note: The structure is GestureDetector -> Container -> Row -> [Text, SizedBox, Expanded(Text)]
    // So ancestor container of optionA text is the one with decoration.
    final containerWidget = tester.widget<Container>(optionContainer);
    final decoration = containerWidget.decoration as BoxDecoration;
    expect(decoration.color, const Color(0xFFEB5757), reason: "Option A select color validation");

    // Move to Q2
    final nextButton = find.text('Soal Selanjut nya.');
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    // Verify we are on Q2
    expect(find.text("Soal Nomor 2 / 15"), findsOneWidget);

    // Now check Q1 indicator
    // Q1 indicator text is "1"
    final q1Text = find.text('1');
    final q1IndicatorContainer = find.ancestor(of: q1Text, matching: find.byType(Container)).first;
    
    final indicatorWidget = tester.widget<Container>(q1IndicatorContainer);
    final indicatorDecoration = indicatorWidget.decoration as BoxDecoration;
    
    // It should be Green (Active or Answered)
    expect(indicatorDecoration.color, const Color(0xFF2ECC71), reason: "Answered question indicator should be green");
    
    // Also check text color is white
    final textWidget = tester.widget<Text>(q1Text);
    expect(textWidget.style?.color, Colors.white, reason: "Answered question text should be white");
  });
}
