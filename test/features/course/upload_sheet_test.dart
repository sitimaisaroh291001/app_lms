import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/task_detail_screen.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
  testWidgets('UploadTaskSheet opens on button click', (WidgetTester tester) async {
     tester.view.physicalSize = const Size(1080, 2400); 
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(const MaterialApp(
      home: TaskDetailScreen(),
    ));

    // Scroll to button
    final buttonFinder = find.text("Tambahkan Tugas");
    await tester.scrollUntilVisible(buttonFinder, 500);
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verify Sheet Header
    expect(find.text("Upload File"), findsOneWidget);
    
    // Verify Info Text
    expect(find.text("Maksimum File 5MB , Maksimum Jumlah File 20"), findsOneWidget);

    // Verify Dashed Border (by type since it is a specific widget)
    expect(find.byType(DottedBorder), findsOneWidget);

    // Verify Buttons inside sheet
    expect(find.text("Pilih File"), findsOneWidget);
    expect(find.text("Simpan"), findsOneWidget);
  });
}
