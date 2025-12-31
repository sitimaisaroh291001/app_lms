import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/meeting_detail_sheet.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  // Define materiList as a member so we can access it for deep linking
  final List<Map<String, dynamic>> materiList = [
      {
        "pertemuan": "Pertemuan 1",
        "title": "01 - Pengantar User Interface Design",
        "desc": "3 URLs, 2 Files, 3 Interactive Content",
        "isDone": true,
        "detail": {
           "title": "Pengantar User Interface Design",
           "description": "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
           "attachments": [
              {'title': 'Zoom Meeting Syncronous', 'type': 'link'},
              {'title': 'Pengantar User Interface Design', 'type': 'pdf'},
              {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'pdf'},
              {'title': 'Empat Teori Dasar Antarmuka Pengguna', 'type': 'pdf'},
              {'title': 'User Interface Design for Beginner', 'type': 'video'},
              {'title': '20 Prinsip Desain', 'type': 'link'},
              {'title': 'Best Practice UI Design', 'type': 'link'},
           ],
           "tasks": <Map<String, dynamic>>[], 
        }
      },
      {
        "pertemuan": "Pertemuan 2",
        "title": "02 - Konsep User Interface Design",
        "desc": "2 URLs, 1 Kuis, 3 Files, 1 Tugas",
        "isDone": true,
        "detail": {
           "title": "Konsep User Interface Design",
           "description": "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.",
           "attachments": [
              {'title': 'Zoom Meeting Syncronous', 'type': 'link'},
              {'title': 'Elemen-elemen Antarmuka Pengguna', 'type': 'pdf'},
              {'title': 'UID Guidelines and Principles', 'type': 'pdf'},
              {'title': 'User Profile', 'type': 'pdf'},
              {'title': 'Principles of User Interface DesignURL', 'type': 'link'},
           ],
           "tasks": [
             {
               "title": "Quiz Review 01",
               "description": "Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.\nKerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
               "deadline": "",
               "icon": Icons.chat_bubble_outline,
               "isDone": true,
             },
             {
               "title": "Tugas 01 - UID Android Mobile Game",
               "description": "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.\n2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi ...........",
               "deadline": "",
               "icon": Icons.assignment_outlined,
               "isDone": false, 
             }
           ]
        }
      },
      {
        "pertemuan": "Pertemuan 3",
        "title": "03 - Interaksi pada User Interface Design",
        "desc": "3 URLs, 2 Files, 3 Interactive Content",
        "isDone": true,
      },
      {
        "pertemuan": "Pertemuan 4",
        "title": "04 - Ethnographic Observation",
        "desc": "3 URLs, 2 Files, 3 Interactive Content",
        "isDone": true,
      },
      {
        "pertemuan": "Pertemuan 5",
        "title": "05 - UID Testing",
        "desc": "3 URLs, 2 Files, 3 Interactive Content",
        "isDone": true,
      },
      {
        "pertemuan": "Pertemuan 6",
        "title": "06 - Assessment 1",
        "desc": "3 URLs, 2 Files, 3 Interactive Content",
        "isDone": true,
      },
    ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkDeepLink();
    });
  }

  void _checkDeepLink() {
    try {
      final state = GoRouterState.of(context);
      final extra = state.extra as Map<String, dynamic>?;

      if (extra != null && extra.containsKey('openMeetingTitle')) {
        final targetTitle = extra['openMeetingTitle'] as String;
        
        // Find the meeting
        final meeting = materiList.firstWhere(
          (m) => m['title'] == targetTitle,
          orElse: () => {},
        );

        if (meeting.isNotEmpty && meeting.containsKey('detail')) {
            final detail = meeting['detail'] as Map<String, dynamic>;
            
            // Show the sheet
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              backgroundColor: Colors.transparent,
              builder: (context) => MeetingDetailSheet(
                title: detail['title'],
                description: detail['description'],
                attachments: detail['attachments'],
                tasks: detail['tasks'],
              ),
            );
        }
      }
    } catch (e) {
      debugPrint("Error processing deep link: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFBE1E2D),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Column(
            children: const [
              Text(
                "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "D4SM-42-03 [ADY]",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "Materi"),
                  Tab(text: "Tugas Dan Kuis"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildMateriTab(),
                  _buildTugasTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriTab() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: materiList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = materiList[index];
        final isDone = item['isDone'] as bool;
        return GestureDetector(
          onTap: () {
            if (item.containsKey('detail')) {
                 final detail = item['detail'] as Map<String, dynamic>;
                 showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, 
                  backgroundColor: Colors.transparent,
                  builder: (context) => MeetingDetailSheet(
                    title: detail['title'],
                    description: detail['description'],
                    attachments: detail['attachments'],
                    tasks: detail['tasks'],
                  ),
                );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5D9CEC), // Light Blue
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['pertemuan'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: isDone ? const Color(0xFF2ECC71) : Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['desc'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTugasTab() {
    final List<Map<String, dynamic>> taskList = [
      {
        "type": "QUIZ",
        "title": "Quiz Review 01",
        "deadline": "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        "icon": Icons.chat_bubble_outline,
        "isDone": true,
      },
      {
        "type": "Tugas",
        "title": "Tugas 01 - UID Android Mobile Game",
        "deadline": "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        "icon": Icons.assignment_outlined,
        "isDone": false, // Abu-abu
      },
      {
        "type": "Quiz", 
        "label": "Pertemuan 3",
        "title": "Kuis - Assessment 2",
        "deadline": "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        "icon": Icons.chat_bubble_outline,
        "isDone": true,
      }
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: taskList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = taskList[index];
        final isDone = item['isDone'] as bool;
        final label = item.containsKey('label') ? item['label'] : item['type'];

        return GestureDetector(
          onTap: () {
            final String type = (item['type'] as String? ?? '').toUpperCase();
            final String title = (item['title'] as String? ?? '').toUpperCase();
            
            if (type.contains('QUIZ') || title.contains('KUIS') || title.contains('QUIZ')) {
              context.push('/quiz-detail');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5D9CEC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        label.toString().toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: isDone ? const Color(0xFF2ECC71) : Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      item['icon'],
                      size: 40,
                      color: Colors.black87,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['deadline'],
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
              ],
            ),
          ),
        );
      },
    );
  }
}
