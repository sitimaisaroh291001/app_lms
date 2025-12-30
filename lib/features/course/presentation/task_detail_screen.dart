import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tugas 01 - UID Android Mobile Game",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFBE1E2D), // Telkom Red
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInstructionSection(),
            const SizedBox(height: 24),
            _buildStatusHeader(),
            _buildStatusTable(),
             const SizedBox(height: 32),
             Center(
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.grey[200],
                   foregroundColor: Colors.black87,
                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                 ),
                 child: const Text("Tambahkan Tugas"),
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInstructionItem(
            "1.",
            "Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.",
          ),
          const SizedBox(height: 12),
          _buildInstructionItem(
            "2.",
            "Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.",
          ),
          const SizedBox(height: 12),
          _buildInstructionItem(
            "3.",
            "Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.",
          ),
          const SizedBox(height: 12),
          _buildInstructionItem(
            "4.",
            "Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.",
          ),
          const SizedBox(height: 12),
          _buildInstructionItem(
            "5.",
            "File dikumpulkan dalam format .PDF dengan size maksimal 5MB.",
          ),
          const SizedBox(height: 12),
          _buildInstructionItem(
            "6.",
            "Tugas dikumpulkan paling lambat hari Jum'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.",
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFFEF5350), // Light red / Salmon
      child: const Text(
        "Status Tugas",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatusTable() {
    return Column(
      children: [
        _buildStatusRow("Status", "Sudah Mengirim untuk di nilai", isGreyData: true),
        _buildStatusRow("Status Nilai", "Belum Di nilai"),
        _buildStatusRow("Batas tanggal", "Jumat, 26 Februari 2021, 23:59 WIB", isGreyData: true),
        _buildStatusRow("Sisa Waktu", "Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya"),
        _buildFileRow("File Tugas", "Dandy Candra Pratama_7708170114.pdf", isGreyData: true),
      ],
    );
  }

  Widget _buildStatusRow(String label, String value, {bool isGreyData = false}) {
    return Container(
      color: isGreyData ? Colors.grey[50] : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(String label, String fileName, {bool isGreyData = false}) {
    return Container(
       color: isGreyData ? Colors.grey[50] : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.description_outlined, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    fileName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
