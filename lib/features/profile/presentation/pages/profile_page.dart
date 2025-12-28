import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBE1E2D), // Primary Red
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                   IconButton(
                     icon: const Icon(Icons.arrow_back, color: Colors.white),
                     onPressed: () => context.pop(),
                   ),
                ],
              ),
            ),
            
            // Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 16),
            const Text(
              'DANDY CANDRA PRATAMA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Tab Content Area
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -5))
                  ]
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      indicatorColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 3,
                      tabs: const [
                        Tab(text: 'About Me'),
                        Tab(text: 'Kelas'),
                        Tab(text: 'Edit Profile'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildAboutMeTab(),
                          _buildKelasTab(),
                          _buildEditProfileTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Consistent Bottom Navigation Bar as per Design
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
            currentIndex: 2, // Profile Tab selected
            backgroundColor: const Color(0xFFBE1E2D), 
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withValues(alpha: 0.6),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
               if (index == 0) context.go('/dashboard');
               if (index == 1) context.push('/course-list');
               // index 2 is current
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

  Widget _buildAboutMeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi User',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildInfoItem('Email address', 'dandycandra@365.telkomuniversity.ac.id'),
          _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
          _buildInfoItem('Fakultas', 'FIT'),
          
          const SizedBox(height: 24),
           const Text(
            'Aktivitas Login',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
           const SizedBox(height: 16),
          _buildInfoItem('First access to site', 'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)'),
          _buildInfoItem('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM (now)'),
          
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBE1E2D),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => context.go('/login'),
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildKelasTab() {
     final courses = [
      {'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC', 'code': 'D4SM-41-GAB1 [ARS]', 'date': 'Monday, 8 February 2021'},
      {'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA', 'code': 'D4SM-42-03 [ADY]', 'date': 'Monday, 8 February 2021'},
      {'title': 'KEWARGANEGARAAN', 'code': 'D4SM-41-GAB1 [BBO], JUMAT 2', 'date': 'Monday, 8 February 2021'},
      {'title': 'OLAH RAGA', 'code': 'D3TT-44-02 [EYR]', 'date': 'Monday, 8 February 2021'},
       {'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF', 'code': 'D4SM-43-04 [TPR]', 'date': 'Monday, 8 February 2021'},
       {'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA', 'code': 'D4SM-41-GAB1 [APJ]', 'date': 'Monday, 8 February 2021'},
       {'title': 'SISTEM OPERASI', 'code': 'D4SM-44-02 [DDS]', 'date': 'Monday, 8 February 2021'},

    ];
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                 width: 60,
                 height: 40,
                 decoration: BoxDecoration(
                   color: Colors.blue[300],
                   borderRadius: BorderRadius.circular(20), // Pill shape in design
                 ),
               ),
               const SizedBox(width: 16),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(course['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                     Text(course['code']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                     const SizedBox(height: 4),
                     Text('Tanggal Mulai ${course['date']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                   ],
                 )
               )
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           _buildTextField('Nama Pertama'),
           _buildTextField('Nama Terakhir'),
           _buildTextField('E-mail Address'),
           _buildTextField('Negara'),
           _buildTextField('Deskripsi', maxLines: 5),
           const SizedBox(height: 24),
           Align(
             alignment: Alignment.centerRight,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.grey[100],
                 foregroundColor: Colors.black,
                 elevation: 0,
               ),
               onPressed: (){},
               child: const Text('Simpan'),
             ),
           )
        ],
      ),
    );
  }
  
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.grey)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          )
        ],
      ),
    );
  }
}
