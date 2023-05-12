import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/screens/itembuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class DetailItem extends StatelessWidget {
 Item item;


 DetailItem({required this.item});



  @override
  Widget build(BuildContext context) {

   final provider = Provider.of<HomeProvider>(context, listen: true);

    return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(backgroundColor:Colors.white38,
     elevation: 0,
toolbarHeight:30,
     leading: IconButton(icon: Icon(Icons.keyboard_arrow_down,size: 30,color: defaultcolor2,),onPressed: (){
      Navigator.popUntil(context,ModalRoute.withName('/Home'));
      provider.clearSugessted();

     },),
     ),
     body: SingleChildScrollView(

       child: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [

          Container(
           color: Colors.white,
           width: double.infinity,
           height: 250,

           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Image.network('${item.image}'),
           ),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

            Text('${item.name}',style: TextStyle(fontSize:35),),

           ],
          ),
          SizedBox(height: 10,),

          //Text(' EGP ${item.price}',style: TextStyle(color: Colors.black,fontSize: 15),),

          Text('${item.description}',style: TextStyle(fontSize: 13,color: Colors.grey),),
          SizedBox(height: 25,),
        Row(
         mainAxisAlignment:MainAxisAlignment.center,
         children: [
         ElevatedButton(
          onPressed: () {
           provider.minus(item);
          },
          child: Icon(Icons.remove,color: defaultcolor2,),
          style: ElevatedButton.styleFrom(
           backgroundColor:Colors.deepPurple[50],
           shape: CircleBorder(),
           padding: EdgeInsets.all(14),
          ),
         ),
         Container(
          width: 60,
          height: 60,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10),color:Colors.grey[100]),
          child: Text('${item.quantity}',style: TextStyle(color: Colors.black,fontSize: 16),),
         ),
          ElevatedButton(


           onPressed: () {
            provider.plus(item);

           },



           child: Icon(Icons.add),
           style:
             ElevatedButton.styleFrom(


            backgroundColor: defaultcolor2,
            shape: CircleBorder(),
            padding: EdgeInsets.all(14),
           ),
          ),
        ],),
SizedBox(height: 100,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisSize: MainAxisSize.max,
               //   mainAxisAlignment: MainAxisAlignment,

               children: [
                 // Container(
                 //   width: 10,
                 //   height: 30,
                 //   color: defaultcolor2,
                 // ),
                 SizedBox(width: 10,),
                 Text('You might also like',style: TextStyle(fontSize: 25),

                 ),
                 SizedBox(width:30,),
                 TextButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios,color: defaultcolor2,))
               ],
             ),
           ),


           SizedBox(height: 10,),
           Container(
               height: 200,
               child:ListView.separated(itemBuilder: (context,index)=> Itembuilder(item: provider.suggested[index],context: context,), separatorBuilder: (context,index)=>SizedBox(width: 10,), itemCount:provider.suggested.length,
                 scrollDirection: Axis.horizontal,

               )






           ),

         ],

         ),
       ),
     ),
     bottomNavigationBar: Padding(
       padding: const EdgeInsets.all(15.0),
       child: InkWell(
         splashColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,

        onTap: () {
          provider.addtocart(item,context);
Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
dismissDirection: DismissDirection.startToEnd,
           behavior: SnackBarBehavior.floating,

           content: Text('Successful'),
           duration: Duration(seconds: 2),
           backgroundColor:defaultColor,
action:  SnackBarAction(label: 'Undo', onPressed: () {
  if(item.quantity==1){
    provider.removefromcart(item);
  }
  else{
    provider.minus(item);
  }

},
textColor: Colors.white,)
          ),
         );
        },
        child: Container(

         decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(30),color: defaultcolor2),

         alignment: Alignment.center,
         height: 60.0,
         child: Padding(
           padding: const EdgeInsets.only(left: 30,right: 20),
           child: Row(

             children: [
               const Text(
                'Add to Cart',
                style: TextStyle(
                 fontSize:20.0,

                    color: Colors.white
                ),
               ),
              SizedBox(width: 150,),
              Expanded(child: Text('EGP ${ item.quantity==0?item.price! * (item.quantity+1):item.price!*(item.quantity)}',style: TextStyle(color: Colors.white,fontSize: 18),))

             ],
           ),
         ),
        ),
       ),
     ),
    
    ) ;
  }



}
