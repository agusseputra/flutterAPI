import 'dart:convert';

import 'package:reqres/model/responsepost.dart';
import 'package:reqres/model/user.dart';
import 'package:http/http.dart' as http;
class ApiService {
 static final _host = 'http://10.10.63.12/belajarapi/public/api';
  static final _baseurl = 'http://10.10.63.12/belajarapi/public';
  static Future<List<User>> getListUser() async {
    List<User> listUser = [];
    final response = await http.get('$_host/member'); 
    try {    
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        ResponUser responUser = ResponUser.fromJson(json);
        responUser.data.forEach((item) {
          listUser.add(item);
        });
        return listUser;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
  static baseUrl(){
    return _baseurl;
  }
  static Future<ResponsePost> saveMember(fName, lName, eMail, avatar) async {
    final response = await http.post('$_host/member', body: {'first_name': fName, 'last_name': lName, 'email':eMail, 'avatar':avatar});
    if (response.statusCode == 200) {
       ResponsePost responseRequest = ResponsePost.fromJson(jsonDecode(response.body));
      return responseRequest;
      } else {
        return null;
      }
  }
   static Future<ResponsePost> updateUser(id, fName, lName, eMail, avatar) async {
    
  }

}