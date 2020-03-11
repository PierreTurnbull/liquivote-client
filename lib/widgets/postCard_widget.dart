import 'package:flutter/material.dart';
import 'package:liquivote/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(width: 1, color: Color.fromARGB(255, 200, 200, 200)),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildContent(),
        ]
      )
    );
  }

  _buildTitle () {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Text(
        post.title,
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 70, 70, 70)
        ),
      ),
    );
  }

  _buildContent () {
    return Text(
      post.content,
      style: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 70, 70, 70)
      ),
    );
  }
}