import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/courses/presentation/pages/course_list_page.dart';
import 'features/courses/presentation/pages/course_detail_page.dart';
import 'features/profile/presentation/pages/profile_page.dart';
import 'features/dashboard/presentation/pages/announcement_page.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LMS App',
      theme: AppTheme.lightTheme, // Apply the custom theme
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// Basic Router Setup - Will be expanded as features are implemented
final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
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
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/announcement',
      builder: (context, state) => const AnnouncementPage(),
    ),
  ],
);
