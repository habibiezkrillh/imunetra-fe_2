import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/profile_screen.dart';
import 'bloc/profile_bloc.dart';
import 'utils/theme.dart'; // import theme.dart

void main() {
  runApp(
    BlocProvider(
      create: (_) => ProfileCubit(),
      child: MaterialApp(
        theme: appTheme,
        home: ProfileScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}