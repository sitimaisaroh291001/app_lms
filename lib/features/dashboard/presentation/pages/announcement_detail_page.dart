import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnnouncementDetailPage extends StatelessWidget {
  const AnnouncementDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Maintenance Pra UAS Semester Genap 2020/2021',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Metadata
            Row(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Banner Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/maintenance_banner.png',
                width: double.infinity, 
                fit: BoxFit.fitWidth,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Content
            const Text(
              'Maintenance LMS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).',
              style: TextStyle(height: 1.5, fontSize: 13),
              textAlign: TextAlign.justify,
            ),
             const SizedBox(height: 16),
             const Text(
              'Dengan adanya kegiatan maintenance tersebut maka situs LMS (lms.telkomuniversity.ac.id) tidak dapat diakses mulai pukul 00.00 s/d 06.00 WIB.',
              style: TextStyle(height: 1.5, fontSize: 13),
               textAlign: TextAlign.justify,
            ),
             const SizedBox(height: 16),
             const Text(
              'Demikian informasi ini kami sampaikan, mohon maaf atas ketidaknyamanannya.',
              style: TextStyle(height: 1.5, fontSize: 13),
               textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            Text(
              'Hormat Kami,\nCeLOE Telkom University',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}


