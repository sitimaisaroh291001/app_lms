import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/courses/presentation/pages/course_list_page.dart';
import 'features/courses/presentation/pages/course_detail_page.dart';
import 'features/course/presentation/course_detail_screen.dart'; // Import New Screen
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/dashboard/presentation/pages/announcement_page.dart';
import 'features/dashboard/presentation/pages/announcement_detail_page.dart';
import 'features/notification/presentation/pages/notification_page.dart';
import 'features/course/presentation/quiz_detail_screen.dart';
import 'features/course/presentation/quiz_attempt_screen.dart';
import 'features/course/presentation/quiz_review_screen.dart';
import 'package:provider/provider.dart';
import 'core/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const LMSApp(),
    ),
  );
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ASCEND',
      theme: AppTheme.lightTheme, // Apply the custom theme
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// Basic Router Setup - Will be expanded as features are implemented
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/course-list',
      builder: (context, state) => const CourseListPage(),
    ),
    GoRoute(
      path: '/course-detail',
      builder: (context, state) => const CourseDetailPage(),
    ),
    GoRoute(
      path: '/quiz-detail',
      builder: (context, state) => const QuizDetailScreen(), // New Screen
    ),
    GoRoute(
      path: '/quiz-attempt',
      builder: (context, state) => const QuizAttemptScreen(), // New Screen
    ),
    GoRoute(
      path: '/course-detail-tabs',
      builder: (context, state) => const CourseDetailScreen(), // New Screen
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/announcement',
      builder: (context, state) => const AnnouncementPage(),
    ),
    GoRoute(
      path: '/announcement-detail',
      builder: (context, state) => const AnnouncementDetailPage(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/quiz-review',
      builder: (context, state) {
        final questions = state.extra as List<Map<String, dynamic>>? ?? [];
        return QuizReviewScreen(questions: questions);
      }, 
    ),
  ],
);
