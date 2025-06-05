import 'package:equatable/equatable.dart';
import '../../models/chat_model.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {
  const ChatInitial();
}

class ChatLoading extends ChatState {
  const ChatLoading();
}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;
  final List<ChatModel> filteredChats;
  final String currentFilter;
  final String searchQuery;
  final bool isSearching;

  const ChatLoaded({
    required this.chats,
    required this.filteredChats,
    this.currentFilter = 'Semua',
    this.searchQuery = '',
    this.isSearching = false,
  });

  ChatLoaded copyWith({
    List<ChatModel>? chats,
    List<ChatModel>? filteredChats,
    String? currentFilter,
    String? searchQuery,
    bool? isSearching,
  }) {
    return ChatLoaded(
      chats: chats ?? this.chats,
      filteredChats: filteredChats ?? this.filteredChats,
      currentFilter: currentFilter ?? this.currentFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object> get props => [
        chats,
        filteredChats,
        currentFilter,
        searchQuery,
        isSearching,
      ];
}

class ChatError extends ChatState {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}

class ChatSearching extends ChatState {
  final String query;

  const ChatSearching(this.query);

  @override
  List<Object> get props => [query];
}