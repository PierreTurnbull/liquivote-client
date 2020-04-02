import 'package:flutter/widgets.dart';
import 'package:liquivote/models/post_model.dart';
import 'package:liquivote/models/vote_model.dart';
import 'package:liquivote/providers/auth_provider.dart';
import 'package:liquivote/tools/enums.dart';
import 'package:liquivote/tools/network.dart';
import 'package:provider/provider.dart';

class DataProvider with ChangeNotifier {
  final context;
  final Network _network = Network();

  List<Post> _posts;

  List<Post> get posts => _posts == null ? [] : _posts;

  DataProvider(this.context) : _posts = [];

  Future<void> fetchPosts() async {
    final response = await _network.get('http://127.0.0.1:3000/posts');
    if (response['statusCode'] == 401) {
      Provider.of<AuthProvider>(context, listen: false).logout();
    }
    _posts = response['body'].map<Post>((item) {
      return Post.fromObject(item);
    }).toList();
    notifyListeners();
  }

  void createVote (NewVote vote) async {
    await _network.post('http://127.0.0.1:3000/votes', body: vote.getJSON());
  }

  void updateVote (Vote vote) async {
    await _network.update('http://127.0.0.1:3000/votes/${vote.id}', body: vote.getJSON());
  }

  void saveVote(Vote vote, ArrowValue arrowValue, postId) async {
    bool requestValue;
    if (arrowValue == ArrowValue.MORE) { requestValue = true; }
    if (arrowValue == ArrowValue.LESS) { requestValue = false; }
    if (vote == null) {
      final newVote = NewVote(value: requestValue, postId: postId);
      this.createVote(newVote);
    } else {
      vote.value = requestValue;
      this.updateVote(vote);
    }
    notifyListeners();
  }
}