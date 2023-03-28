import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/constance/constant/const.dart';
import 'package:ecommerce/models/item_model.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class fav extends StatefulWidget {
  final Item item;
  const fav({Key? key, required this.item}) : super(key: key);

  @override
  State<fav> createState() => _fav();
}

class _fav extends State<fav> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: true);

    return Dismissible(

    
      key: Key(widget.item.id.toString()),
      onDismissed: (direction){
        provider.removefromcart(widget.item);

      },
      background:Container(

        alignment: Alignment.centerRight,
        color: Colors.red,
      child: Icon(Icons.delete,color: Colors.white,),
      ),
      child: Card(
        
        child: Row(

          children: [
              Expanded(
                flex: 3,
                child: Container(
                      width: 180,
                       height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),image: DecorationImage(image: NetworkImage('${widget.item?.image}',),fit: BoxFit.cover),),),
              ),
                     // child: Image.network('${widget.item?.image}',fit: BoxFit.fill,width: 120,height: 120,)),
                  SizedBox(width: 10,),

                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 80,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${widget.item?.name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1),


                          Text('${widget.item?.price} LE',style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis,color: Colors.grey[800]),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Expanded(flex: 1,
                    child: Container(
                      width: 20,
                      child: MaterialButton(onPressed: (){
                        provider.plus(widget.item);

                      },child: Text('+',style: TextStyle(fontSize: 25),),


                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("${widget.item.quantity}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 8,
                      child: MaterialButton(onPressed: (){
                        provider.minus(widget.item);

                      },child:Icon(Icons.remove_circle_outline)
                        //Text('-',style: TextStyle(fontSize: 25),),


                      ),
                    ),
                  ),







          ],
        ),
      ),
    );
    ;
  }
}
