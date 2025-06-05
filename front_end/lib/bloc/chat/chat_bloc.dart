import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/chat_service.dart';
import '../../models/chat_model.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatService _chatService;

  ChatBloc({required ChatService chatService})
      : _chatService = chatService,
        super(const ChatInitial()) {
    
    on<LoadChats>(_onLoadChats);
    on<SearchChats>(_onSearchChats);
    on<FilterChats>(_onFilterChats);
    on<MarkChatAsRead>(_onMarkChatAsRead);
    on<RefreshChats>(_onRefreshChats);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatLoading());
      
      final chats = await _chatService.getAllChats();
      
      emit(ChatLoaded(
        chats: chats,
        filteredChats: chats,
        currentFilter: 'Semua',
      ));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onSearchChats(SearchChats event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;

    final currentState = state as ChatLoaded;
    
    try {
      emit(ChatSearching(event.query));
      
      List<ChatModel> searchResults;
      
      if (event.query.isEmpty) {
        // Jika query kosong, kembalikan ke filter saat ini
        searchResults = await _getFilteredChats(
          currentState.chats, 
          currentState.currentFilter
        );
      } else {
        // Cari berdasarkan query
        searchResults = await _chatService.searchChats(event.query);
        
        // Terapkan filter juga pada hasil pencarian
        searchResults = await _getFilteredChats(
          searchResults, 
          currentState.currentFilter
        );
      }

      emit(currentState.copyWith(
        filteredChats: searchResults,
        searchQuery: event.query,
        isSearching: event.query.isNotEmpty,
      ));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onFilterChats(FilterChats event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;

    final currentState = state as ChatLoaded;
    
    try {
      List<ChatModel> baseChats = currentState.chats;
      
      // Jika sedang dalam mode pencarian, gunakan hasil pencarian sebagai base
      if (currentState.isSearching && currentState.searchQuery.isNotEmpty) {
        baseChats = await _chatService.searchChats(currentState.searchQuery);
      }
      
      final filteredChats = await _getFilteredChats(baseChats, event.filter);

      emit(currentState.copyWith(
        filteredChats: filteredChats,
        currentFilter: event.filter,
      ));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onMarkChatAsRead(MarkChatAsRead event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;

    final currentState = state as ChatLoaded;
    
    try {
      await _chatService.markAsRead(event.chatName);
      
      // Reload chats to get updated data
      final updatedChats = await _chatService.getAllChats();
      
      // Reapply current filter and search
      List<ChatModel> filteredChats = updatedChats;
      
      if (currentState.isSearching && currentState.searchQuery.isNotEmpty) {
        filteredChats = await _chatService.searchChats(currentState.searchQuery);
      }
      
      filteredChats = await _getFilteredChats(filteredChats, currentState.currentFilter);

      emit(currentState.copyWith(
        chats: updatedChats,
        filteredChats: filteredChats,
      ));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onRefreshChats(RefreshChats event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;

    final currentState = state as ChatLoaded;
    
    try {
      final chats = await _chatService.getAllChats();
      
      // Reapply current filter and search
      List<ChatModel> filteredChats = chats;
      
      if (currentState.isSearching && currentState.searchQuery.isNotEmpty) {
        filteredChats = await _chatService.searchChats(currentState.searchQuery);
      }
      
      filteredChats = await _getFilteredChats(filteredChats, currentState.currentFilter);

      emit(currentState.copyWith(
        chats: chats,
        filteredChats: filteredChats,
      ));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<List<ChatModel>> _getFilteredChats(List<ChatModel> chats, String filter) async {
    switch (filter) {
      case 'Belum dibaca':
        return chats.where((chat) => !chat.read).toList();
      case 'Relawan':
        return chats.where((chat) => chat.company.toLowerCase().contains('relawan')).toList();
      default:
        return chats;
    }
  }
}