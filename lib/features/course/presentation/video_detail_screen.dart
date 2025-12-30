import 'package:flutter/material.dart';

class VideoDetailScreen extends StatelessWidget {
  const VideoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Video - User Interface Design For Beginner",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFBE1E2D), // Telkom Red
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Main Background Image
                    Image.asset(
                      'assets/images/video_thumbnail_ui_design.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Controls bar at bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        color: Colors.black.withOpacity(0.6),
                        child: Row(
                          children: [
                            const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: LinearProgressIndicator(
                                value: 0.0,
                                backgroundColor: Colors.grey,
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ),
                             const SizedBox(width: 8),
                             const Text("0:00 / 5:51", style: TextStyle(color: Colors.white, fontSize: 10)),
                             const SizedBox(width: 8),
                             const Icon(Icons.volume_up, color: Colors.white, size: 16),
                             const SizedBox(width: 8),
                             const Icon(Icons.settings, color: Colors.white, size: 16),
                             const SizedBox(width: 8),
                             const Icon(Icons.fullscreen, color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Video Lain Nya",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Video List
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildVideoItem('assets/images/video_thumbnail_interaction.png', "Interaction Design"),
                _buildVideoItem('assets/images/video_thumbnail_pengantar.png', "Pengantar Desain\nAntarmuka Pengguna"),
                // Reusing pengantar image for theory as they share branding/style in the request context
                _buildVideoItem('assets/images/video_thumbnail_pengantar.png', "4 Teori Dasar Desain\nAntarmuka Pengguna"),
                _buildVideoItem('assets/images/video_thumbnail_figma.png', "Tutorial Dasar Figma -\nUI/UX Design Software"),
              ],
            ),
             const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String imagePath, String title) {
    return Container(
      color: Colors.grey[100], // Background for the row
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
           // Thumbnail
           SizedBox(
             width: 140,
             height: 80,
             child: Stack(
               alignment: Alignment.center,
               children: [
                 Image.asset(
                   imagePath,
                   width: 140,
                   height: 80,
                   fit: BoxFit.cover,
                 ),
                 // Play icon overlay (semi-transparent black + red button) if needed?
                 // The provided screenshots show red youtube-like buttons ON the thumbnail.
                 // The uploaded images seem to already contain play buttons?
                 // Let's look at uploaded images.
                 // Image 1 (blue guy): has youtube button.
                 // Image 2 (Telkom): has youtube button.
                 // Image 3 (Figma): has youtube button.
                 // So we don't need to add our own overlay if the image has it.
                 // But wait, the previous code added a red container.
                 // If the images have it, I should NOT overlay another one.
                 // I will assume images have it based on the screenshot provided in the Request (Step 162).
                 // The screenshots show images WITH buttons.
               ],
             ),
           ),
           const SizedBox(width: 16),
           Expanded(
             child: Text(
               title,
               style: const TextStyle(
                 fontSize: 14,
                 fontWeight: FontWeight.w500,
                 color: Colors.black87,
               ),
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
             ),
           )
        ],
      ),
    );
  }
}
