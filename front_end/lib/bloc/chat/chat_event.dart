import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChats extends ChatEvent {
  const LoadChats();
}

class SearchChats extends ChatEvent {
  final String query;

  const SearchChats(this.query);

  @override
  List<Object> get props => [query];
}

class FilterChats extends ChatEvent {
  final String filter; // 'Semua', 'Belum dibaca'. 'Relawan'

  const FilterChats(this.filter);

  @override
  List<Object> get props => [filter];
}

class MarkChatAsRead extends ChatEvent {
  final String chatName;

  const MarkChatAsRead(this.chatName);

  @override
  List<Object> get props => [chatName];
}

class RefreshChats extends ChatEvent {
  const RefreshChats();
}