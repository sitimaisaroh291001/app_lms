
import 'package:flutter/material.dart';



class MeetingDetailSheet extends StatelessWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> attachments;
  final List<Map<String, dynamic>> tasks;

  const MeetingDetailSheet({
    super.key,
    required this.title,
    required this.description,
    required this.attachments,
    required this.tasks,
  });

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
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: const TextStyle(
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
                        _AttachmentsTab(attachments: attachments),
                        _TasksTab(tasks: tasks),
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
  final List<Map<String, dynamic>> attachments;
  
  const _AttachmentsTab({required this.attachments});

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) {
        return const Center(child: Text("Tidak ada lampiran"));
    }
  
    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: attachments.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = attachments[index];
        IconData icon;
        // Basic icon mapping based on type logic if present, or generic file
        String type = item['type'] ?? 'file';
        switch (type) {
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
  final List<Map<String, dynamic>> tasks;

  const _TasksTab({required this.tasks});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/task_empty.png',
              height: 200, 
              fit: BoxFit.contain,
            ),
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

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final task = tasks[index];
        bool isDone = task['isDone'] ?? false;
        
        return Container(
          padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Icon Column
              Column(
                children: [
                   Icon(
                     task['icon'] ?? Icons.assignment, // Default icon
                     size: 32,
                     color: Colors.black87,
                   ),
                ],
              ),
              const SizedBox(width: 16),
              // Content Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                           child: Text(
                             task['title'] ?? 'Tugas',
                             style: const TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 14,
                             ),
                           ),
                         ),
                         Icon(
                           Icons.check_circle,
                           color: isDone ? const Color(0xFF2ECC71) : Colors.grey[300],
                           size: 24,
                         ),
                       ],
                     ),
                     const SizedBox(height: 8),
                     Text(
                       task['description'] ?? '',
                       style: const TextStyle(fontSize: 12, color: Colors.black87),
                     ),
                     const SizedBox(height: 8),
                      Text(
                       task['deadline'] ?? '',
                       style: const TextStyle(fontSize: 10, color: Colors.grey),
                     ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
