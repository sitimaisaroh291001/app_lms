import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizDetailScreen extends StatelessWidget {
  const QuizDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBE1E2D),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Quiz Review 1",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Instructions
            const Text(
              "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis.\nJangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.",
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 24),

            // Info Box
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5), // Light grey
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Text(
                    "Kuis Akan di tutup pada Jumat, 26 February 2021, 11:59 PM",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Batas Waktu: 15 menit",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Metode Penilaian: Nilai Tertinggi",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Attempts Header
            const Text(
              "Percobaan Yang Sudah Di Lakukan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Attempts Table/List
            Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                 // Basic border/shadow if needed?
              ),
              child: Column(
                children: [
                  // Header Row
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                     decoration: const BoxDecoration(
                      color: Color(0xFFEB5757), // Lighter red
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Status", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("Nilai / 100.00", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("Tinjau Kembali", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  // Content Row
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    color: const Color(0xFFF9F9F9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: const [
                             Text("Selesai", style: TextStyle(fontWeight: FontWeight.bold)),
                             SizedBox(height: 4),
                             Text("Dikirim Pada Kamis, 25 Februari 2021, 10:40", style: TextStyle(fontSize: 10, color: Colors.grey)),
                           ],
                         ),
                         const Text("85,0", style: TextStyle(fontWeight: FontWeight.bold)),
                         const Text("Lihat", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Final Score
            const Text(
              "Nilai Akhir Anda Unutuk Kuis Ini Adalah 85.0 / 100.00", // Typo in design: Unutuk -> Untuk. I'll fix typo or keep as implies? Keeping as user provided text usually safer but 'Untuk' is standard. I'll fix typo: Untuk.
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            
            const SizedBox(height: 48),
            
            // Buttons
            Center(
              child: Column(
                children: [
                   ElevatedButton(
                     onPressed: () {
                       // Action
                     }, 
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFFF5F5F5),
                       foregroundColor: Colors.black,
                       elevation: 0,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                       padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                       minimumSize: const Size(200, 48), // Ensure consistent width
                     ),
                     child: const Text("Ambil Kuis"),
                   ),
                   const SizedBox(height: 16),
                   ElevatedButton(
                     onPressed: () {
                        context.pop(); // Returns to previous screen (Class)
                     }, 
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xFFF5F5F5),
                       foregroundColor: Colors.black,
                       elevation: 0,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                        minimumSize: const Size(200, 48),
                     ),
                     child: const Text("Kembali Ke Kelas"),
                   ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
