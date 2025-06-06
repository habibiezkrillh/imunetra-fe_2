// views/pages/chat_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/views/widget/bottom_nav.dart';
import 'package:front_end/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

// Import BLoC
import '../../bloc/chat/chat_bloc.dart';
import '../../bloc/chat/chat_event.dart';
import '../../bloc/chat/chat_state.dart';
import '../../services/chat_service.dart';

// Import Screen
import 'chat_detail.page.dart';

// Import Widget
import '../widget/chat_item.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(chatService: ChatServiceImpl())
        ..add(const LoadChats()),
      child: const ChatPageView(),
    );
  }
}

class ChatPageView extends StatefulWidget {
  const ChatPageView({super.key});

  @override
  State<ChatPageView> createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Column(
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
                          controller: _searchController,
                          onChanged: (value) {
                            context.read<ChatBloc>().add(SearchChats(value));
                          },
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
                      if (state is ChatSearching)
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                    ],
                  ),
                ),
              ),

              // Filter tab
              if (state is ChatLoaded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _ChatTabButton(
                          label: 'Semua',
                          selected: state.currentFilter == 'Semua',
                          onTap: () => context.read<ChatBloc>().add(const FilterChats('Semua')),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _ChatTabButton(
                          label: 'Belum dibaca',
                          selected: state.currentFilter == 'Belum dibaca',
                          onTap: () => context.read<ChatBloc>().add(const FilterChats('Belum dibaca')),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _ChatTabButton(
                          label: 'Relawan',
                          selected: state.currentFilter == 'Relawan',
                          onTap: () => context.read<ChatBloc>().add(const FilterChats('Relawan')),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 12),

              // Chat List
              Expanded(
                child: _buildChatList(context, state),
              ),
            ],
          );
        },
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

  Widget _buildChatList(BuildContext context, ChatState state) {
    if (state is ChatInitial || state is ChatLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ChatError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Terjadi kesalahan',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.message,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ChatBloc>().add(const RefreshChats());
              },
              child: const Text('Coba Lagi'),
            ),
          ],
        ),
      );
    }

    if (state is ChatLoaded) {
      if (state.filteredChats.isEmpty) {
        String emptyMessage = 'Tidak ada pesan';
        
        if (state.isSearching) {
          emptyMessage = 'Tidak ada hasil untuk "${state.searchQuery}"';
        } else if (state.currentFilter == 'Belum dibaca') {
          emptyMessage = 'Tidak ada pesan yang belum dibaca';
        } else if (state.currentFilter == 'Relawan') {
          emptyMessage = 'Tidak ada pesan dari relawan';
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: 64,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                emptyMessage,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          context.read<ChatBloc>().add(const RefreshChats());
        },
        child: ListView.builder(
          itemCount: state.filteredChats.length,
          itemBuilder: (context, index) {
            final chat = state.filteredChats[index];
            return ChatItem(
              chat: chat,
              onTap: () {
                // Mark as read when tapped
                if (!chat.read) {
                  context.read<ChatBloc>().add(MarkChatAsRead(chat.name));
                }
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetailPage(
                      userName: chat.name,
                      userImageUrl: chat.imageUrl,
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

// Model Chat Tab Button (tidak berubah)
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