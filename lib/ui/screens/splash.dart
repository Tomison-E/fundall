import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundall/utils/sizeConfig.dart';
import 'package:fundall/utils/uiData.dart';

class Splash extends StatelessWidget{

  final min= 500.0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          child:  SafeArea(child:ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: min,
                    maxHeight: SizeConfig.blockSizeVertical * 100 > min
                        ? SizeConfig.blockSizeVertical * 100
                        : min),
                child:Padding(
                  padding: EdgeInsets.only(right:20.0,top: 20.0,left: 10.0),
                  child: Column(
                      children:[
                      Flexible(child:
                      Align(child:Image.asset("assets/images/logo.png",width: 200.0,height: 150.0,fit: BoxFit.cover),alignment: Alignment.centerLeft),flex: 1),
                        Flexible(child: Center(
                            child:RichText(
                          text: TextSpan(text: "A financial partner\n",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(text: "for everyone",style: TextStyle(color: Colors.white,fontSize: 55,fontWeight: FontWeight.w700))]
                        ))),flex: 9,fit: FlexFit.tight),
                        Flexible(child: FlatButton(onPressed: ()=> Navigator.pushNamed(context, UIData.loginRoute), child: Text("Start",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal)
                        )),flex: 1)
                      ],crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ),
              )),decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/bg.jpg"),fit: BoxFit.cover)),
        )
    );
  }



}