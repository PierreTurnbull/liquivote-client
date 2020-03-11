import 'package:flutter/material.dart';
import 'package:liquivote/providers/data_provider.dart';
import 'package:liquivote/widgets/postCard_widget.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: Provider.of<DataProvider>(context).posts.map((post) {
          return PostCard(post);
        }).toList(),
      )
    );
  }
}