import 'package:ecommerce/Market/detailitem.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:ecommerce/screens/itembuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fakha extends StatefulWidget{
  late int index;

  @override
  State<Fakha> createState() => _FakhaState();
}

class _FakhaState extends State<Fakha> {
  @override
  void initState() {
    //Provider.of<HomeProvider>(context, listen: false).getItemsFromDB();

    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<HomeProvider>(context, listen: true);
    // TODO: implement build
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            Container(

              width: double.infinity,
height: 150,

padding:EdgeInsetsDirectional.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(30),
                image: DecorationImage(image :AssetImage("assets/images/groc.png")),

              ),
            ),
            Padding(

              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 30,
                    color: defaultcolor2,
                  ),
                  SizedBox(width: 5,),
                  Text('CATEGORY',style: TextStyle(fontSize: 30,),
                  ),
                  SizedBox(width: 120,),
                //  TextButton(onPressed: (){}, child: Text('See More',style: TextStyle(color: defaultcolor2,fontSize: 18),),)
                ],
              ),
            ),
          SizedBox(height: 10,),
          Container(
            height: 100,

            child: ListView.separated(itemBuilder:(context,int index)=> categoryBuilder(index), separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 0,) ;}, itemCount: category.length,scrollDirection: Axis.horizontal,),
          ),
            SizedBox(height: 30,),

        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
          //  physics: NeverScrollableScrollPhysics(),
            child: Container(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(


                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    width: 10,
                    height: 30,
                    color: defaultcolor2,
                  ),
                  SizedBox(width: 5,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text('Usually Buy',style: TextStyle(fontSize: 30,),

                      ),
                      SizedBox(width:10,),
                      TextButton(onPressed: (){}, child:Icon(Icons.arrow_forward_ios,color: defaultcolor2,))
                      ,],
                  ),
                  SizedBox(width: 120,),
                  //  TextButton(onPressed: (){}, child: Text('See More',style: TextStyle(color: defaultcolor2,fontSize: 18),),)
                ],
              ),
            ),
          ),
        ),
            Container(
height: 200,
              child:ListView.separated(itemBuilder: (context,index)=> Itembuilder(item: provider.items[index],), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:provider.items.length,
              scrollDirection: Axis.horizontal,

              )






              ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
           //   mainAxisAlignment: MainAxisAlignment,

                children: [
                  Container(
                    width: 10,
                    height: 30,
                    color: defaultcolor2,
                  ),
                  SizedBox(width: 10,),
                  Text('Grocery',style: TextStyle(fontSize: 30),

                  ),
                  SizedBox(width:30,),
                  TextButton(onPressed: (){}, child:Icon(Icons.arrow_forward_ios,color: defaultcolor2,))
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
                height: 200,
                child:ListView.separated(itemBuilder: (context,index)=> Itembuilder(item: provider.a[index],), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:provider.a.length,
                  scrollDirection: Axis.horizontal,

                )






            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment,

                children: [
                  Container(
                    width: 10,
                    height: 30,
                    color: defaultcolor2,
                  ),
                  SizedBox(width: 10,),
                  Text('Fruit',style: TextStyle(fontSize: 30),

                  ),
                  SizedBox(width:30,),
                  TextButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios,color: defaultcolor2,))
                ],
              ),
            ),


            SizedBox(height: 10,),
            Container(
                height: 200,
                child:ListView.separated(itemBuilder: (context,index)=> Itembuilder(item: provider.b[index],), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:provider.b.length,
                  scrollDirection: Axis.horizontal,

                )






            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment,

                children: [
                  Container(
                    width: 10,
                    height: 30,
                    color: defaultcolor2,
                  ),
                  SizedBox(width: 10,),
                  Text('Vegetables',style: TextStyle(fontSize: 30),

                  ),
                  SizedBox(width:30,),
                  TextButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios,color: defaultcolor2,)),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
                height: 200,
                child:ListView.separated(itemBuilder: (context,index)=> Itembuilder(item: provider.c[index],), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:provider.c.length,
                  scrollDirection: Axis.horizontal,

                )






            ),




          ],

        ),
      )



    );

  }

Widget categoryBuilder(int index)=>  MaterialButton(
  child:   Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
padding: EdgeInsetsDirectional.all(15),
      alignment: AlignmentDirectional.center,
      height: 100,
      width:150,

      decoration:  BoxDecoration(
        color: defaultColor,

        borderRadius:
        BorderRadiusDirectional.circular(30),
      ),
      child: Text(category[index],style:TextStyle(fontSize: 15),),),
  ),
  onPressed: (){},
);
}
