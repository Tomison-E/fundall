import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fundall/core/viewModels/userVM.dart';
import 'package:fundall/utils/uiData.dart';
import "package:provider/provider.dart";
import 'package:fundall/utils/sizeConfig.dart';

class Wallet extends StatelessWidget{
  final min=500.0;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserVM>(context, listen: false).user;
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: SafeArea(child: SingleChildScrollView(child:ConstrainedBox(
      constraints: BoxConstraints(
      minHeight: min,
          maxHeight: SizeConfig.blockSizeVertical * 100 > min ?  1080 : min
      ),
      child: Column(
          children: <Widget>[
      Row(
      children: <Widget>[
          IconButton(icon:Icon(Icons.forward,color: Colors.white,size: 30.0),onPressed: ()=>Navigator.pushNamed(context, UIData.cardsRoute)),
      Text("Fundall e-Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 27.0)),
        GestureDetector(child:CircleAvatar(backgroundImage: NetworkImage(user.avatar),maxRadius: 25),onTap: ()=>Navigator.pop(context))
      ],mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),
    SizedBox(height: 30.0),
            SizedBox(height: 1000,child:
            Container(
                constraints: BoxConstraints(
                    maxHeight: 250.0,minHeight: 250.0),padding: EdgeInsets.only(left: 30.0),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50.0) ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Center(child: Container(decoration: BoxDecoration(color: Color.fromRGBO(239, 241, 245, 1.0),borderRadius: BorderRadius.circular(5.0)),height: 6.0,width: 38.0)),
                   Padding(child: Row(
                      children:[
                        Text("cards",style: TextStyle(color: Colors.black,fontSize: 27.0,fontWeight: FontWeight.bold)),
                        Row(
                          children: <Widget>[
                            CircleAvatar(maxRadius: 3,backgroundColor: Colors.black),
                            SizedBox(width: 9.0),
                            CircleAvatar(maxRadius: 3,backgroundColor: Colors.black),
                          ],mainAxisAlignment: MainAxisAlignment.center,
                        )
                      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),padding: EdgeInsets.only(left: 20.0,right: 40.0,top: 10.0)),
                    SizedBox(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1.0),borderRadius: BorderRadius.circular(10.0)),
                          height: 150.0,width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Fundall lifestyle card",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(width: 15.0),
                        Container(
                          decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1.0),borderRadius: BorderRadius.circular(10.0)),
                          height: 150.0,width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Make debit card",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500))
                        ),
                        SizedBox(width: 15.0),
                        Container(
                          decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1.0),borderRadius: BorderRadius.circular(10.0)),
                          height: 150.0,width: (SizeConfig.blockSizeHorizontal*100-120.0)/2,child: Text("\n   Fundall lifestyle card",style: TextStyle(color: Colors.black,fontSize: 9,fontWeight: FontWeight.w500))
                        ),
                      ],padding: EdgeInsets.only(bottom:30.0,top: 20.0,right: 10.0),
                    ),width: double.infinity,height: 201.0,
                   ),
                    Padding(padding: EdgeInsets.only(right: 20.0,top: 30.0,bottom: 20.0),child:
                      Row(
                        children: <Widget>[
                          Text("    Today",style: TextStyle(color: Colors.black,fontSize: 27,fontWeight: FontWeight.w600)),
                          Text("View all",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal),)
                        ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.yellow),maxRadius: 25),title: Text("Tobiloba",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                        subtitle: Text("Just now",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 130  ",style: TextStyle(color: Color.fromRGBO(77, 232, 152, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.pink),maxRadius: 25),title: Text("Grocery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("12:00PM",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 100  ",style: TextStyle(color: Color.fromRGBO(255, 21, 119, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.red),maxRadius: 25),title: Text("Shopping",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("8:00AM",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 35    ",style: TextStyle(color: Color.fromRGBO(255, 21, 119, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.green),maxRadius: 25),title: Text("Alvare",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("Just now",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 30    ",style: TextStyle(color: Color.fromRGBO(77, 232, 152, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.orange),maxRadius: 25),title: Text("Tobiloba",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("Just now",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 130  ",style: TextStyle(color: Color.fromRGBO(77, 232, 152, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.purple),maxRadius: 25),title: Text("Grocery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("12:00PM",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 100  ",style: TextStyle(color: Color.fromRGBO(255, 21, 119, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.yellow),maxRadius: 25),title: Text("Shopping",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("8:00AM",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 35    ",style: TextStyle(color: Color.fromRGBO(255, 21, 119, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                        ListTile(leading: CircleAvatar(backgroundColor: Color.fromRGBO(239, 241, 245, 1.0),child: Icon(Icons.shop_two,color: Colors.yellow),maxRadius: 25),title: Text("Alvare",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15)),
                            subtitle: Text("Just now",style:TextStyle(color: Color.fromRGBO(195, 200, 216, 1.0),fontSize: 12,fontWeight: FontWeight.normal)),trailing: Text("₦ 30    ",style: TextStyle(color: Color.fromRGBO(77, 232, 152, 1.0),fontSize: 15,fontWeight: FontWeight.w800))),
                  ],crossAxisAlignment: CrossAxisAlignment.start,
                )
            ),)
    ]
    )
    )),top: true,bottom: false,
    ),decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover))
    ));
  }

}