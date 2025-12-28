import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
              child: Column(
                children: [
                   CircleAvatar(
                     radius: 50,
                     backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                     child: const Icon(Icons.person, size: 60, color: AppTheme.primaryColor),
                   ),
                   const SizedBox(height: 16),
                   const Text(
                     'Mahasiswa Telkom',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                   ),
                   const Text(
                     'mahasiswa@student.telkomuniversity.ac.id',
                     style: TextStyle(color: Colors.grey),
                   ),
                   const SizedBox(height: 8),
                   Chip(
                     label: const Text('Informatics'),
                     backgroundColor: Colors.blue[50],
                     labelStyle: const TextStyle(color: Colors.blue),
                   ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Menu Options
            _buildProfileItem(Icons.settings, 'Pengaturan Akun', () {}),
            _buildProfileItem(Icons.security, 'Keamanan & Login', () {}),
            _buildProfileItem(Icons.help, 'Bantuan & Dukungan', () {}),
            _buildProfileItem(Icons.info, 'Tentang Aplikasi', () {}),
            
            const SizedBox(height: 24),
            
            TextButton(
              onPressed: () {
                // Logout Logic
              },
              child: const Text('Keluar', style: TextStyle(color: Colors.red)),
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProfileItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
