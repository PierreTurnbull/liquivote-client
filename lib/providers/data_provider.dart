import 'package:flutter/widgets.dart';
import 'package:liquivote/models/post_model.dart';
import 'package:liquivote/models/vote_model.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:liquivote/tools/network.dart';
import 'package:provider/provider.dart';

class DataProvider with ChangeNotifier {
  final context;
  final Network _network = Network();

  List<Post> _posts;

  List<Post> get posts => [..._posts];

  DataProvider(this.context);

  void fetchPosts() async {
    final response = await _network.get('http://127.0.0.1:3000/posts');
    if (response['statusCode'] == 401) {
      Provider.of<AuthProvider>(context, listen: false).logout();
    }
    _posts = response['body'].map<Post>((item) {
      return Post.fromObject(item);
    }).toList();
  }

  void createVote (vote) async {
  }

  void updateVote (vote) async {
  }

  void saveVote(vote, value, postId) async {
    if (vote == null) {
      final newVote = NewVote(value: value, postId: postId);
      this.createVote(newVote);
    } else {
      vote.value = value;
      this.updateVote(vote);
    }
  }
}