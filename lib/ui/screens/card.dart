import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fundall/core/viewModels/userVM.dart';
import 'package:fundall/utils/sizeConfig.dart';
import "package:provider/provider.dart";

class Cards extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
   return  _CardState();
  }
}

 class _CardState extends State<Cards>{
 final min = 500.0;
 List<bool> card;
 final ScrollController sc = ScrollController();

 @override
  void initState() {
   card = [false,false,false];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserVM>(context, listen: false).user;
   return Scaffold(
   appBar: AppBar(leading: GestureDetector(child:Text('    Back',style: TextStyle(color: Colors.black,fontSize: 11)),onTap: ()=>Navigator.pop(context)),actions: <Widget>[
     GestureDetector(child:CircleAvatar(backgroundImage: user==null?AssetImage("assets/images/avatar.png"):NetworkImage(user.avatar),maxRadius: 25),onTap: ()=> _showDialog(context))
   ],elevation: 0,backgroundColor: Colors.transparent,title: Text('Your New Card',style: TextStyle(color: Colors.black,fontSize: 27)),centerTitle: true),
     body: SafeArea(child:ConstrainedBox(
             constraints: BoxConstraints(
                 minHeight: min,
                 maxHeight: SizeConfig.blockSizeVertical * 100 > min ? SizeConfig.blockSizeVertical * 100 : min
             ),
             child: Column(
                 children: <Widget>[
                   Flexible(flex: 6,fit: FlexFit.tight,child:
                         Center(child:SizedBox(child: SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child:Row(
                             children: <Widget>[
                               Container(
                                 constraints: BoxConstraints(
                                     minHeight: 200,
                                     maxHeight: 300
                                 ),height: card[0]?250:200,
                                 decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(10.0)), width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Fundall lifestyle card",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                               ),
                               SizedBox(width: 15.0),
                               Container(
                                   constraints: BoxConstraints(
                                       minHeight: 200,
                                       maxHeight: 300
                                   ),
                                   decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(10.0)),
                                   height: card[1]?250:200,width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Make debit card",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500))
                               ),
                               SizedBox(width: 15.0),
                               Container(
                                   constraints: BoxConstraints(
                                       minHeight: 200,
                                       maxHeight: 300
                                   ),
                                   decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(10.0)),
                                   height: card[2]?250:200,width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Fundall lifestyle card",style: TextStyle(color: Colors.black,fontSize:9,fontWeight: FontWeight.w500))
                               ),
                             ]),padding: EdgeInsets.only(bottom:10.0,top: 20.0,right: 10.0,left: 30.0),controller: sc,
                           ),width: double.infinity,height: 500.0,
                           ))),
                           Column(
                             children: <Widget>[
                               Text("      Pick a Card",style: TextStyle(color: Colors.black,fontSize: 27,fontWeight: FontWeight.w600)),
                               Divider(thickness: 0.5)
                             ],mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                           ),
                           Flexible(
                               child:ListView(
                                 children: <Widget>[
                                   ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.yellow,size: 17.0,),maxRadius: 20),title: Text("Lifestyle Pro",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17)),
                                       subtitle: Text("₦ 9,500",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 13,fontWeight: FontWeight.normal)),trailing: card[0]?Icon(Icons.check,color: Colors.black):null,selected: card[0],onTap: (){
                                     setState((){
                                       card[0]=true;card[1]=false;card[2]=false;
                                       sc.jumpTo(1.0);
                                     });
                                     },),
                                   Divider(thickness: 0.5),
                                   ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.pink,size: 17.0,),maxRadius: 25),title: Text("Lifestyle Premium",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17)),
                                       subtitle: Text("₦ 1,000",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 13,fontWeight: FontWeight.normal)),trailing: card[1]?Icon(Icons.check,color: Colors.black):null,selected: card[1],onTap: (){
                                         setState((){
                                           card[0]=false;card[1]=true;card[2]=false;
                                           sc.jumpTo(20*4.0);
                                         });
                                       }),
                                   Divider(thickness: 0.5),
                                   ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.red,size: 17.0,),maxRadius: 25),title: Text("Lifestyle Business",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 17)),
                                       subtitle: Text("₦ 1,200",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 13,fontWeight: FontWeight.normal)),trailing: card[2]?Icon(Icons.check,color: Colors.black):null,selected: card[2],onTap: (){
                                         setState((){
                                           card[0]=false;card[1]=false;card[2]=true;
                                           sc.jumpTo(20*5.0);
                                         });
                                       }),
                                   SizedBox(height: 80.0)
                                 ],padding: EdgeInsets.only(left:15.0,right: 20.0),dragStartBehavior: DragStartBehavior.start,
                               ),flex: 3,
                           )
                 ]
             ),
     ),top: false,bottom: true),
     backgroundColor: Colors.white,
         );
  }

 void _showDialog(BuildContext context) {
   // flutter defined function
   showDialog(
     context: context,
     builder: (BuildContext context) {
       // return object of type Dialog
       return AlertDialog(
         title: Align(child: CircleAvatar(backgroundColor: Color.fromRGBO(76, 232, 149, 1.0),maxRadius: 8),alignment: Alignment.centerRight),
         content: Container(
           child: Column(
             children: <Widget>[
               RichText(
                 text: TextSpan(
                   text: 'Yippeee!\n\n',
                   style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),
                   children: <TextSpan>[
                     TextSpan(text: 'Card Request Successful\nWelcome to tomorow', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17)),
                   ],
                 ),textAlign: TextAlign.center,
               ),
              SizedBox(height: 25.0),
              RaisedButton(onPressed: (){},child: Text("REFER YOUR FRIENDS & EARN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),color:Color.fromRGBO(76, 232, 149, 1.0),highlightColor: Colors.white,hoverColor: Colors.black,textColor: Colors.black87,padding: EdgeInsets.only(left: 20.0,right: 20.0)),
             ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
           ),height: 170.0,width: SizeConfig.blockSizeHorizontal*80
         ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),backgroundColor: Colors.white,
       );
     },
   );
 }



}