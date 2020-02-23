
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundall/core/viewModels/userVM.dart';
import 'package:fundall/utils/sizeConfig.dart';
import 'package:fundall/utils/uiData.dart';
import "package:provider/provider.dart";

class Funding extends StatelessWidget{
  final min=500.0;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserVM>(context, listen: false).user;
    return Scaffold(
        body: Container(
        constraints: const BoxConstraints.expand(),
    child: SafeArea(child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: min,
    maxHeight: SizeConfig.blockSizeVertical * 100 > min ? SizeConfig.blockSizeVertical * 100 : min
    ),
    child: Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          IconButton(icon:Icon(Icons.forward,color: Colors.white,size: 30.0),onPressed: ()=>Navigator.pushNamed(context, UIData.walletRoute),),
      Text("Fundall e-Wallet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 27.0)),
      GestureDetector(child:CircleAvatar(backgroundImage: user==null?AssetImage("assets/images/avatar.png"):NetworkImage(user.avatar),maxRadius: 25),onTap: ()=>Navigator.pop(context))
        ],mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
        SizedBox(height: 20.0),
        RichText(text: TextSpan(text: "Account ID:",style: TextStyle(color: Colors.white,fontSize: 12.0,fontWeight: FontWeight.bold),children: [
          TextSpan(text: " 901672789,Providus",style: TextStyle(color: Color.fromRGBO(196, 196, 196, 1.0),fontSize: 12.0,fontWeight: FontWeight.normal))
        ]),),
      Spacer(),
      RichText(text: TextSpan(text: "Total Balance\n",style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.normal),children: [
        TextSpan(text: "₦12,634.37",style: TextStyle(color: Colors.white,fontSize: 32.0,fontWeight: FontWeight.bold))
      ]),textAlign: TextAlign.center,),
      SizedBox(height: 30.0),
      Row(
        children: <Widget>[
          RichText(text: TextSpan(text: "Income\n",style: TextStyle(color: Color.fromRGBO(196, 196, 196, 1.0),fontSize: 12.0,fontWeight: FontWeight.normal),children: [
            TextSpan(text: "₦12,634.37",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold))
          ]),),
          RichText(text: TextSpan(text: "Spent\n",style: TextStyle(color: Color.fromRGBO(196, 196, 196, 1.0),fontSize: 12.0,fontWeight: FontWeight.normal),children: [
            TextSpan(text: "₦12,634.37",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold))
          ]),),
        ],mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      Spacer(),
Flexible(child: Container(
     constraints: BoxConstraints(
       maxHeight: 500.0,minHeight: 500.0),
          decoration: BoxDecoration(color: Color.fromRGBO(14, 16, 21, 1.0),borderRadius: BorderRadius.circular(50.0)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15.0),
               Center(child:SizedBox(
                 child:Column(
                   children:[
                     Row(
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.home,color: Colors.orange),maxRadius: 12,),
                    SizedBox(width: 10.0),
                    GestureDetector(child: Text("Request for a new Lifestyle Card",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold)))
                  ],mainAxisAlignment: MainAxisAlignment.start,
                ),
                     SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.email,color: Colors.teal),maxRadius: 12),
                    SizedBox(width: 10.0),
                    GestureDetector(child: Text("Add other cards",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold)))
                  ],mainAxisAlignment: MainAxisAlignment.start,
                ),
                     SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.settings,color: Colors.amberAccent),maxRadius: 12,),
                    SizedBox(width: 10.0),
                    GestureDetector(child: Text("Manage card settings",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold)))
                  ],mainAxisAlignment: MainAxisAlignment.start,
                ),
                ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 ),width: 250.0,
               )
               ),
                SizedBox(height: 30.0),
            Container(
              constraints: BoxConstraints(
                  maxHeight: 400.0,minHeight: 400.0),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(50.0)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Center(child: Container(decoration: BoxDecoration(color: Color.fromRGBO(239, 241, 245, 1.0),borderRadius: BorderRadius.circular(5.0)),height: 6.0,width: 38.0)),
                  Padding(child:Row(
                    children:[
                      Text("Cards",style: TextStyle(color: Colors.black,fontSize: 27.0,fontWeight: FontWeight.bold)),
                      Row(
                        children: <Widget>[
                          CircleAvatar(maxRadius: 3,backgroundColor: Colors.black),
                          SizedBox(width: 9.0),
                          CircleAvatar(maxRadius: 3,backgroundColor: Colors.black),
                        ],mainAxisAlignment: MainAxisAlignment.center,
                      )
                    ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),padding: EdgeInsets.only(left: 50.0,right: 40.0,top: 10.0),
                  ),
                  Flexible(child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1.0),borderRadius: BorderRadius.circular(10.0)),
                        height: 181.0,width: (SizeConfig.blockSizeHorizontal*100-70.0)/2,
                      ),
                      SizedBox(width: 30.0),
                      Container(
                        decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1.0),borderRadius: BorderRadius.circular(20.0)),
                        height: 181.0,width: (SizeConfig.blockSizeHorizontal*100-70.0)/2,
                      ),
                    ],padding: EdgeInsets.only(bottom:30.0,left: 20.0,right: 20.0,top: 20.0),
                  )
                 )
                ],crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
            )

              ],mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),width: double.infinity,
        ),flex: 10,fit: FlexFit.tight)
    ],crossAxisAlignment: CrossAxisAlignment.center,
    )
    ),bottom: false,left: false,right: false,
    ),decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover)),
        )
    );
  }

}