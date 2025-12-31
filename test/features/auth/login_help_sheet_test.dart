import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/auth/presentation/pages/login_page.dart';

void main() {
  group('HelpBottomSheet Verification', () {
    testWidgets('Toggles language between ID and EN correctly', (WidgetTester tester) async {
      // Build the widget directly
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: HelpBottomSheet(),
        ),
      ));

      // Initial State: Indonesian (ID)
      // Check for Indonesian text
      expect(find.text('Akses hanya untuk Dosen dan Mahasiswa Telkom University.'), findsOneWidget);
      expect(find.text('Access restricted only for Lecturer and Student of Telkom University'), findsNothing);

      // Verify ID flag is "active" (Text color check is hard, but we can check if tapping works)
      
      // Tap EN Toggle
      // We look for the "EN" text or the column containing it.
      await tester.tap(find.text('EN'));
      await tester.pumpAndSettle();

      // State after toggle: English (EN)
      expect(find.text('Access restricted only for Lecturer and Student of Telkom University'), findsOneWidget);
      expect(find.text('Akses hanya untuk Dosen dan Mahasiswa Telkom University.'), findsNothing);
      expect(find.textContaining('Login only using your Microsoft Office 365 Account'), findsOneWidget);

      // Tap ID Toggle to switch back
      await tester.tap(find.text('ID'));
      await tester.pumpAndSettle();

      // State after switch back: Indonesian (ID)
      expect(find.text('Akses hanya untuk Dosen dan Mahasiswa Telkom University.'), findsOneWidget);
    });
  });
}
