import '../models/chat_model.dart';

abstract class ChatService {
  Future<List<ChatModel>> getAllChats();
  Future<List<ChatModel>> searchChats(String query);
  Future<ChatModel> markAsRead(String chatName);
  Future<List<ChatModel>> getUnreadChats();
  Future<List<ChatModel>> getVolunteerChats();
}

class ChatServiceImpl implements ChatService {
  // Simulasi data - dalam implementasi nyata ini bisa dari API/Database
  final List<Map<String, dynamic>> _mockData = [
    {
      'name': 'Adel',
      'company': 'Universitas Hasanuddin',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '10:00',
      'unreadCount': 2,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': false,
    },
    {
      'name': 'Revi',
      'company': 'IndoRelawan',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '09:13',
      'unreadCount': 0,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': true,
    },
    {
      'name': 'Leonard',
      'company': 'Universitas Ciputra',
      'message': 'Halo, boleh tahu lebih mengenai acaranya?',
      'time': '09:00',
      'unreadCount': 5,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': false,
    },
    {
      'name': 'David',
      'company': 'Binus University',
      'message': 'Halo, boleh tahu lebih dalam mengenai acaranya?',
      'time': '08:55',
      'unreadCount': 0,
      'imageUrl': 'https://via.placeholder.com/48',
      'read': true,
    },
  ];

  @override
  Future<List<ChatModel>> getAllChats() async {
    // Simulasi network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    return _mockData
        .map((json) => ChatModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ChatModel>> searchChats(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await getAllChats();
    
    if (query.isEmpty) return allChats;
    
    return allChats.where((chat) => 
        chat.name.toLowerCase().contains(query.toLowerCase()) ||
        chat.company.toLowerCase().contains(query.toLowerCase()) ||
        chat.message.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  @override
  Future<ChatModel> markAsRead(String chatName) async {
    await Future.delayed(const Duration(milliseconds: 200));
    
    final chatIndex = _mockData.indexWhere((chat) => chat['name'] == chatName);
    if (chatIndex != -1) {
      _mockData[chatIndex]['read'] = true;
      _mockData[chatIndex]['unreadCount'] = 0;
      return ChatModel.fromJson(_mockData[chatIndex]);
    }
    
    throw Exception('Chat not found');
  }

  @override
  Future<List<ChatModel>> getUnreadChats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await getAllChats();
    return allChats.where((chat) => !chat.read).toList();
  }

  @override
  Future<List<ChatModel>> getVolunteerChats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    
    final allChats = await getAllChats();
    return allChats.where((chat) => 
        chat.company.toLowerCase().contains('relawan')
    ).toList();
  }
}