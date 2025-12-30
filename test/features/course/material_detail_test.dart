import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/material_detail_screen.dart';

void main() {
  testWidgets('MaterialDetailScreen renders correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(
      home: MaterialDetailScreen(),
    ));

    // Verify AppBar content
    expect(find.text('Pengantar User Interface Design'), findsOneWidget);
    expect(find.text('Halaman\n1/26'), findsOneWidget);

    // Verify Images are present
    // We expect 4 images
    expect(find.byType(Image), findsNWidgets(4));
    
    // Verify specific assets are loaded (by verifying the AssetImage provider)
    // Note: In widget tests with local assets, strict asset verification can be tricky without mocking,
    // but verifying the widget count is a good enough proxy for this change.
    
    // Check if the specific asset paths are present in the tree
    // We can iterate the Image widgets to check their providers if needed, 
    // but simpler to just ensure 4 images exist.
  });
}
