// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Posts {
  int userId;
  int id;
  String title;
  String body;
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });


  Posts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Posts(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts.fromJson(String source) => Posts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Posts(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant Posts other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
