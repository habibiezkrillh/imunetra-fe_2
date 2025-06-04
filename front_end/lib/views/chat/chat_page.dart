import 'package:flutter/material.dart';
import 'package:front_end/views/widget/bottom_nav.dart';
import 'package:front_end/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

// Import Screen
import 'chat_detail.page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String selectedFilter = 'Semua';

  final List<Map<String, dynamic>> allChats = [
    {
      'name': 'Astra',
      'company': 'PT Astra Internasional Tbk',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '10:00',
      'unreadCount': 2,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': false,
    },
    {
      'name': 'BRI',
      'company': 'PT Bank Rakyat Indonesia (Persero) Tbk',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '09:13',
      'unreadCount': 0,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': true,
    },
    {
      'name': 'Telkom',
      'company': ' PT Telkom Indonesia (Persero) Tbk',
      'message': 'Halo, boleh tahu lebih mengenai acaranya?',
      'time': '09:00',
      'unreadCount': 5,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': false,
    },
    {
      'name': 'Alfamart',
      'company': 'PT Sumber Alfaria Trijaya Tbk',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '08:55',
      'unreadCount': 0,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': true,
    },
  ];

  List<Map<String, dynamic>> get filteredChats {
    if (selectedFilter == 'Belum dibaca') {
      return allChats.where((chat) => !chat['read']).toList();
    } else if (selectedFilter == 'Relawan') {
      return allChats.where((chat) => chat['company'].contains('Relawan')).toList();
    } else {
      return allChats;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Pesan',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primary),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Silahkan mencari...',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Filter tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _ChatTabButton(
                    label: 'Semua',
                    selected: selectedFilter == 'Semua',
                    onTap: () => setState(() => selectedFilter = 'Semua'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ChatTabButton(
                    label: 'Belum dibaca',
                    selected: selectedFilter == 'Belum dibaca',
                    onTap: () => setState(() => selectedFilter = 'Belum dibaca'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ChatTabButton(
                    label: 'Relawan',
                    selected: selectedFilter == 'Relawan',
                    onTap: () => setState(() => selectedFilter = 'Relawan'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Chat List
          Expanded(
            child: ListView(
              children: filteredChats
                .map((chat) => ChatItem(
                  name: chat['name'],
                  company: chat['company'],
                  message: chat['message'],
                  time: chat['time'],
                  unreadCount: chat['unreadCount'],
                  imageUrl: chat['imageUrl'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailPage(
                          userName: chat['name'],
                          userImageUrl: chat['imageUrl'],
                        ),
                      ),
                    );
                  }
                ))
                .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            // Stay in Chat
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/riwayat');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profil');
          }
        },
      ),
    );
  }
}

// Model Chat
class _ChatTabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ChatTabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.gray,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.white : AppColors.text,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String company;
  final String message;
  final String time;
  final int unreadCount;
  final String imageUrl;
  final VoidCallback? onTap;

  const ChatItem({
    required this.name,
    required this.company,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.imageUrl,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: AppColors.gray,
      ),
      title: Row(
        children: [
          Text(
            name,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              '• $company',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(
        message,
        style: GoogleFonts.poppins(fontSize: 12),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          if (unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                unreadCount.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}