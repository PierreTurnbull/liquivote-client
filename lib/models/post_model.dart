import 'package:liquivote/models/user_model.dart';

class Post {
  final int id;
  final String title;
  final String content;
  final User user;
  final int votesSum;
  final int votesCount;
  final int votesYesCount;
  final int votesNoCount;

  Post({
    this.id,
    this.title,
    this.content,
    this.user,
    this.votesSum,
    this.votesCount,
    this.votesYesCount,
    this.votesNoCount
  });

  factory Post.fromObject(Map<String, dynamic> object) {
    if (object == null) { return null; }
    return Post(
      id: object['id'],
      title: object['title'],
      content: object['content'],
      user: User.fromObject(object['user']),
      votesSum: object['votesSum'],
      votesCount: object['votesCount'],
      votesYesCount: object['votesYesCount'],
      votesNoCount: object['votesNoCount'],
    );
  }
}