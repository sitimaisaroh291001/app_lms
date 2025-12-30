import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_lms/features/course/presentation/video_detail_screen.dart';

void main() {
  testWidgets('VideoDetailScreen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VideoDetailScreen(),
    ));
    // Verify Video Player Section uses Image
    final playerImageFinder = find.byWidgetPredicate((widget) => widget is Image && (widget.image as AssetImage).assetName == 'assets/images/video_thumbnail_ui_design.png');
    expect(playerImageFinder, findsOneWidget);

    // Verify "Video Lain Nya" header
    expect(find.text('Video Lain Nya'), findsOneWidget);

    // Verify List Items have images
    expect(find.byWidgetPredicate((widget) => widget is Image && (widget.image as AssetImage).assetName == 'assets/images/video_thumbnail_interaction.png'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is Image && (widget.image as AssetImage).assetName == 'assets/images/video_thumbnail_pengantar.png'), findsWidgets); // Used twice
    expect(find.byWidgetPredicate((widget) => widget is Image && (widget.image as AssetImage).assetName == 'assets/images/video_thumbnail_figma.png'), findsOneWidget);

  });
}
