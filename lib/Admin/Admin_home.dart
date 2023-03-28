import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/dialog/dialog.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class  AdminHome extends StatefulWidget {


  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
   // Provider.of<HomeProvider>(context, listen: false).getItemsFromDB();
    super.initState();
  }
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);

    return WillPopScope(onWillPop:()async{
return false;

    },
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: defaultColor,
actions: [
  IconButton(onPressed: (){
   Navigator.push(context, MaterialPageRoute(builder: (build)=>Login()));
  }, icon: Icon(Icons.logout_outlined),)
],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Item? item = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddItemDialog();
              },
            );
            if(item==null){}
            else{
            provider.addItem(item);}
          },
          child: Icon(Icons.add),
          backgroundColor: defaultColor,
        ),

      ),

    );
  }
}
