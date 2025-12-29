import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizReviewScreen extends StatelessWidget {
  final List<Map<String, dynamic>> questions;

  const QuizReviewScreen({
    super.key,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Review Jawaban",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFBE1E2D),
        elevation: 0,
        centerTitle: true,
        leading: Container(), // Hide back button to force use of buttons
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInfoRow("Di Mulai Pada", "Kamis 25 Februari 2021 10:25"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Status", "Selesai"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Selesai Pada", "Kamis 25 Februari 2021 10:40"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Waktu Penyelesaian", "13 Menit 22 Detik"),
                  const SizedBox(height: 8),
                  _buildInfoRow("Nilai", "0 / 100"),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Questions List
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: questions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final question = questions[index];
                final int selectedIndex = question['selected'] ?? -1;
                // ignore: avoid_dynamic_calls
                final String answerText = selectedIndex != -1 
                    ? (question['options'] as List)[selectedIndex] 
                    : "Belum dijawab";
                final String optionLabel = selectedIndex != -1 
                    ? String.fromCharCode(65 + selectedIndex) 
                    : "-";

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pertanyaan ${index + 1}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              question['question'],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100), // Approximate offset
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Jawaban Tersimpan",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "$optionLabel. $answerText",
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop({'action': 'edit', 'index': index});
                          },
                          child: const Text(
                            "Lihat Soal",
                            style: TextStyle(
                              color: Color(0xFF2F80ED),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            
            const SizedBox(height: 48),
            
            // Finish Button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                   context.pop({'action': 'submit'});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2ECC71),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Kirim Jawaban",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        Expanded(
          child: Text(
             value,
             style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
