import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'utils/theme.dart';
import 'views/pasien/daftar_pasien_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DaftarPasienView(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Daftar Pasien',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}