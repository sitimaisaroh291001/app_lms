import 'package:flutter/material.dart';

class MaterialDetailScreen extends StatelessWidget {
  const MaterialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Pengantar User Interface Design",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFFBE1E2D), // Telkom Red
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              "Halaman\n1/26",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                height: 1.1,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildIntroductionSection(),
            _buildDefinitionSection(),
            _buildImportanceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 8)),
      ),
      child: Column(
        children: [
          // Logo placeholder or text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for Logo
               Icon(Icons.school, size: 60, color: Colors.grey[700]), 
               const SizedBox(width: 12),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "Universitas",
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: Colors.grey[800],
                     ),
                   ),
                    Text(
                     "Telkom",
                     style: TextStyle(
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: Colors.grey[800],
                     ),
                   ),
                 ],
               )
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF333333),
              border: Border(left: BorderSide(color: Colors.grey, width: 4)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengantar Desain",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                       Text(
                        "Antarmuka Pengguna",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "VE1214",
                      style: TextStyle(color: Color(0xFFBE1E2D), fontSize: 12),
                    ),
                    Text(
                      "UI / UX Design",
                      style: TextStyle(color: Color(0xFFBE1E2D), fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroductionSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
         border: Border(bottom: BorderSide(color: Colors.grey, width: 8)),
      ),
      child: Column(
        children: [
          const Text(
            "Perkenalan",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar Placeholder
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 50, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      text: "Ady Purna Kurniawan",
                      boldText: "ADY",
                      isArrow: true,
                    ),
                     _buildBulletPoint(
                      text: "E-mail:\nadypurnakurniawan@telkomuniversity.ac.id",
                    ),
                     _buildBulletPoint(
                      text: "Bidang Keahlian:\n– Information System\n– Web Programming and Design\n– Game Development",
                    ),
                     _buildBulletPoint(
                      text: "No.HP: 085727930642",
                      boldText: "SMS/Telp/Whatsapp",
                      isArrow: true,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDefinitionSection() {
    return Container(
       width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
         border: Border(bottom: BorderSide(color: Colors.grey, width: 8)),
      ),
      child: Column(
        children: [
          const Text(
            "User Interface",
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          _buildBulletPoint(
            text: "Antarmuka/ user interface (UI) merupakan bagian dari komputer dan perangkat lunaknya yang dapat dilihat, didengar, disentuh, dan diajak bicara, baik secara langsung maupun dengan proses pemahaman tertentu.",
            highlights: ["dilihat,", "didengar, disentuh,", "diajak bicara,"],
          ),
           _buildBulletPoint(
            text: "UI yang baik adalah UI yang tidak disadari, dan UI yang memungkinkan pengguna fokus pada informasi dan task tanpa perlu mengetahui mekanisme untuk menampilkan informasi dan melakukan task tersebut.",
            highlights: ["tidak disadari,"],
          ),
           _buildBulletPoint(
            text: "Komponen utamanya:\n– Input\n– Output",
          ),
        ],
      )
    );
  }

  Widget _buildImportanceSection() {
    return Container(
       width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
           const Text(
            "Pentingnya Desain UI yang Baik",
             textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
           const SizedBox(height: 24),
           _buildBulletPoint(
             text: "Banyak sistem dengan fungsionalitas yang baik tapi tidak efisien, membingungkan, dan tidak berguna karena desain UI yang buruk",
             highlights: ["desain UI yang buruk"],
           ),
           _buildBulletPoint(
             text: "Antarmuka yang baik merupakan jendela untuk melihat kemampuan sistem serta jembatan bagi kemampuan perangkat lunak",
           ),
           _buildBulletPoint(
             text: "Desain yang buruk akan membingungkan, tidak efisien, bahkan menyebabkan frustasi",
             highlights: ["membingungkan, tidak efisien,", "frustasi"],
           ),
            const SizedBox(height: 16),
            // Frustrated User Image Placeholder
             Container(
               height: 150,
               width: double.infinity,
               color: Colors.grey[200],
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: const [
                   Icon(Icons.image, size: 50, color: Colors.grey),
                   Text("Frustrated User Image"),
                 ],
               ),
             )
        ],
      ),
    );
  }

  Widget _buildBulletPoint({required String text, String? boldText, bool isArrow = false, List<String>? highlights}) {
    // Basic rich text implementation for highlights
    List<TextSpan> spans = [];
    
    if (highlights != null && highlights.isNotEmpty) {
      String remainingText = text;
      // Very simple replace logic, ideally we split by matches
      // For this specific content, manual splitting is easier or just bolding the whole thing if too complex
      // Let's just bold the whole part if it matches strictly, but here we have substrings.
      // We will just use normal text for now for simplicity unless exact match needed.
      // Re-implementing specific highlighting logic:
      
      int currentIndex = 0;
      // Flatten list of ranges?
      // Let's simpler approach: split by Highlight and toggle bold.
      // WARNING: This assumes non-overlapping unique highlights.
      
      // We will just default to normal text with the highlights bolded if found.
      // This is a quick implementation:
      spans.add(TextSpan(text: text)); // Fallback
      
      // To do it properly:
      spans = [];
      String temp = text;
      // This is getting complex for a simple task. Let's just render the text. 
      // If specific bolding is CRITICAL, I'd parse it. 
      // The prompt asks for "lengkap dengan gambarnya seperti desaign".
      // I will try to support BOLD text if provided in `boldText` or broad highlights.
      // The highlights argument is a list of strings to bold.
       
       // Better approach for static content: Hardcode the RichText in the main widget methods if complex.
       // But let's try a simple highlight finder.
       
       spans = _highlightOccurrences(text, highlights);

    } else if (boldText != null) {
       if (isArrow) {
          int index = text.indexOf("->"); // or similar? The text has arrows?
          // The Input text doesn't have the arrow char literal in the argument usually, 
          // let's assume the text argument is the full text.
          // image: "Ady Purna ... -> ADY"
          List<String> parts = text.split("->");
          if (parts.length > 1) {
             spans.add(TextSpan(text: parts[0]));
             spans.add(const TextSpan(text: " \u2192 ", style: TextStyle(fontWeight: FontWeight.bold))); // Arrow
             spans.add(TextSpan(text: parts[1].trim(), style: const TextStyle(fontWeight: FontWeight.bold)));
          } else {
             // Maybe it's at the end or somewhere else?
             // Use simple replace for arrow if needed.
             spans.add(TextSpan(text: text));
          }
       } else {
         spans.add(TextSpan(text: text));
       }
    } else {
      spans.add(TextSpan(text: text));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
                children: spans,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  List<TextSpan> _highlightOccurrences(String text, List<String> highlights) {
      // Create a map of indices to bold
      List<bool> boldMap = List.filled(text.length, false);
      for (var h in highlights) {
        int index = text.indexOf(h);
        while (index != -1) {
          for (int i = index; i < index + h.length; i++) {
            boldMap[i] = true;
          }
          index = text.indexOf(h, index + 1);
        }
      }

      List<TextSpan> spans = [];
      int start = 0;
      bool currentBold = boldMap[0];

      for (int i = 1; i < text.length; i++) {
        if (boldMap[i] != currentBold) {
          spans.add(TextSpan(
            text: text.substring(start, i),
            style: currentBold ? const TextStyle(fontWeight: FontWeight.bold) : null,
          ));
          start = i;
          currentBold = boldMap[i];
        }
      }
      spans.add(TextSpan(
        text: text.substring(start),
        style: currentBold ? const TextStyle(fontWeight: FontWeight.bold) : null,
      ));
      return spans;
  }
}
