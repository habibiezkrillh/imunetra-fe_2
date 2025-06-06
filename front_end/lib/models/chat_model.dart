class ChatModel {
  final String name;
  final String company;
  final String message;
  final String time;
  final int unreadCount;
  final String imageUrl;
  final bool read;

  ChatModel({
    required this.name,
    required this.company,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.imageUrl,
    required this.read,
  });

  // Factory constructor untuk membuat dari JSON
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      name: json['name'] ?? '',
      company: json['company'] ?? '',
      message: json['message'] ?? '',
      time: json['time'] ?? '',
      unreadCount: json['unreadCount'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      read: json['read'] ?? false,
    );
  }

  // Method untuk convert ke JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'company': company,
      'message': message,
      'time' : time,
      'unreadCount': unreadCount,
      'imageUrl': imageUrl,
      'read': read,
    };
  }

  // Method copyWith untuk immutable updates
  ChatModel copyWith({
    String? name,
    String? company,
    String? message,
    String? time,
    int? unreadCount,
    String? imageUrl,
    bool? read,
  }) {
    return ChatModel(
      name: name ?? this.name,
      company: company ?? this.company,
      message: message ?? this.message,
      time: time ?? this.time,
      unreadCount: unreadCount ?? this.unreadCount,
      imageUrl: imageUrl ?? this.imageUrl,
      read: read ?? this.read,
    );
  }

  @override
  String toString() {
    return 'ChatModel(name: $name, company: $company, message: $message, time: $time, unreadCount: $unreadCount, imageUrl: $imageUrl, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.name == name &&
        other.company == company &&
        other.message == message &&
        other.time == time &&
        other.unreadCount == unreadCount &&
        other.imageUrl == imageUrl &&
        other.read == read;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        company.hashCode ^
        message.hashCode ^
        time.hashCode ^
        unreadCount.hashCode ^
        imageUrl.hashCode ^
        read.hashCode;
  }
}
