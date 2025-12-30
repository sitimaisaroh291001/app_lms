import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/task_detail_screen.dart';

void main() {
  testWidgets('TaskDetailScreen renders correctly', (WidgetTester tester) async {
    // Surface size for scrolling
    tester.view.physicalSize = const Size(1080, 2400); 
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(const MaterialApp(
      home: TaskDetailScreen(),
    ));

    // Verify Title
    expect(find.text('Tugas 01 - UID Android Mobile Game'), findsOneWidget);

    // Verify Intructions (Partial text check)
    expect(find.textContaining('Buatlah desain tampilan (antarmuka)'), findsOneWidget);
    expect(find.textContaining('Desain yang dibuat harus melingkupi seluruh tampilan'), findsOneWidget);
    
    // Verify Status Header
    expect(find.text('Status Tugas'), findsOneWidget);

    // Verify Status Table Rows
    expect(find.text('Status'), findsOneWidget);
    expect(find.text('Sudah Mengirim untuk di nilai'), findsOneWidget);
    
    expect(find.text('Status Nilai'), findsOneWidget);
    expect(find.text('Belum Di nilai'), findsOneWidget);
    
    expect(find.text('Batas tanggal'), findsOneWidget);
    expect(find.text('Jumat, 26 Februari 2021, 23:59 WIB'), findsOneWidget);

    // Verify File
    expect(find.text('File Tugas'), findsOneWidget);
    expect(find.text('Dandy Candra Pratama_7708170114.pdf'), findsOneWidget);

    // Verify Button
    await tester.scrollUntilVisible(find.text("Tambahkan Tugas"), 500);
    expect(find.text('Tambahkan Tugas'), findsOneWidget);
  });
}
