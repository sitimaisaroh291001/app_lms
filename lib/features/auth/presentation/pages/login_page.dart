import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const HelpBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  // Upper Decoration (Header Image Placeholder & Curve)
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Placeholder for Building Image
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.business, size: 100, color: Colors.white),
                        // In real app, use: Image.asset('assets/images/building.png', fit: BoxFit.cover),
                      ),
                      // White Curve overlaid at the bottom
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            // topRight: Radius.circular(60), // Asymmetric curve in design? 
                            // Looking at design, it seems to slant up or be a wave. 
                            // Using a simple rounded top for clean transition if no custom clipper.
                          ),
                        ),
                      ),
                      // Logo Badge
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.school,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),

                  // Login Form
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          
                          // Email 365 Input
                          TextFormField(
                            controller: _usernameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email tidak boleh kosong';
                              }
                              if (!value.contains('@')) {
                                return 'Format email tidak valid';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'masukkan email anda',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              // Using Underline border as suggested by design analysis
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Password Input
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                          
                          const SizedBox(height: 40),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC00000), // Deep Red
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // Rounded pill shape
                                ),
                                elevation: 5,
                                shadowColor: Colors.black26,

                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.go('/dashboard');
                                }
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Bantuan?
                          Center(
                            child: TextButton(
                              onPressed: () => _showHelpBottomSheet(context),
                              child: const Text(
                                'Bantuan ?',
                                style: TextStyle(
                                  color: Color(0xFFC00000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          const Spacer(),
                          
                          // Register Link
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Belum punya akun? ", style: TextStyle(color: Colors.grey)),
                                  GestureDetector(
                                    onTap: () => context.push('/register'),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              
              // Bottom Wave Decoration
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 80),
                    painter: BottomWavePainter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter for the Bottom Red Wave
class BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFFBE1E2D)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.3);
    
    // Wave Control Points
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.1, size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 1.1, 0, size.height * 0.5);
    
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Help Bottom Sheet
class HelpBottomSheet extends StatelessWidget {
  const HelpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Center(
             child: Container(
               width: 40,
               height: 4,
               decoration: BoxDecoration(
                 color: Colors.grey[300],
                 borderRadius: BorderRadius.circular(2),
               ),
             ),
           ),
           const SizedBox(height: 24),
           
           // Language Flags (Static placeholder)
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Column(children: [
                 const Icon(Icons.flag, color: Colors.red), // ID placeholder
                 const SizedBox(height: 4),
                 const Text("ID", style: TextStyle(fontWeight: FontWeight.bold)),
                 Container(height: 2, width: 20, color: Colors.black),
               ]),
               const SizedBox(width: 32),
               Column(children: [
                  // UK Flag placeholder
                 const Icon(Icons.flag_outlined, color: Colors.blue),
                 const SizedBox(height: 4),
                 const Text("EN", style: TextStyle(color: Colors.grey)),
               ]),
             ],
           ),
           const SizedBox(height: 24),
           
           const Text(
             "Akses hanya untuk Dosen dan Mahasiswa Telkom University.",
             style: TextStyle(fontWeight: FontWeight.bold),
           ),
           const SizedBox(height: 12),
           _buildHelpItem(
             "1. Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut :",
           ),
           _buildHelpItem(
             "2. Username (Akun iGracias) ditambahkan \"@365.telkomuniversity.ac.id\"\nPassword (Akun iGracias) pada kolom Password.",
           ),
           _buildHelpItem(
             "3. Kegagalan yang terjadi pada Autentikasi disebabkan oleh Anda belum mengubah Password Anda menjadi \"Strong Password\". Pastikan Anda telah melakukan perubahan Password di iGracias.",
           ),
           const SizedBox(height: 16),
           const Text("Informasi lebih lanjut dapat menghubungi Layanan CeLOE Helpdesk di :"),
           const SizedBox(height: 8),
           const Text("Mail : infoceloe@telkomuniversity.ac.id"),
           const Text("whatsapp : +62 821-1666-3563"),
           const SizedBox(height: 24),
        ],
      ),
    );
  }
  
  Widget _buildHelpItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(height: 1.4, fontSize: 13)),
    );
  }
}
