import 'package:flutter/material.dart';
import 'package:reqres/model/responsepost.dart';
import 'package:reqres/model/user.dart';
import 'package:reqres/services/api.dart';
import 'package:reqres/ui/users.dart';
import 'package:toast/toast.dart';

class Updateuser extends StatefulWidget {
   static const String id = "UPDATEUSER";
   final User user;
   Updateuser({this.user});

  @override
  _UpdateuserState createState() => _UpdateuserState();
}

class _UpdateuserState extends State<Updateuser> {
  final _formKey=GlobalKey<FormState>();
  bool _validate=false;
  bool _isupdate=false;
  ResponsePost response;
  bool _success;
  String id;
  TextEditingController  fName, lName, email;
  void validasi() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      if(_isupdate){
        //update
      }else{
        //simpan
        response = await ApiService.saveMember(fName.text, lName.text,email.text,'av1.png');
      }
      _success=response.success;
      if (_success) {
        Navigator.pushNamedAndRemoveUntil(context, UserPage.id, (Route<dynamic> route) => false);
        setState(() {});
        Toast.show(response.message, context);
      } else {
        Toast.show('Gagal', context);
      }
    }else {
      _validate = true;
    }

  }
  String validator(String value) {
    if (value.isEmpty)
      return "jangan kosong";
    else
      return null;
  }

  @override
  void initState() {
    super.initState();
    if(widget.user != null){
      _isupdate=true;
      id=widget.user.id.toString();
      fName=TextEditingController(text:widget.user.firstName);
      lName=TextEditingController(text: widget.user.lastName);
      email=TextEditingController(text: widget.user.email);
    }else{
      fName=TextEditingController();
      lName=TextEditingController();
      email=TextEditingController();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: _isupdate ? Text('Update Data') : Text('Tambah Data'),
          ),
        ),
        body: SingleChildScrollView(
          padding:const EdgeInsets.all(8),
          child: Form(
            autovalidate: _validate,
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: fName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "First Name",
                    ),
                    validator: validator,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: lName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Last Name",
                    ),
                    validator: validator,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    validator: validator,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'SIMPAN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: validasi,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}