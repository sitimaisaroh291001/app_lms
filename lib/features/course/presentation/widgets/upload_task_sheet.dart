import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class UploadTaskSheet extends StatelessWidget {
  const UploadTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFBE1E2D), // Telkom Red
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Text(
              "Upload File",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Info text
                 const Align(
                   alignment: Alignment.centerRight,
                   child: Text(
                     "Maksimum File 5MB , Maksimum Jumlah File 20",
                     style: TextStyle(fontSize: 12, color: Colors.black87),
                   ),
                 ),
                 const SizedBox(height: 16),
                 
                 // Dashed Border Upload Area
                 DottedBorder(
                   color: Colors.grey,
                   strokeWidth: 1,
                   dashPattern: const [6, 4],
                   borderType: BorderType.RRect,
                   radius: const Radius.circular(4),
                   child: Container(
                     width: double.infinity,
                     height: 200,
                     alignment: Alignment.center,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.cloud_upload_outlined, size: 80, color: Colors.blue[400]),
                         const SizedBox(height: 16),
                         const Text(
                           "File yang akan di upload akan tampil di sini",
                           style: TextStyle(color: Colors.black54),
                         ),
                       ],
                     ),
                   ),
                 ),
                 
                 const SizedBox(height: 32),
                 
                 // Actions
                 Column(
                   children: [
                     SizedBox(
                       width: 150,
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.grey[100],
                           foregroundColor: Colors.black87,
                           elevation: 0,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                         ),
                         child: const Text("Pilih File"),
                       ),
                     ),
                     const SizedBox(height: 12),
                     SizedBox(
                       width: 150,
                       child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.grey[100],
                           foregroundColor: Colors.black87,
                           elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                         ),
                          child: const Text("Simpan"),
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
