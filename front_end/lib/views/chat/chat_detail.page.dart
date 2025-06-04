import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/theme.dart';

class ChatDetailPage extends StatelessWidget {
  final String userName;
  final String userImageUrl;

  const ChatDetailPage({
    super.key,
    required this.userName,
    required this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF4FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImageUrl),
            ),
            const SizedBox(width: 10),
            Text(
              userName,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildMessageBubble(
                  message: 'Halo, boleh tahu lebih dalam mengenai acaranya?',
                  time: '10:00',
                  isSender: false,
                ),
                _buildMessageBubble(
                  message: 'Selamat siang, Kak. Jadi nanti akan ada kegiatan di Desa Kanjilo',
                  time: '10:03',
                  isSender: true,
                ),
                _buildMessageBubble(
                  message: 'Apakah kakak tertarik untuk mengikuti kegiatan kami?',
                  time: '10:04',
                  isSender: true,
                ),
              ],
            ),
          ),
          _buildInputArea(context),
        ],
      ),
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required String time,
    required bool isSender,
  }) {
    return Align(
      alignment: isSender ? Alignment.centerRight: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4),
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isSender ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              style: GoogleFonts.poppins(
                color: isSender ? Colors.white : Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              time,
              style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'Ketik Pesan...',
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.camera_alt_outlined, color: Colors.grey),
        ],
      ),
    );
  }
}