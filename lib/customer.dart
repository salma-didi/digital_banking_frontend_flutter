import 'package:ebanking_frontend_modile/accounts_page.dart';
import'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CustomerPage extends StatefulWidget{
  get customer => null;


  @override
  _CustomerPageState createState()=> _CustomerPageState();
}


class _CustomerPageState extends State<CustomerPage> {
  List<dynamic> listCustomers=[];


  void deleteItem(int index){
    listCustomers.removeAt(index);
    listCustomers.forEach((e) {
      print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customers'),),
      body: Center(
          child:this.listCustomers==null?CircularProgressIndicator():
          ListView.separated(
              separatorBuilder: (context,index)=>Divider(color: Colors.grey,height: 3),
              itemCount:(this.listCustomers == null)?0:this.listCustomers.length,
              itemBuilder:(context,index){
                return ListTile(
                  leading: CircleAvatar(child: Text(
                      this.listCustomers[index]['name'].substring(0, 1))),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder:(conext)=>new AccountsPage(listCustomers[index]),));
                  },
                  title: Text(this.listCustomers[index]['name'],
                            style:TextStyle(color:Colors.black)),
                  subtitle:Text(this.listCustomers[index]['email'],
                      style:TextStyle(color:Colors.black)),
                  trailing: IconButton(
                      icon:Icon(Icons.delete),
                      onPressed: (){
                        deleteCustomer(this.listCustomers[index]['id']);
                        setState(() {
                          deleteItem(index);
                        });
                      }),
                );
              }// Card
          )
      ), // Center
    ); // Scaffold
  }
  @override
  void initState(){
    // TODO:implement initState
    super.initState();
    loadCustomers();
  }
  void loadCustomers(){
    String url="http://192.168.72.1:8085/customers";
    http.get(Uri.parse(url))
        .then((resp){
      setState((){
        this.listCustomers=json.decode(resp.body);
      });
    }).catchError((err){
      print(err);
    });
  }

  void deleteCustomer(int index) {
    String url="http://192.168.72.1:8085/customers/"+index.toString();
    http.delete(Uri.parse(url))
       .catchError((err){
      print(err);
    });
  }

}