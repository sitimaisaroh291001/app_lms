import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Red Header Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 140, // Adjust height as needed
            child: Container(
              color: const Color(0xFFC00000), // Deep Red
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  // 1. Header Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Halo,',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'MAHASISWA TELKOM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA00000), // Slightly darker red for badge
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white30),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'MAHASISWA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person, size: 20, color: Color(0xFFC00000)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // 2. Tugas Yang Akan Datang (Upcoming Task)
                  const Text(
                    'Tugas Yang Akan Datang',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC00000), // Red Card
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tugas 01 - UID Android Mobile Game',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Waktu Pengumpulan',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                         const Text(
                          'Jumat 26 Februari, 23:59 WIB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // 3. Pengumuman Terakhir
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pengumuman Terakhir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      TextButton(
                        onPressed: () {}, 
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Lihat Semua', 
                          style: TextStyle(color: Colors.blue, fontSize: 12)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Maintenance Pra UAS Semester Genap 2020/2021',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  // Banner Image Placeholder
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                         Positioned(
                           right: 0,
                           bottom: 0,
                           child: Icon(Icons.build_circle_outlined, size: 80, color: Colors.blue.withValues(alpha: 0.2)),
                         ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.image, size: 40, color: Colors.grey),
                              SizedBox(height: 8),
                              Text('Banner Announcement', style: TextStyle(color: Colors.grey, fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 4. Progres Kelas
                  const Text(
                    'Progres Kelas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Course Items
                  _buildCourseProgressItem(
                    context,
                    'ui',
                    const Color(0xFFFFD700), // Yellow
                    const Color(0xFFE65100), // Orange
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    'D4SM-42-03 [ADY]',
                    0.80,
                  ),
                  _buildCourseProgressItem(
                    context,
                    'pk',
                    Colors.red,
                    Colors.red[800]!,
                    'KEWARGANEGARAAN',
                    'D4SM-41-GAB1 [BBO], JUMAT 2',
                    0.85,
                  ),
                   _buildCourseProgressItem(
                    context,
                    'so',
                    Colors.blueGrey,
                    Colors.blueGrey[800]!,
                    'SISTEM OPERASI',
                    'D4SM-44-02 [DD6]',
                    0.50,
                  ),
                  const SizedBox(height: 100), // Bottom padding for FAB/Nav
                ],
              ),
            ),
          ),
        ],
      ),
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
            currentIndex: _selectedIndex,
            backgroundColor: const Color(0xFFBE1E2D), // Primary Red
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withValues(alpha: 0.6),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 1) context.push('/course-list');
              if (index == 2) context.push('/profile');
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
                icon: Icon(Icons.person),
                label: 'Profile', // Request said "Profile", UI might imply Notifikasi, keeping Profile as per request
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseProgressItem(
    BuildContext context, 
    String iconTag, 
    Color color1, 
    Color color2, 
    String title, 
    String code, 
    double progress
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(4), // Slightly rounded square
            ),
            child: Center(
              child: Text(
                iconTag.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                // Progress Bar
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          color: const Color(0xFFC00000), // Red Progress
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                 Text(
                   '${(progress * 100).toInt()}% Selesai',
                   style: const TextStyle(fontSize: 10, color: Colors.grey),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
