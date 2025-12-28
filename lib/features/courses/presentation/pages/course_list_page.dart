import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/presentation/widgets/course_thumbnail.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  final int _selectedIndex = 1; // "Kelas Saya" is index 1

  @override
  Widget build(BuildContext context) {
    // Exact Course Data from Screenshot
    final courses = [
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
        'year': '2021/2',
        'progress': 0.89,
        'thumbnail': const CourseThumbnail(
           type: 'text', 
           text: 'ui', 
           subText: 'UX',
           color: Color(0xFFE65100), 
           bgColor: Color(0xFFFFCC00),
           size: 100,
        ),
      },
      {
        'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO], JUMAT 2',
        'year': '2021/2',
        'progress': 0.86,
        'thumbnail': const CourseThumbnail(
           type: 'icon',
           icon: Icons.local_police_outlined, 
           color: Colors.white,
           bgColor: Color(0xFFD32F2F),
           size: 100,
        ),
      },
      {
        'title': 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
        'year': '2021/2',
        'progress': 0.90,
        'thumbnail': CourseThumbnail(
           type: 'wordcloud',
           text: 'System', 
           color: Colors.blueGrey,
           bgColor: Colors.white,
           borderColor: Colors.grey[300],
           size: 100,
        ),
      },
      {
        'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
        'year': '2021/2',
        'progress': 0.90,
        'thumbnail': const CourseThumbnail(
           type: 'pattern',
           color: Colors.cyan,
           bgColor: Color(0xFFE0F7FA), // Light Cyan
           size: 100,
        ),
      },
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
        'year': '2021/2',
        'progress': 0.80,
        'thumbnail': const CourseThumbnail(
           type: 'pattern',
           color: Colors.blueGrey,
           bgColor: Color(0xFFEEEEEE), // Grey 200
           size: 100,
        ),
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
        'year': '2021/2',
        'progress': 0.90,
        'thumbnail': const CourseThumbnail(
           type: 'curves',
           color: Color(0xFF0D47A1), // Blue 900
           bgColor: Color(0xFF42A5F5), // Blue 400
           size: 100,
        ),
      },
      {
        'title': 'OLAH RAGA\nD3TT-44-02 [EYR]',
        'year': '2021/2',
        'progress': 0.90,
        'thumbnail': const CourseThumbnail(
           type: 'pattern',
           color: Colors.deepPurple,
           bgColor: Color(0xFFEDE7F6), // Deep Purple 50
           size: 100,
        ),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
             // If navigating back to Dashboard, better to just go to Dashboard route to reset state if needed
             // But pop is fine if pushed from Dashboard
             if (context.canPop()) {
               context.pop();
             } else {
               context.go('/dashboard');
             }
          }, 
        ),
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: courses.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final course = courses[index];
          return GestureDetector(
            onTap: () => context.push('/course-detail'),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                 SizedBox(
                   width: 100,
                   height: 100,
                   child: course['thumbnail'] as Widget,
                 ),
                 const SizedBox(width: 16),
                 
                 // Details
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         course['year'] as String,
                         style: const TextStyle(fontSize: 10, color: Colors.grey),
                       ),
                       const SizedBox(height: 4),
                       Text(
                         course['title'] as String,
                         style: const TextStyle(
                           fontSize: 12,
                           fontWeight: FontWeight.bold,
                           height: 1.2,
                         ),
                       ),
                       const SizedBox(height: 12),
                       
                       // Progress
                       ClipRRect(
                         borderRadius: BorderRadius.circular(4),
                         child: LinearProgressIndicator(
                           value: course['progress'] as double,
                           minHeight: 8,
                           backgroundColor: Colors.grey[300],
                           color: const Color(0xFFAD1F2D), // Specific Red from design
                         ),
                       ),
                       const SizedBox(height: 4),
                       Text(
                         '${((course['progress'] as double) * 100).toInt()} % Selesai',
                         style: const TextStyle(fontSize: 10, color: Colors.grey),
                       ),
                     ],
                   ),
                 )
              ],
            ),
          );
        },
      ),
      // Bottom Navigation Bar
       bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
             BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), 
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex, // Index 1
            backgroundColor: const Color(0xFFBE1E2D), // Primary Red
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withValues(alpha: 0.6),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == 0) context.go('/dashboard'); // Use go to reset stack if needed
              if (index == 2) context.push('/notification');
              if (index == 3) context.push('/profile');
               // If index == 1, do nothing as we are here
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile', 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
