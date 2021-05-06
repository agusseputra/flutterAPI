import 'package:flutter/material.dart';
import 'package:reqres/model/user.dart';
import 'package:reqres/services/api.dart';
import 'package:reqres/ui/updateuser.dart';
import 'package:reqres/widget/itemuser.dart';

class UserPage extends StatelessWidget {
  static const String id = "HALAMANBERANDA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text('Daftar Member Aktif', style: TextStyle(fontSize: 14),),
          ),
        ),
      body: GridUser(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Updateuser(user: null,)));
        },
      ),
    );
  }
}
class GridUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<User>>(
              future: ApiService.getListUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  List<User> listUser = snapshot.data;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: listUser?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        splashColor: Colors.indigo,
                        borderRadius: BorderRadius.circular(10.0),
                        child: itemUser(listUser[index], context),
                    //     onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Updateuser(
                    //           user: listUser[index]
                    //             )));
                    //     },
                      );
                    },
                  );
                }
              },
            )));
  }
}
