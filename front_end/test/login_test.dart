import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front_end/views/auth/login_page.dart';

void main() {
  testWidgets('Login Page UI and interaction test (termasuk show/hide password)',
  (WidgetTester tester) async {
    // 1. Render Login Page
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));
    await tester.pumpAndSettle();

    // 2. Cek teks selamat datang
    expect(find.text('Selamat Datang ke Imunetra'), findsOneWidget);

    // 3. Cek field username dan password
    expect(find.widgetWithIcon(TextField, Icons.person_outline), findsOneWidget);
    expect(find.widgetWithIcon(TextField, Icons.lock_outline), findsOneWidget);

    // 4. Tes Show/Hide Password (ikon mata)
    final passwordField = find.byType(TextField).at(1);
    expect(passwordField, findsOneWidget);

    // Awalnya harus dalam kondisi "obscure"
    TextField pwFieldWidget = tester.widget(passwordField);
    expect(pwFieldWidget.obscureText, isTrue);

    // Tap tombol mata untuk toggle visibility
    final eyeIconButton = find.byIcon(Icons.visibility_off);
    expect(eyeIconButton, findsOneWidget);

    await tester.tap(eyeIconButton);
    await tester.pumpAndSettle();

    // Periksa bahwa obscureText sekarang menjadi false (password terlihat)
    pwFieldWidget = tester.widget(passwordField);
    expect(pwFieldWidget.obscureText, isFalse);

    // 5. Isi username dan password
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(passwordField, 'testpassword');

    // 6. Tekan tombol "Masuk"
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    // 7. Pastikan halaman login sudah tidak muncul
    expect(find.text('Selamat Datang ke Imunetra'), findsNothing);
  });
}