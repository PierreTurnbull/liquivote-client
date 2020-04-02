import 'package:flutter/material.dart';
import 'package:liquivote/models/post_model.dart';
import 'package:liquivote/providers/data_provider.dart';
import 'package:liquivote/tools/enums.dart';
import 'package:provider/provider.dart';

class PostCard extends StatelessWidget {
  final Post post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
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
                SizedBox(height: 4,),
                _buildVotesCount(),
                SizedBox(height: 16,),
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
          _buildVotesArrow(context, ArrowValue.MORE),
          _buildVotesValue(),
          _buildVotesArrow(context, ArrowValue.LESS)
        ]
      )
    );
  }

  _buildVotesArrow (context, ArrowValue arrowValue) {
    IconData iconData;
    Color iconColor;
    if (arrowValue == ArrowValue.LESS) { iconData = Icons.arrow_drop_down; }
    if (arrowValue == ArrowValue.MORE) { iconData = Icons.arrow_drop_up; }
    if (post.currentUserVote?.value == true && arrowValue == ArrowValue.MORE) {
      iconColor = Colors.blue;
    }
    if (post.currentUserVote?.value == false && arrowValue == ArrowValue.LESS) {
      iconColor = Colors.blue;
    }

    return Container(
      height: 30,
      width: 50,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Icon(iconData, color: iconColor),
        onPressed: () {
          Provider.of<DataProvider>(context, listen: false).saveVote(
            post.currentUserVote,
            arrowValue,
            post.id
          );
        },
      ),
    );
  }

  _buildVotesValue () {
    Color textColor;
    if (post.currentUserVote != null) { textColor = Colors.blue; }

    return Container(
      width: 50,
      child: Text(
        post.votesSum.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          color: textColor ?? Color.fromARGB(255, 70, 70, 70)
        ),
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

  _buildVotesCount () {
    return Text(
      post.votesCount.toString() + ' votes',
      style: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 70, 70, 70)
      )
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