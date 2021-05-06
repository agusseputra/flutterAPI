import 'dart:convert';
import 'package:reqres/model/responsepost.dart';
import 'package:reqres/model/user.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static final _host = 'http://192.168.100.128/belajarapi/public/api';
  static final _baseurl = 'http://192.168.100.128/belajarapi/public';
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
    try {
      final response = await http.post('$_host/member', body: {'first_name': fName, 'last_name': lName, 'email':eMail, 'avatar':avatar});
        if (response.statusCode == 200) {
          ResponsePost responseRequest = ResponsePost.fromJson(jsonDecode(response.body));
          return responseRequest;
        } else {
          return ResponsePost(success: false,message:response.statusCode.toString(),id: 0 );
        }
    } catch (e) {
      return ResponsePost(success: false,message:'error caught: $e',id: 0 );
    }
    
  }
  static Future<ResponsePost> updateUser(id, fName, lName, eMail, avatar) async {
    try {
      final response = await http.post('$_host/member/$id', body: {'first_name': fName, 'last_name': lName, 'email':eMail, 'avatar':avatar});
      if (response.statusCode == 200) {
        ResponsePost responseRequest = ResponsePost.fromJson(jsonDecode(response.body));
        return responseRequest;
      } else {
        return ResponsePost(success: false,message:response.statusCode.toString(),id: 0 );
      }
    } catch (e) {
      return ResponsePost(success: false,message:'error caught: $e',id: 0 );
    }
  }
  static Future<ResponsePost> deleteUser(id) async {
    try {
      final response = await http.delete('$_host/member/$id');
      if (response.statusCode == 200) {
        ResponsePost responseRequest = ResponsePost.fromJson(jsonDecode(response.body));
        return responseRequest;
      } else {
        return ResponsePost(success: false,message:response.statusCode.toString(),id: 0 );
      }
    } catch (e) {
      return ResponsePost(success: false,message:'error caught: $e',id: 0 );
    }
  }

}