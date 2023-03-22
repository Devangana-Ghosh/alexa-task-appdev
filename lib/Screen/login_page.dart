
import 'package:alexa_shopping/widgets/custom_input.dart';
import 'package:alexa_shopping/widgets/product.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import 'constants.dart';



class LoginPage extends StatefulWidget {


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child:Container(
        width:double.infinity,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
          padding:EdgeInsets.only(
        top:12.0,),
            child:Text("Login To Your Account",
            textAlign: TextAlign.center,
            style:Constants.boldheading,),),
            Column(
              children:[
                CustomInput(
                  hintText:"Email..",
                ),
                CustomInput(
                  hintText: "Password..",
                ),
                CustomBtn(
                    text:"Login",
                  outlineBtn: false ,
                    onPressed: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductList()),
                        );
                      }
                      );
                    },
                ),
            ],
            ),
            Padding(
              padding:const EdgeInsets.only(
                bottom:16.0,
              ),
            child: CustomBtn(
                text:"Create Account",
                onPressed: () {},
               outlineBtn: true,


                  ),

    ),
    ],



              ),
            ),

        ),
     );

}}


