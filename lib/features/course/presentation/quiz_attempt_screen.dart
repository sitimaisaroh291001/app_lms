import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizAttemptScreen extends StatefulWidget {
  const QuizAttemptScreen({super.key});

  @override
  State<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends State<QuizAttemptScreen> {
  int _currentIndex = 0;
  final int _totalQuestions = 15;
  
  // Dummy data for questions
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Radio button dapat digunakan untuk menentukan ?",
      "options": ["Jenis Kelamin", "Alamat", "Hobby", "Riwayat Pendidikan", "Umur"],
      "selected": -1, // -1 means none selected
    },
    {
      "question": "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      "options": ["Intergrasi", "Standarisasi", "Konsistensi", "Koefensi", "Koreksi"],
      "selected": -1,
    },
    // Generate more dummy questions to reach 15 or reuse
  ];

  @override
  void initState() {
    super.initState();
    // Fill up to 15 questions
    while (_questions.length < 15) {
      _questions.add({
        "question": "Pertanyaan nomor ${_questions.length + 1} contoh text default...",
        "options": ["Pilihan A", "Pilihan B", "Pilihan C", "Pilihan D", "Pilihan E"],
        "selected": -1,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFBE1E2D),
        elevation: 0,
        automaticallyImplyLeading: false, // Hide back button if custom or none
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                "Quiz Review 1",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(Icons.timer_outlined, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "15 : 00",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Question Number Navigation
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_totalQuestions, (index) {
                  // Determine color based on state
                  // Active: Green border? Or filled if answered?
                  // Design shows Green Filled for current/answered? 
                  // Image 2 shows '1' green filled. Image 3 shows '1' green filled when on Q2.
                  // Current index: Green filled. Past answered: Green filled?
                  // Let's make: Current = Green filled. Answered = Green Border? 
                  // Or just Green Circle for all available items?
                  // Design: 1, 2, ... bubbles.
                  bool isActive = index == _currentIndex;
                  bool isAnswered = _questions[index]['selected'] != -1;
                  
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? const Color(0xFF2ECC71) : Colors.transparent, // Active = Green
                      border: Border.all(
                        color: (isActive || isAnswered) ? const Color(0xFF2ECC71) : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Soal Nomor ${_currentIndex + 1} / $_totalQuestions",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _questions[_currentIndex]['question'],
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Options
                  ...List.generate(5, (optionIndex) {
                    final options = _questions[_currentIndex]['options'] as List<String>;
                    final optionLabel = String.fromCharCode(65 + optionIndex); // A, B, C...
                    final optionText = options[optionIndex];
                    final isSelected = _questions[_currentIndex]['selected'] == optionIndex;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _questions[_currentIndex]['selected'] = optionIndex;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFEB5757) : const Color(0xFFF5F5F5), // Red if selected
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected ? [
                             BoxShadow(
                               // ignore: deprecated_member_use
                               color: Colors.black.withOpacity(0.1),
                               blurRadius: 4,
                               offset: const Offset(0, 2),
                             )
                          ] : [],
                        ),
                        child: Row(
                          children: [
                            Text(
                              "$optionLabel. ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                optionText,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          
          // Footer Buttons
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                if (_currentIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex--;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Soal Sebelum nya."),
                  )
                else
                  const SizedBox.shrink(), // Spacer

                // Next or Finish Button
                if (_currentIndex < _totalQuestions - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      foregroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Soal Selanjut nya."),
                  )
                else
                   ElevatedButton(
                    onPressed: () {
                      // Finish quiz
                      context.pop(); // Returns to detail
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2ECC71), // Green
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Selesai."),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
