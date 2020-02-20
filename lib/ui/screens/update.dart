import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundall/utils/uiData.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:fundall/core/viewModels/userVM.dart';
import 'package:fundall/utils/sizeConfig.dart';
import 'package:provider/provider.dart';

class Update extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Update();
  }
}

// ignore: camel_case_types
class _Update extends State<Update>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final min = 500.0;

  Future<bool> addImage() async{
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    bool test;
    try {
      showInSnackBar("Updating ...");
      bool test = await Provider.of<UserVM>(context, listen: false)
          .updateAvatar(avatar: image.path);
      test? Navigator.pushNamed(context, UIData.fundingRoute):showInSnackBar("Update Unsuccessful");
    }
    catch(e){
      showInSnackBar(e.toString());
    }
    return test;
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(leading: GestureDetector(child:Text('     cancel',style: TextStyle(color: Colors.black,fontSize: 11)),onTap: ()=>Navigator.pop(context)),elevation: 0,backgroundColor: Colors.transparent,actions: <Widget>[
        GestureDetector(child:Text('next      ',style: TextStyle(color: Colors.black,fontSize: 11)),onTap: ()=>Navigator.pushNamed(context, UIData.fundingRoute))
      ],),
      body:ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: min,
                      maxHeight: SizeConfig.blockSizeVertical * 100 > min
                          ? SizeConfig.blockSizeVertical * 100
                          : min),
                  child: Padding(padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Flexible(flex: 12,child:Column(
                              children:[
                                RichText(text: TextSpan(text: "Update Avatar\n\n",style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),children: [
                                  TextSpan(text: "Your  better financial lifestyle awaits.",style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.normal),),
                                ]),textAlign: TextAlign.left),
                                Spacer(),
                                RaisedButton(onPressed: (){
                                    addImage();
                                },child: Text("Update Avatar"),),
                                Spacer(flex: 2),
                              ]
                          )),
                        ],crossAxisAlignment: CrossAxisAlignment.center,
                      ))
              )
          )
      ),backgroundColor: Colors.white,
    );
  }




}


