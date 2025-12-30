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

    // Verify Header Section
    expect(find.text('Universitas'), findsOneWidget);
    expect(find.text('Telkom'), findsOneWidget);
    expect(find.text('Pengantar Desain'), findsOneWidget);
    
    // Verify Introduction Section
    // Scroll to see introduction if needed (though it might be visible)
    await tester.scrollUntilVisible(find.text('Perkenalan'), 500);
    expect(find.text('Perkenalan'), findsOneWidget);
    expect(find.textContaining('Ady Purna Kurniawan'), findsWidgets);

    // Verify Definition Section
    await tester.scrollUntilVisible(find.text('User Interface'), 500);
    expect(find.text('User Interface'), findsOneWidget);

    // Verify Importance Section
    await tester.scrollUntilVisible(find.text('Pentingnya Desain UI yang Baik'), 500);
    expect(find.text('Pentingnya Desain UI yang Baik'), findsOneWidget);
  });
}
