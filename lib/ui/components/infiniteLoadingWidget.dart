import 'package:flutter/material.dart';

class InfiniteLoadingWidget extends StatelessWidget {
  String LoadingMessage;
  InfiniteLoadingWidget(this.LoadingMessage);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          Text(LoadingMessage)
        ],
      ),
    );;
  }
}
