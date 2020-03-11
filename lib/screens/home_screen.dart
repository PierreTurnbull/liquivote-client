import 'package:flutter/material.dart';
import 'package:liquivote/bodies/home_body.dart';
import 'package:liquivote/providers/data_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DataProvider>(context).fetchPosts();
    return HomeBody();
  }
}