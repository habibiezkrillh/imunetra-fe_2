import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/views/widget/bottom_nav.dart';

void main() {
  group('BottomNavBar Widget Test', () {
    testWidgets('displays all navigation items and responds to taps', (WidgetTester tester) async {
      int tappedIndex = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavBar(
              currentIndex: 0,
              onTap: (index) {
                tappedIndex = index;
              },
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Pesan'), findsOneWidget);
      expect(find.text('Riwayat'), findsOneWidget);
      expect(find.text('Profil'), findsOneWidget);

      await tester.tap(find.text('Pesan'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 1);

      await tester.tap(find.text('Riwayat'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 2);

      await tester.tap(find.text('Profil'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 3);

      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(tappedIndex, 0);
    });

        testWidgets('shows selected item with correct icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavBar(
              currentIndex: 2, // Riwayat is selected
              onTap: (_) {},
            ),
          ),
        ),
      );

      // Riwayat uses Icons.history for both active and inactive, so just check that it appears
      expect(
        find.descendant(
          of: find.byType(BottomNavigationBar),
          matching: find.byIcon(Icons.history),
        ),
        findsOneWidget,
      );

      // Check that the "Riwayat" label is present
      expect(find.text('Riwayat'), findsOneWidget);

      // Optionally, check that other active icons are not present when not selected
      expect(find.byIcon(Icons.home), findsNothing); // Home is not selected
      expect(find.byIcon(Icons.chat_bubble), findsNothing); // Pesan is not selected
      expect(find.byIcon(Icons.person), findsNothing); // Profil is not selected
    });
  });
}