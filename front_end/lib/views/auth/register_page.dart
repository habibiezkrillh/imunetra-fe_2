import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front_end/utils/theme.dart';
import 'package:front_end/bloc//register/register_bloc.dart';
import 'package:front_end/models/auth/register_model.dart';
import 'login_page.dart';
import '../home/home_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (state is RegisterFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: const _RegisterForm(),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _kotaController = TextEditingController();
  final TextEditingController _telpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _kotaController.dispose();
    _telpController.dispose();
    _passwordController.dispose();
    _tanggalController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  Future<void> _pickTanggalLahir() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      _tanggalController.text = DateFormat('dd-MM-yyyy').format(picked);
      context.read<RegisterBloc>().add(RegisterDatePicked(picked));
    }
  }

  Future<void> _pickFileKTP() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf'],
    );

    if (result != null) {
      context.read<RegisterBloc>().add(
            RegisterFilePicked(result.files.single.name),
          );
    }
  }

  Widget _buildInputField(
    IconData icon,
    String hint,
    TextEditingController controller, {
    bool obscure = false,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffix,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        obscureText: obscure,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primary),
          suffixIcon: suffix,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 24),

              // Logo + Nama Aplikasi
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Judul
              Text(
                'Silahkan Daftarkan diri anda',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 24),

              // Input fields
              _buildInputField(Icons.person_outline, 'Nama Lengkap', _namaController),
              _buildInputField(Icons.email_outlined, 'Alamat E-Mail', _emailController),
              _buildInputField(Icons.location_on_outlined, 'Kota Domisili', _kotaController),
              
              // Nomor Telepon (dengan kode negara)
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                    child: Text(
                      '+62',
                      style: GoogleFonts.poppins(fontSize: 14, color: AppColors.text),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildInputField(Icons.phone_outlined, 'Nomor Telpon', _telpController),
                  ),
                ],
              ),

              _buildInputField(Icons.lock_outline, 'Kata Sandi', _passwordController, obscure: true),
              _buildInputField(
                Icons.calendar_month_outlined,
                'Tanggal Lahir',
                _tanggalController,
                readOnly: true,
                onTap: _pickTanggalLahir,
              ),
              _buildInputField(Icons.home_outlined, 'Alamat Lengkap', _alamatController),

              // Upload KTP
              BlocBuilder<RegisterBloc, RegisterState>(
                buildWhen: (previous, current) => current is RegisterFileUpdated,
                builder: (context, state) {
                  String? filename;
                  if (state is RegisterFileUpdated) {
                    filename = state.filename;
                  }
                  return _buildInputField(
                    Icons.badge_outlined,
                    filename ?? 'Unggah KTP',
                    TextEditingController(),
                    readOnly: true,
                    onTap: _pickFileKTP,
                    suffix: const Icon(Icons.upload_outlined),
                  );
                },
              ),

              // Checkbox Syarat & Ketentuan
              BlocBuilder<RegisterBloc, RegisterState>(
                buildWhen: (previous, current) => current is RegisterTermsUpdated,
                builder: (context, state) {
                  bool accepted = false;
                  if (state is RegisterTermsUpdated) {
                    accepted = state.accepted;
                  }
                  return Row(
                    children: [
                      Checkbox(
                        value: accepted,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                                RegisterTermsChanged(value ?? false),
                              );
                        },
                        activeColor: AppColors.primary,
                      ),
                      Expanded(
                        child: Text(
                          'Saya Setuju dengan Segala Syarat & Ketentuan yang berlaku di Aplikasi Imunetra',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: state is RegisterLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            final registerData = RegisterData(
                              fullName: _namaController.text,
                              email: _emailController.text,
                              city: _kotaController.text,
                              phoneNumber: _telpController.text,
                              password: _passwordController.text,
                              birthDate: DateTime.now(), // Will be replaced by picked date
                              address: _alamatController.text,
                            );
                            context.read<RegisterBloc>().add(
                                  RegisterSubmitted(registerData),
                                );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: state is RegisterLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Daftar',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),

              // Masuk
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah Punya Akun?',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.text,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}