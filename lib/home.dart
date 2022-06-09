import 'package:ebanking_frontend_modile/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Home"),
        ),


    );
  }

}