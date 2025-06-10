// lib/features/auth/views/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:front_end/utils/theme.dart';
import 'package:front_end/bloc/login/login_bloc.dart';
import 'package:front_end/models/auth/login_model.dart';
import 'package:front_end/services/auth/login_service.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginService: LoginService()),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: const _LoginForm(),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 48),

            // Logo + Nama Aplikasi
            Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 8),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Judul Selamat Datang
            Text(
              'Selamat Datang ke Imunetra',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.text,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Username
            _buildInputField(
              icon: Icons.person_outline,
              hint: 'Username',
              controller: _usernameController,
            ),
            const SizedBox(height: 20),

            // Password
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) => 
                  current is PasswordVisibilityChangedState,
              builder: (context, state) {
                bool obscurePassword = true;
                if (state is PasswordVisibilityChangedState) {
                  obscurePassword = state.obscure;
                }
                return _buildInputField(
                  icon: Icons.lock_outline,
                  hint: 'Kata Sandi',
                  controller: _passwordController,
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword 
                          ? Icons.visibility_off 
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        PasswordVisibilityChanged(!obscurePassword),
                      );
                    },
                  ),
                );
              },
            ),

            // Lupa Kata Sandi
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                  );
                },
                child: Text(
                  'Lupa Kata Sandi?',
                  style: GoogleFonts.poppins(
                    color: AppColors.primary,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Tombol Masuk
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: state is LoginLoading
                    ? null
                    : () {
                        final loginData = LoginData(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        );
                        context.read<LoginBloc>().add(
                              LoginSubmitted(loginData),
                            );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: state is LoginLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
                        'Masuk',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
              ),
            ),

            // Daftar Akun (Jika belum punya)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Belum Punya Akun?',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.text,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  child: Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}