import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'announcement_detail_page.dart';


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
                      GestureDetector(
                        onTap: () => context.push('/profile'),
                        child: Container(
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
                        onPressed: () {
                          context.push('/announcement');
                        }, 
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
                  // Banner Image Placeholder
                  GestureDetector(
                    onTap: () => context.push('/announcement-detail'), // Direct link for better UX
                    child: const MaintenanceBannerWidget(), // Shared widget from Detail Page
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
                  // Course Items
                  _buildCourseProgressItem(
                    context,
                    color: const Color(0xFFFFCC00), // Yellow-ish
                    title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                    code: 'D4SM-42-03 [ADY]',
                    progress: 0.80,
                    imageContent: _buildCourseImage(
                       type: 'text', 
                       text: 'ui', 
                       subText: 'UX',
                       color: const Color(0xFFE65100), // Deep Orange
                       bgColor: const Color(0xFFFFCC00),
                    ),
                  ),
                  _buildCourseProgressItem(
                    context,
                    color: Colors.red,
                    title: 'KEWARGANEGARAAN',
                    code: 'D4SM-41-GAB1 [BBO], JUMAT 2',
                    progress: 0.85,
                    imageContent: _buildCourseImage(
                       type: 'icon',
                       icon: Icons.local_police_outlined, // Emblem substitute
                       color: Colors.white,
                       bgColor: const Color(0xFFD32F2F),
                    ),
                  ),
                   _buildCourseProgressItem(
                    context,
                    color: Colors.blueGrey,
                    title: 'SISTEM OPERASI',
                    code: 'D4SM-44-02 [DD6]',
                    progress: 0.50,
                    imageContent: _buildCourseImage(
                       type: 'wordcloud',
                       text: 'System', 
                       color: Colors.blueGrey,
                       bgColor: Colors.white,
                       borderColor: Colors.grey[300],
                    ),
                  ),
                  _buildCourseProgressItem(
                    context,
                    color: Colors.cyan,
                    title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
                    code: 'D4SM-41-GAB1 [APJ]',
                    progress: 0.60,
                    imageContent: _buildCourseImage(
                       type: 'pattern',
                       color: Colors.cyan,
                       bgColor: Colors.cyan[50]!,
                    ),
                  ),
                  _buildCourseProgressItem(
                    context,
                    color: Colors.grey,
                    title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
                    code: 'D4SM-41-GAB1 [ARS]',
                    progress: 0.30,
                    imageContent: _buildCourseImage(
                       type: 'pattern',
                       color: Colors.blueGrey,
                       bgColor: Colors.grey[200]!,
                    ),
                  ),
                  _buildCourseProgressItem(
                    context,
                    color: Colors.blue[700]!,
                    title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
                    code: 'D4SM-43-04 [TPR]',
                    progress: 0.50,
                    imageContent: _buildCourseImage(
                       type: 'curves',
                       color: Colors.blue[900]!,
                       bgColor: Colors.blue[400]!,
                    ),
                  ),
                  _buildCourseProgressItem(
                    context,
                    color: Colors.deepPurple,
                    title: 'OLAH RAGA',
                    code: 'D3TT-44-02 [EYR]',
                    progress: 0.90,
                    imageContent: _buildCourseImage(
                       type: 'pattern',
                       color: Colors.deepPurple,
                       bgColor: Colors.deepPurple[50]!,
                    ),
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
  
  // Helper to build simulated course images
  Widget _buildCourseImage({
    required String type,
    Color? color,
    Color? bgColor,
    Color? borderColor,
    String? text,
    String? subText,
    IconData? icon,
  }) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          if (type == 'pattern') ...[
             Positioned(top: -10, left: -10, child: Icon(Icons.circle, size: 80, color: color?.withValues(alpha:0.2))),
             Positioned(bottom: -10, right: -10, child: Icon(Icons.category, size: 50, color: color?.withValues(alpha:0.3))),
          ],
          if (type == 'curves') ...[
             Positioned(top: 0, left: 0, right:0, bottom:0, child: Icon(Icons.waves, size: 80, color: color?.withValues(alpha:0.3))),
          ],
          if (type == 'text') ...[
             Center(
               child: RichText(
                 text: TextSpan(
                   children: [
                     TextSpan(text: text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
                     if (subText != null) 
                        TextSpan(
                          text: '\n$subText', 
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.white, 
                            backgroundColor: color
                          )
                        ),
                   ]
                 ),
               ),
             ),
             // Specific fix for "UI UX" graphic to look like design
             if (text == 'ui' && subText == 'UX')
              Stack(
                children: [
                   Container(color: const Color(0xFFFFCC00)),
                   Padding(
                     padding: const EdgeInsets.only(left: 4.0, top: 4),
                     child: Text('ui', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black.withValues(alpha: 0.8), height: 1)),
                   ),
                   Positioned(
                     bottom: -5,
                     right: -5,
                     child: Container(
                       padding: const EdgeInsets.all(8),
                       decoration: const BoxDecoration(color: Color(0xFFE65100), shape: BoxShape.circle),
                       child: const Text('UX', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                     ),
                   )
                ],
              )
          ], 
           if (type == 'icon') ...[
             Center(child: Icon(icon, color: color, size: 32)),
          ],
          if (type == 'wordcloud') ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text ?? '', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10)),
                   Text('Operating', style: TextStyle(color: color?.withValues(alpha:0.6), fontSize: 8)),
                   Text('Kernel', style: TextStyle(color: color?.withValues(alpha:0.4), fontSize: 6)),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildCourseProgressItem(
    BuildContext context, {
    required Color color,
    required String title, 
    required String code, 
    required double progress,
    required Widget imageContent,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          imageContent,
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
