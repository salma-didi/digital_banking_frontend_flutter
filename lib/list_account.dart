import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class listAccountsPage extends StatefulWidget {
  const listAccountsPage({Key? key}) : super(key: key);

  @override
  State<listAccountsPage> createState() => _listAccountsState();
}

class _listAccountsState extends State<listAccountsPage> {

  List<dynamic> listOperations=[];
  TextEditingController controllerID=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Accounts")),
        body: Padding(
             padding: EdgeInsets.all(20),
             child: Column(
                children:[
                  TextField(
                  controller: controllerID,
                  style: TextStyle(fontSize: 30,color: Colors.grey),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'account ID',
                    suffixIcon: IconButton(onPressed: (){
                      loadOperations(controllerID.text);
                       },color: Colors.blueAccent,icon:Icon(Icons.search)),
                    ),

                  ),

                  Expanded(child:
                      this.listOperations==null?CircularProgressIndicator():
                      ListView.separated(
                      separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
                      itemCount:(this.listOperations == null)?0:this.listOperations.length,
                      itemBuilder:(context,index){
                      return ListTile(

                      title:Text("${this.listOperations[index]['operationDate']}"),
                      subtitle:Text("${this.listOperations[index]['type']}"),
                      trailing:Text("${this.listOperations[index]['amount']}")
                      );
                      }// Card
                   ),
                  )

                ],
                  )

              ),
        // Center
     );// Scaffold
  }
  void loadOperations(String text) {
    String url="http://192.168.72.1:8085/accounts/"+text+"/pageOperations";
    http.get(Uri.parse(url))
        .then((resp){
      setState((){
        this.listOperations=json.decode(resp.body)['accountOperationsDTOS'];
      });
    }).catchError((err){
      print(err);
    });
  }
}
