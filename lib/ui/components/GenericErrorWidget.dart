import 'package:flutter/material.dart';

class GenericErrorWidget extends StatelessWidget {
  String errorMessage;
  String? actioName;
  VoidCallback? action;
  GenericErrorWidget(this.errorMessage, {this.action, this.actioName});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(errorMessage),
          actioName != null
              ? ElevatedButton(onPressed: action, child: Text(actioName!))
              : Container()
        ],
      ),
    );
    ;
  }
}
