import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class AccountsPage extends StatefulWidget {

  final customer;

  AccountsPage(this.customer);

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {

  List<dynamic> listAccounts=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Accounts de ${widget.customer['name']}'),),
        body: Center(
            child:this.listAccounts==null?CircularProgressIndicator():
            ListView.separated(
                separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
                itemCount:(this.listAccounts == null)?0:this.listAccounts.length,
                itemBuilder:(context,index){
                  return ListTile(
                    title: Text(this.listAccounts[index]['type'],
                        style:TextStyle(color:Colors.black)),
                    subtitle:Text(this.listAccounts[index]['balance'].toString(),
                        style:TextStyle(color:Colors.black)),
                  );
                }// Card
            )
        ),// Center
    );// Scaffold
  }
  @override
  void initState(){
    // TODO:implement initState
    super.initState();
    loadAccounts();
  }
  void loadAccounts(){
    String url="http://192.168.72.1:8085/customers/"+'${widget.customer['id']}'+"/accounts";
    http.get(Uri.parse(url)).then((resp){
      setState((){
        this.listAccounts=json.decode(resp.body)['customerAccountsDTO'];
      });
    }).catchError((err){
      print(err);
    });

  }
}

