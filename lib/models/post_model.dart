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

  factory Post.fromObject(Map<String, dynamic> object) {
    if (object == null) { return null; }
    return Post(
      id: object['id'],
      title: object['title'],
      content: object['content'],
      userId: object['userId'],
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