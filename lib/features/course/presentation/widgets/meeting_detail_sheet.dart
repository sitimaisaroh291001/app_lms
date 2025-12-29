
import 'package:flutter/material.dart';

class MeetingDetailSheet extends StatelessWidget {
  const MeetingDetailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // Use 90% of screen height to allow scrolling
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          const SizedBox(height: 12),
          // Handle
          Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Pengantar User Interface Design",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: "Lampiran Materi"),
                      Tab(text: "Tugas dan Kuis"),
                    ],
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _AttachmentsTab(),
                        _TasksTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachmentsTab extends StatelessWidget {
  const _AttachmentsTab();

  @override
  Widget build(BuildContext context) {
    final attachments = [
      {'title': 'Zoom Meeting Syncronous', 'type': 'link'},
      {'title': 'Pengantar User Interface Design', 'type': 'pdf'},
      {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'pdf'},
      {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'pdf'},
      {'title': 'User Interface Design for Beginner', 'type': 'video'},
      {'title': '20 Prinsip Desain', 'type': 'link'},
      {'title': 'Best Practice UI Design', 'type': 'link'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: attachments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = attachments[index];
        IconData icon;
        switch (item['type']) {
          case 'link':
            icon = Icons.link;
            break;
          case 'pdf':
            icon = Icons.description_outlined;
            break;
          case 'video':
            icon = Icons.video_library_outlined;
            break;
          default:
            icon = Icons.insert_drive_file_outlined;
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(icon, color: Colors.black87),
            title: Text(
              item['title']!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            trailing: const Icon(Icons.check_circle, color: Color(0xFF2ECC71)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        );
      },
    );
  }
}

class _TasksTab extends StatelessWidget {
  const _TasksTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // If you have the image asset, use it here. 
          // Since I don't have the "girl falling" illustration, I'll use a placeholder icon.
          Icon(Icons.image_outlined, size: 120, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text(
            "Tidak Ada Tugas Dan Kuis Hari Ini",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
