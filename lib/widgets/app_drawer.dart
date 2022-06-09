import 'package:ebanking_frontend_modile/widgets/drawer_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("images/banque.jpg"),
                radius: 50,
              ),
            ],
          )),
          DrawerItem("Home","/",Icon(Icons.home)),
          DrawerItem("Customers","/customers",Icon(Icons.supervised_user_circle)),
          DrawerItem("Accounts","/Listaccounts",Icon(Icons.account_balance)),
          DrawerItem("New customer","/NewCustomer",Icon(Icons.new_label)),

        ],
      ),
    );
  }
}
