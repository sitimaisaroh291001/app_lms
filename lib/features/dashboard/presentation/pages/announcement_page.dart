import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final announcements = [
      {
        'title': 'Maintenance Pra UAS Semester Genap 2020/2021',
        'author': 'Admin Celoe',
        'date': 'Rabu, 2 Juni 2021, 10:45',
      },
      {
        'title': 'Pengumuman Maintance',
        'author': 'Admin Celoe',
        'date': 'Senin, 11 Januari 2021, 7:52',
      },
      {
        'title': 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
        'author': 'Admin Celoe',
        'date': 'Minggu, 10 Januari 2021, 9:30',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengumuman',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: announcements.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final item = announcements[index];
          return InkWell(
            onTap: () {
               if (item['title']!.contains('Maintenance Pra UAS Semester Genap')) {
                 context.push('/announcement-detail');
               } else {
                 showDialog(
                   context: context, 
                   builder: (c) => AlertDialog(
                     title: Text(item['title']!), 
                     content: const Text('Detail pengumuman akan ditampilkan di sini.'),
                     actions: [TextButton(onPressed: ()=>Navigator.pop(c), child: const Text('Tutup'))]
                   )
                 );
               }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Megaphone Icon
                const Icon(Icons.campaign, size: 32, color: Colors.black),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500, // Medium/Semi-bold
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'By ${item['author']} - ${item['date']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
