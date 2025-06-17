import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:front_end/utils/theme.dart';
import 'package:front_end/bloc/login/login_bloc.dart';
import 'package:front_end/models/auth/login_model.dart';
import 'package:front_end/services/auth_service.dart'; // Gunakan AuthService yang sama
import 'register_page.dart';
import 'forgot_password_page.dart';
import '../home/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authService: AuthService()), // Gunakan AuthService
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
                // Tampilkan pesan sukses dengan nama user
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selamat datang, ${state.userData['namatenagamedis'] ?? 'User'}!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(); // Ganti dari username ke email
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
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
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primary),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Field ini tidak boleh kosong';
          }
          if (hint == 'Alamat E-Mail' && !value.contains('@')) {
            return 'Masukkan email yang valid';
          }
          if (hint == 'Kata Sandi' && value.length < 6) {
            return 'Kata sandi minimal 6 karakter';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 48),

              // Logo + Nama Aplikasi
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png', // Sesuaikan dengan path logo Anda
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Login Tenaga Medis', // Ubah title
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
                'Selamat Datang di Imunetra',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Email (ganti dari Username)
              _buildInputField(
                icon: Icons.email_outlined,
                hint: 'Alamat E-Mail',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
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
                        color: AppColors.primary,
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
                          if (_formKey.currentState!.validate()) {
                            final loginData = LoginTenagaMedisData( // Gunakan model baru
                              email: _emailController.text,
                              kataSandi: _passwordController.text,
                            );
                            context.read<LoginBloc>().add(
                                  LoginSubmitted(loginData),
                                );
                          }
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

              const SizedBox(height: 20),

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
          ),
        );
      },
    );
  }
}