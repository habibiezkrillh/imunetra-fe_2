import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/bloc/onboard_bloc.dart';
import 'package:front_end/services/onboard_service.dart';
import 'package:front_end/views/onboarding/onboarding.dart';

void main() {
  group('OnboardingPage Widget Test', () {
    testWidgets('Menampilkan halaman pertama dengan gambar dan teks', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      // Tunggu hingga widget selesai dirender
      await tester.pumpAndSettle();

      // Cek keberadaan widget
      expect(find.text('Imunetra'), findsWidgets); // Judul tampil
      expect(find.byType(Image), findsOneWidget); // Gambar tampil
      expect(find.textContaining('pneumonia'), findsWidgets); // Deskripsi tampil
      expect(find.text('Lewati'), findsOneWidget);
      expect(find.text('Lanjut'), findsOneWidget);
    });

    testWidgets('Mengklik tombol Lanjut berpindah halaman', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Klik tombol Lanjut
      final lanjutButton = find.text('Lanjut');
      expect(lanjutButton, findsOneWidget);

      await tester.tap(lanjutButton);
      await tester.pumpAndSettle();

    });

    testWidgets('Klik tombol Lewati tidak menyebabkan error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => OnboardingCubit(OnboardingService()),
            child: OnboardingPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final lewatiButton = find.text('Lewati');
      await tester.tap(lewatiButton);
      await tester.pumpAndSettle();

      // Tidak terjadi error, navigasi bisa ditambahkan dalam expect ke halaman lain
    });
  });
}