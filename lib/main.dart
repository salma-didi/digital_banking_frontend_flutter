import 'package:ebanking_frontend_modile/customer.dart';
import 'package:ebanking_frontend_modile/home.dart';
import 'package:ebanking_frontend_modile/list_account.dart';
import 'package:ebanking_frontend_modile/new_customer.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.grey)
          )
      ),
      routes: {
        "/":(context)=>Home(),
        "/customers":(context)=>CustomerPage(),
        "/Listaccounts":(context)=>listAccountsPage(),
        "/NewCustomer":(context)=>NewCustomer(),
      },
    );

  }

}