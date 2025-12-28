import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Detail Mata Kuliah',
                style: TextStyle(fontSize: 16),
              ),
              background: Container(
                color: Colors.grey,
                child: const Center(
                  child: Icon(Icons.image, size: 80, color: Colors.white54),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pemrograman Mobile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Kode: IF-40-01 • 3 SKS',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Deskripsi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mata kuliah ini mempelajari konsep dan implementasi pengembangan aplikasi perangkat bergerak (mobile) menggunakan framework Flutter.',
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Materi Pembelajaran',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey[200]!),
                    ),
                    child: ExpansionTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        'Minggu ${index + 1}: Pengenalan Dart',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text('Belum Selesai'),
                      children: [
                        ListTile(
                          leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                          title: const Text('Slide Perkuliahan'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.video_library, color: Colors.blue),
                          title: const Text('Video Pembelajaran'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.assignment, color: Colors.orange),
                          title: const Text('Tugas Mobile 1'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  );
                },
                childCount: 14, // 14 Meetings
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Lanjutkan Belajar'),
        ),
      ),
    );
  }
}
