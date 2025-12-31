import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:app_lms/features/course/presentation/quiz_detail_screen.dart';
import 'package:app_lms/features/course/presentation/course_detail_screen.dart';
import 'package:app_lms/features/course/presentation/widgets/meeting_detail_sheet.dart';

void main() {
  testWidgets('Deep Link Navigation Test: QuizDetail -> CourseDetail -> MeetingSheet', (WidgetTester tester) async {
    // Setup Router for testing
    final router = GoRouter(
      initialLocation: '/quiz-detail',
      routes: [
        GoRoute(
          path: '/quiz-detail',
          builder: (context, state) => const QuizDetailScreen(),
        ),
        GoRoute(
          path: '/course-detail-tabs',
          builder: (context, state) => const CourseDetailScreen(),
        ),
      ],
    );

    // Set surface size to ensure no overflow
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));
    await tester.pumpAndSettle();

    // 1. Verify we are on QuizDetailScreen
    expect(find.text("Quiz Review 1"), findsOneWidget);
    expect(find.text("Kembali Ke Kelas"), findsOneWidget);

    // 2. Tap "Kembali Ke Kelas"
    await tester.tap(find.text("Kembali Ke Kelas"));
    
    // Pump frames to handle animation and async operations
    await tester.pump(); 
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();

    // 3. Verify we navigated to CourseDetailScreen
    // Check if the widget type exists first to isolate navigation vs rendering issues
    expect(find.byType(CourseDetailScreen), findsOneWidget);
    
    // Check for TabBar tabs
    expect(find.text("Materi"), findsOneWidget);
    
    // 4. Verify MeetingDetailSheet is open
    expect(find.byType(MeetingDetailSheet), findsOneWidget);
    
    // Also verify the content in the sheet
    expect(find.text("Deskripsi"), findsOneWidget);
  });
}
