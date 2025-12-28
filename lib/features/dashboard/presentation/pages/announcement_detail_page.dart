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
            
            // Banner Image Simulation (Sophisticated)
            const MaintenanceBannerWidget(),
            
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

class MaintenanceBannerWidget extends StatelessWidget {
  const MaintenanceBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light Blue
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
            // Background Elements (Grid/Clouds)
            Positioned(
              right: 20,
              top: 20,
              child: Icon(Icons.cloud, color: Colors.white.withValues(alpha: 0.5), size: 40),
            ),
            Positioned(
              left: 40,
              bottom: 40,
              child: Icon(Icons.cloud, color: Colors.white.withValues(alpha: 0.5), size: 60),
            ),
            
            // Central Laptop & Graphics
            Center(
              child: SizedBox(
                width: 200,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Laptop Screen Body
                    Positioned(
                      bottom: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 160,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[400]!, width: 4),
                            ),
                            child: Center(
                              child: Container(
                                width: 140,
                                height: 80,
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                     Container(color: Colors.red[50]),
                                     Center(child: Icon(Icons.warning_amber_rounded, size: 40, color: Colors.orange)),
                                     // "Maintenance" text inside screen
                                     Positioned(
                                       bottom: 5,
                                       left: 0, 
                                       right: 0,
                                       child: Text(
                                         'MAINTENANCE',
                                         textAlign: TextAlign.center,
                                         style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red),
                                       ),
                                     )
                                  ]
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    // Workers
                    Positioned(
                      bottom: 20,
                      left: 0,
                      child: Icon(Icons.engineering, color: Colors.orange[800], size: 30),
                    ),
                    Positioned(
                      top: 10,
                      right: 10, // Sitting on top
                      child: Icon(Icons.person, color: Colors.deepPurple[400], size: 24),
                    ),
                    
                    // Gear Icons
                     Positioned(
                      top: 40,
                      left: -20,
                      child: Icon(Icons.settings, color: Colors.orange, size: 24),
                    ),
                     Positioned(
                      bottom: 40,
                      right: -10,
                      child: Icon(Icons.settings, color: Colors.orange, size: 18),
                    ),
                    
                    // Construction Tape
                    Positioned(
                      bottom: 50,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          gradient: LinearGradient(
                            stops: const [0.1, 0.1, 0.2, 0.2, 0.3, 0.3],
                            colors: [
                              Colors.yellow,
                              Colors.black,
                              Colors.yellow,
                              Colors.black,
                              Colors.yellow,
                              Colors.black
                            ],
                            tileMode: TileMode.repeated
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
             // Text: Maintenance LMS
             Positioned(
               top: 20,
               left: 24,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Row(
                      children: const [
                         Icon(Icons.school, size: 16, color: Colors.red),
                         SizedBox(width: 4),
                         Text('Telkom University', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Maintenance LMS', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
                 ],
               ),
             )
        ],
      ),
    );
  }
}
