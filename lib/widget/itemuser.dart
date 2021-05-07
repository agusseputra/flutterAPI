import 'package:flutter/material.dart';
import 'package:reqres/model/responsepost.dart';
import 'package:reqres/model/user.dart';
import 'package:reqres/services/api.dart';
import 'package:reqres/ui/updateuser.dart';
import 'package:reqres/ui/users.dart';
import 'package:toast/toast.dart';
void delete(id, context) async{
  ResponsePost response;
  response = await ApiService.deleteUser(id);
  bool _success;
  _success=response.success;
      if (_success) {
        Navigator.pushNamedAndRemoveUntil(context, UserPage.id, (Route<dynamic> route) => false);
        Toast.show(response.message, context);
      } else {
        Toast.show('Gagal', context);
      }
}
Widget itemUser(User user, BuildContext context) {  
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
                  user.firstName+' '+ user.lastName,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("${user.email}", style: TextStyle(fontSize: 8),),
                    Row(
                      children: <Widget>[
                        InkWell(
                          splashColor: Colors.indigo,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Icon(Icons.edit, size: 20,),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Updateuser(
                                      user: user
                                        )));
                                },
                        ),
                        InkWell(
                          splashColor: Colors.indigo,
                          borderRadius: BorderRadius.circular(10.0),
                          child: Icon(Icons.delete, size: 20,),
                          onTap: () {
                            delete(user.id, context);
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}