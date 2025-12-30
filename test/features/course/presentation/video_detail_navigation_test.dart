import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/main.dart';
import 'package:provider/provider.dart';
import 'package:app_lms/core/providers/user_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:app_lms/features/course/presentation/course_detail_screen.dart';
import 'package:app_lms/features/course/presentation/video_detail_screen.dart';

void main() {
  testWidgets('Navigation to Video Detail Screen works', (WidgetTester tester) async {
    // Increase surface size
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;
    
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp.router(
          routerConfig: GoRouter(
            initialLocation: '/course-detail-tabs',
            routes: [
              GoRoute(
                path: '/course-detail-tabs',
                builder: (context, state) => const CourseDetailScreen(),
              ),
              GoRoute(
                path: '/video-detail',
                builder: (context, state) => const VideoDetailScreen(),
              ),
               GoRoute(
                 path: '/material-detail',
                 builder: (context, state) => const Scaffold(body: Text("Material Detail")),
               ),
               GoRoute(
                 path: '/quiz-detail',
                 builder: (context, state) => const Scaffold(body: Text("Quiz Detail")),
               ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Tap "Pertemuan 1"
    final pertemuan1Finder = find.text('Pertemuan 1');
    await tester.ensureVisible(pertemuan1Finder);
    await tester.pumpAndSettle();
    await tester.tap(pertemuan1Finder);
    await tester.pumpAndSettle();

    // Find the video link
    final videoLinkFinder = find.textContaining('User Interface Design for Beginner');
    
    // Use ensureVisible which automatically scrolls
    await tester.ensureVisible(videoLinkFinder);
    await tester.pumpAndSettle();

    expect(videoLinkFinder, findsOneWidget);

    // Tap the video link
    await tester.tap(videoLinkFinder);
    await tester.pumpAndSettle();

    expect(find.text('Video - User Interface Design For Beginner'), findsOneWidget);
  });
}
