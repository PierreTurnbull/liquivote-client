import 'package:flutter/material.dart';
import 'package:liquivote/models/post_model.dart';
import 'package:liquivote/providers/data_provider.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(width: 1, color: Color.fromARGB(255, 200, 200, 200)),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        children: [
          _buildVotes(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                SizedBox(height: 15,),
                _buildContent(),
              ]
            )
          )
        ]
      )
    );
  }

  _buildVotes (BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 50,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.arrow_drop_up),
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false).saveVote(
                  post.currentUserVote,
                  true,
                  post.id
                );
              },
            ),
          ),
          Container(
            width: 50,
            child: Text(
              post.votesSum.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 70, 70, 70)
              ),
            )
          ),
          Container(
            height: 30,
            width: 50,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.arrow_drop_down),
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false).saveVote(
                  post.currentUserVote,
                  false,
                  post.id
                );
              },
            ),
          ),
        ]
      )
    );
  }

  _buildTitle () {
    return Text(
      post.title,
      style: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 70, 70, 70)
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