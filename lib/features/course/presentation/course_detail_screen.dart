import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

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
          toolbarHeight: 80, // Increased height for 2 lines
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
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Materi Placeholder")),
                  Center(child: Text("Tugas Dan Kuis Placeholder")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
