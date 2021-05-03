import 'package:flutter/material.dart';
import 'package:reqres/model/user.dart';
import 'package:reqres/services/api.dart';
Widget itemUser(User user) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.network(
            ApiService.baseUrl()+'/assets/avatar/'+ user.avatar,
            height: 80.0,
            width: double.infinity,
            fit: BoxFit.cover,
            // width: double.infinity,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  user.firstName,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text("${user.email}", style: TextStyle(fontSize: 8),)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}