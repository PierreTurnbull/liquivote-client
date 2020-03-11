class Post {
  final int id;
  final String title;
  final String content;
  final int userId;

  Post({ this.id, this.title, this.content, this.userId });

  factory Post.init(int userId) {
    return Post(
      id: null,
      title: '',
      content: '',
      userId: userId,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    if (json == null) { return null; }
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'userId': userId,
    };
  }
}