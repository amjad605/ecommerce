import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/fav.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);
    if(provider.cartItem.length>0){
    return Scaffold(

appBar: AppBar(

  backgroundColor: Colors.white,
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios,color: defaultcolor2,), onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())); },
  ),
  elevation: 0,
  toolbarHeight: 45,
),
body: Padding(
  padding: const EdgeInsets.only(top: 20),
  child:   Column(
    children: [
      Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(left: 27.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Text('Cart',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),flex: 2,),
              Expanded(child: TextButton(onPressed: (){provider.clear();}, child: Text('Clear all',style: TextStyle(color: defaultcolor2,fontSize: 20),))),
            ],
          ),
        ),
      ),
      SizedBox(height: 25,),
      Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text('${DateFormat.E().format(DateTime.now())}, ${DateFormat.MMMMd().format(DateTime.now())} ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      SizedBox(height: 20,),
      Expanded(child: ListView.separated(itemBuilder: (context,index)=>fav(item: provider.cartItem[index]), separatorBuilder:(context,index)=>  Container(width: double.infinity,height: 1.0,color: Colors.grey[300],), itemCount: provider.cartItem.length)),
    ],
  crossAxisAlignment: CrossAxisAlignment.start,),
),

  bottomNavigationBar:Container(
    constraints: BoxConstraints.tightForFinite(),

    decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(35),topEnd: Radius.circular(35)),color: Colors.deepPurple[50]),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(

              children: [
                Expanded(flex:2,child: Text('Total :',style: TextStyle(color:defaultcolor2,fontSize: 25,),)),
                SizedBox(width: 100,),
                Expanded(child: Text('${provider.TotalSum.toStringAsFixed(2)} LE',style: TextStyle(color: defaultcolor2,fontSize: 20,fontWeight: FontWeight.bold),maxLines: 1,)),


              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 10),
            child: Container(
              width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: defaultcolor2),
                child: MaterialButton(onPressed: (){},child: Text('Checkout',style: TextStyle(color: Colors.white,fontSize: 20),),)),
          ),

        ],
      ),
    ),
    width: double.infinity,

    height: 200,

  ),
    );
  }else
    {
      return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody:true,
        appBar: AppBar(

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: defaultcolor2,), onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));},
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Image.network('https://cdn-icons-png.flaticon.com/512/2762/2762885.png'),
        ),
      );
    }
}
}
