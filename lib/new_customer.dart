import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewCustomer extends StatefulWidget {
  const NewCustomer({Key? key}) : super(key: key);

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {

  TextEditingController controllerNom=new TextEditingController();
  TextEditingController controllerEmail=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New customer'),),
      body: Center(
          child: Column(
            children: [
          Container(
              padding:EdgeInsets.fromLTRB(6,2,6,3),
              child:TextField(
                    decoration:InputDecoration(hintText:'Name'),
                    controller: controllerNom,),// 18
            ),// Container.
            Container(
              padding:EdgeInsets.fromLTRB(6,2,6,3),
              child:TextField(
                    decoration:InputDecoration(hintText:'Email'),
                    controller: controllerEmail,),
            ),// Container
              
              ElevatedButton(onPressed: (){
                AddCustomer(controllerNom.text,controllerEmail.text);
              }, child: Text("Add customer"),)
            ],
          ),
      ),
    );
  }

  void AddCustomer(String text, String text2) {

    String url="http://192.168.72.1:8085/customers";
    http.post(Uri.parse(url), headers:{
      'Content-Type': 'application/json; charset=UTF-8',
    },body: jsonEncode({
       'name':text,
       'email':text2,
    }));
  }

}
